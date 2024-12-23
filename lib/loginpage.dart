import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/register.dart';
import 'package:education_app/splash.dart';
import 'package:education_app/widgets/bottomBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loginpage extends StatefulWidget {
  @override
  _Loginpage createState() => _Loginpage();
}

class _Loginpage extends State<Loginpage> {
  var emailText = TextEditingController();
  var passwordText = TextEditingController();
  bool isSwitch = false;
  bool isLoading = false;

  String email = '';
  String pass = '';

  static Future<User?> signWithGoogle({required BuildContext context}) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication?.idToken,
          accessToken: googleSignInAuthentication?.accessToken);
      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        final user = userCredential.user;
        print(user!.uid);

        if (user != null) {
          await LoadingAnimationWidget.bouncingBall(
              color: Color(0xFFFFFFFF), size: 200);
          await storeUserDataToFirestore(user);
          await retriveUserData(user.uid).then((_) {
            _showSuccessDialog(context);
            Future.delayed(Duration(seconds: 1), () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => BottomBar()),
              );
            });
          }).catchError((onError) {
            print('Erororo 2 ' + onError.toString());
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  onError.toString(),
                  style: TextStyle(
                    color: Color(0XFFF2F2F2),
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                ),
              ),
            );
          });
        }
      } on FirebaseException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          print("Error 1 :- ${e.toString()}");
        } else if (e.code == 'invalid-credential') {
          print("Error 2 :- ${e.toString()}");
        }
      } catch (e) {
        print('Error 3:-${e.toString()}');
      }
    }
    return user;
  }

  static Future<void> storeUserDataToFirestore(User user) async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');

    return users.doc(user.uid).set({
      'uid': user.uid,
      'name': user.displayName,
      'email': user.email,
      'photoUrl': user.photoURL,
      'lastSignIn': DateTime.now(),
    }).then((value) {
      print("User Data Added");
    }).catchError((error) {
      print("Failed to add user: $error");
    });
  }

  void userLogin() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      final user = userCredential.user;
      print(user?.uid);
      if (user != null) {
        await LoadingAnimationWidget.bouncingBall(
            color: Color(0xFFFFFFFF), size: 200);
        await retriveUserData(user.uid).then((_) {
          print('User data retrieved successfully');
          _showSuccessDialog(context);
          Future.delayed(Duration(seconds: 1), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BottomBar()),
            );
          });
        }).catchError((onError) {
          print('Cathed erro' + onError.toString());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                onError.toString(),
                style: TextStyle(
                  color: Color(0XFFF2F2F2),
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
            ),
          );
        });
      }
    } on FirebaseAuthException catch (e) {
      final String errormessage;
      if (e.code == 'user-not-found') {
        errormessage = 'No user fount for the email';
      } else if (e.code == 'wrong-password') {
        errormessage = 'Wrong Password';
      } else {
        errormessage = 'Ab unknown error occured';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            errormessage,
            style: TextStyle(
              color: Color(0XFFF2F2F2),
              fontFamily: 'Poppins',
              fontSize: 16,
            ),
          ),
        ),
      );
      print('Second error' + errormessage.toString());
    }
  }

  static Future<void> retriveUserData(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(SplashState.Keylogin, true);
    try {
      final DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (userDoc.exists) {
        final Map<String, dynamic> userData =
            userDoc.data() as Map<String, dynamic>;
        String name = userData['name'] ?? '';
        String email = userData['email'] ?? '';
        String dob = userData['dob'] ?? '';
        String address = userData['address'] ?? '';
        String education = userData['education'] ?? '';
        String uid = userData['uid'] ?? '';
        String photoUrl = userData['photoUrl'] ?? '';
        Timestamp lastSignInTimestamp =
            userData['lastSignIn'] ?? Timestamp.now();
        DateTime lastSignIn = lastSignInTimestamp.toDate();

        print('fdfsdfsdfsdfsd ;;;$userData');
        prefs.setString('name', name);
        prefs.setString('email', email);
        prefs.setString('dob', dob);
        prefs.setString('address', address);
        prefs.setString('education', education);
        prefs.setString('uid', uid);
        prefs.setString('photoUrl', photoUrl);
        prefs.setInt('lastSignIn', lastSignIn.microsecondsSinceEpoch);
        print('fdfsdfsdfsdfsd ;;;$userData');
      } else {
        print('User data not found.');
      }
    } on FirebaseAuthException catch (e) {
      print('Error retrieving user data: ' + e.toString());
    }
  }

  static Future<void> _showSuccessDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0XFF666d73),
          title: Text(
            'Login Successfull',
            style: TextStyle(
                color: Color(0XFFF2F2F2), fontFamily: 'Poppins', fontSize: 16),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0Xff666d73),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 125,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  await signWithGoogle(context: context);
                },
                child: Container(
                  height: 50,
                  width: 295,
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFF949FA6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/goggle.png',
                        height: 28,
                        width: 28,
                      ),
                      Text(
                        'Log In with Google',
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 28,
                        width: 28,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 36),
              GestureDetector(
                onTap: () {
                  print('Facebook login');
                },
                child: Container(
                  height: 50,
                  width: 295,
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFF949FA6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/fb.png',
                        height: 28,
                        width: 28,
                      ),
                      Text(
                        'Log In with Facebook',
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 28,
                        width: 28,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 36),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 129,
                      height: 2,
                      decoration: BoxDecoration(
                        color: const Color(0xFF949FA6),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    Container(
                        child: Text(
                      'or',
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    )),
                    Container(
                      width: 129,
                      height: 2,
                      decoration: BoxDecoration(
                        color: const Color(0xFF949FA6),
                        borderRadius: BorderRadius.circular(
                            7.5), // Adjusted from 0.3 * fem
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 46,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 32),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 3,
                    color: Color(0XFF949FA6),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 13),
                      child: Image.asset(
                        'assets/icons/user.png',
                        height: 22, // Adjust size as needed
                        width: 19,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: emailText,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color:
                              Color(0xFFFFFFFF), // Simplified color definition
                        ),
                        cursorColor: Color(0xFFFFFFFF),
                        // Simplified color definition
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Your Email',
                          hintStyle: TextStyle(
                            color: Color(0xFFFFFFFF),
                            // Simplified color definition
                            fontSize: 14,
                          ),
                          contentPadding: EdgeInsets
                              .zero, // Ensures no additional padding inside the TextField
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 36),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 32),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 3,
                    color: Color(0XFF949FA6),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 13),
                      child: Image.asset(
                        'assets/icons/lock.png',
                        height: 22, // Adjust size as needed
                        width: 19,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: passwordText,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        style: TextStyle(
                          color:
                              Color(0xFFFFFFFF), // Simplified color definition
                        ),
                        cursorColor: Color(0xFFFFFFFF),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              GestureDetector(
                child: Container(
                    height: 15,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      'Forgot password',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                          color: Color(0XFFF2F2F2),
                          fontFamily: 'Poppins'),
                    )),
                onTap: () {
                  print("forgot Password");
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 23),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        "Remember me",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Color(0xFFFFFFFF)),
                      ),
                      margin: EdgeInsets.only(right: 13),
                    ),
                    FlutterSwitch(
                        width: 32,
                        height: 16,
                        borderRadius: 16,
                        padding: 0.0,
                        toggleSize: 12,
                        activeColor: Colors.blue,
                        inactiveColor: Color(0XFF666d73),
                        toggleColor: Color(0xFFF2F2F2),
                        switchBorder:
                            Border.all(color: Color(0XFF6C63FF), width: 1),
                        value: isSwitch,
                        onToggle: (val) {
                          setState(() {
                            isSwitch = val;
                            print('$val');
                          });
                        })
                  ],
                ),
              ),
              GestureDetector(
                  child: Center(
                    child: Container(
                      height: 30,
                      width: 90,
                      margin: EdgeInsets.only(top: 48),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0XFF949FA6),
                      ),
                      child: Text(
                        'Log in',
                        style: TextStyle(
                            color: Color(0XFFF2F2F2),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                  onTap: () {
                    if (emailText.text.isEmpty || passwordText.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('enter your Email and Password.')));
                    } else {
                      setState(() {
                        email = emailText.text;
                        pass = passwordText.text;
                      });
                      userLogin();
                    }
                  }),
              Container(
                padding: EdgeInsets.only(left: 68),
                margin: EdgeInsets.only(top: 43),
                child: Row(
                  children: [
                    Text(
                      "Don't have an account ?",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: Color(0XFFFFFFFF)),
                    ),
                    InkWell(
                      child: Text(' register here',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: Color(0XFF949FA6))),
                      onTap: () {
                        print('Register here');
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Register()),
                        );
                      }, // splashColor: Colors.blue
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Future<void> getLastSignIn() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   int? lastSignInMillis = prefs.getInt('lastSignIn');
//
//   if (lastSignInMillis != null) {
//     DateTime lastSignIn = DateTime.fromMillisecondsSinceEpoch(lastSignInMillis);
//     print('Last sign-in date: $lastSignIn');
//   } else {
//     print('Last sign-in date not found.');
//   }
// }
