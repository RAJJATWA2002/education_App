import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  @override
  _Register createState() => _Register();
}

const List<String> items = [
  'Bachelor of Arts (B.A)',
  'Bachelor of Commerce (B.Com)',
  'Bachelor of Business Administration',
  'Bachelor of Computer Applications',
  'Bachelor of Science',
  'Bachelor of Physiotherapy',
  'Bachelor of Journalism and Mass Communication',
  'Bachelor of Pharmacy',
  'Bachelor of Engineering',
  'Master of Arts',
  'Master of Science',
  'Master of Business Administration',
  'Master of Computer Applications',
  'Master of Engineering'
];
String dropdownValue = 'Bachelor of Arts (B.A)';

DateTime selectedDate = DateTime.now();
DateTime? picked;

bool pickedVisible = false;
bool? dateColor;

class _Register extends State<Register> {
  TextEditingController nameControlloer = TextEditingController();
  TextEditingController emailControlloer = TextEditingController();
  TextEditingController dobControlloer = TextEditingController();
  TextEditingController addressControlloer = TextEditingController();
  TextEditingController passControlloer = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String dob = '';
  String address = '';
  String education = '';
  String password = '';
  DateTime lastSignIn = DateTime.now();

  FocusNode _nameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _dobFocusNode = FocusNode();
  FocusNode _addressFocusNode = FocusNode();
  FocusNode _educationFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _dobFocusNode.dispose();
    _addressFocusNode.dispose();
    _educationFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> registration() async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailControlloer.text.trim(),
              password: passControlloer.text.trim());

      User? user = userCredential.user;

      if (user != null) {
        await _storUserData(user);
        _shoSuccessDialog();
        print('User registered successfully with ID: ${user.uid}');
      }
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthException(e);
    }
  }

  Future<void> _storUserData(User user) async {
    await user.updateProfile(displayName: nameControlloer.text.trim());
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'name': nameControlloer.text.trim(),
      'email': emailControlloer.text.trim(),
      'dob': dobControlloer.text.trim(),
      'address': addressControlloer.text.trim(),
      'education': dropdownValue,
      'uid': user.uid,
      'lastSignIn': lastSignIn,
    });
  }

  void _handleFirebaseAuthException(FirebaseAuthException e) {
    String errorMessage = e.message ?? 'An unknown error occurred';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          errorMessage,
          style: TextStyle(
            color: Color(0XFFF2F2F2),
            fontFamily: 'Poppins',
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  void _shoSuccessDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0XFF666d73),
            title: Text(
              "Registration Successfull",
              style: TextStyle(
                  color: Color(0XFFF2F2F2),
                  fontFamily: 'Poppins',
                  fontSize: 16),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Loginpage()));
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ))
            ],
          );
        });
  }

  Future<void> selectDate(BuildContext context) async {
    picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2035),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked!;
        pickedVisible = true;
        dateColor = true;
        print("PickedDate$pickedVisible");
        dobControlloer = TextEditingController(
          text: pickedVisible //ternary expression to check if date is null
              ? "${DateFormat('dd/MM/yyyy').format(selectedDate)}"
              : 'Visible Date!',
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0Xff666d73),
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: EdgeInsets.only(left: 33, right: 33, top: 130),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 27,
                    margin: EdgeInsets.only(bottom: 39),
                    child: Text(
                      'Register Account',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          color: Color(0XFFFFFFFF),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(bottom: 16),
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
                          child: TextFormField(
                            controller: nameControlloer,
                            focusNode: _nameFocusNode,
                            keyboardType: TextInputType.name,
                            style: TextStyle(
                              color: Color(
                                  0xFFFFFFFF), // Simplified color definition
                            ),
                            cursorColor: Color(0xFFFFFFFF),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'user Name',
                              hintStyle: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 14,
                              ), // Ensures no additional padding inside the TextField
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Name';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              name = value!;
                            },
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_emailFocusNode);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(bottom: 16),
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
                            "assets/icons/email.png",
                            height: 22, // Adjust size as needed
                            width: 19,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: emailControlloer,
                            focusNode: _emailFocusNode,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                            ),
                            cursorColor: Color(0xFFFFFFFF),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'email',
                              hintStyle: TextStyle(
                                color: Color(0xFFFFFFFF),
                                // Simplified color definition
                                fontSize: 14,
                              ),
                              contentPadding: EdgeInsets
                                  .zero, // Ensures no additional padding inside the TextField
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter your Email";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              email = value!;
                            },
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_dobFocusNode);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 3,
                        color: Colors.red,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 13),
                          child: Image.asset(
                            "assets/icons/calender.png",
                            height: 22, // Adjust size as needed
                            width: 19,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            readOnly: true,
                            onTap: () {
                              selectDate(context);
                            },
                            controller: dobControlloer,
                            focusNode: _dobFocusNode,
                            keyboardType: TextInputType.datetime,
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                            ),
                            cursorColor: Color(0xFFFFFFFF),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'date of birth',
                              hintStyle: TextStyle(
                                color: Color(0xFFFFFFFF),
                                // Simplified color definition
                                fontSize: 14,
                              ),
                              contentPadding: EdgeInsets
                                  .zero, // Ensures no additional padding inside the TextField
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter your DOB';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              dob = value!;
                            },
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_addressFocusNode);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(bottom: 16),
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
                          child: Icon(
                            Icons.place_outlined,
                            color: Color(0xFFF2F2F2).withOpacity(0.8),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: addressControlloer,
                            focusNode: _addressFocusNode,
                            keyboardType: TextInputType.streetAddress,
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                            ),
                            cursorColor: Color(0xFFFFFFFF),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'address',
                              hintStyle: TextStyle(
                                color: Color(0xFFFFFFFF),
                                // Simplified color definition
                                fontSize: 14,
                              ),
                              contentPadding: EdgeInsets
                                  .zero, // Ensures no additional padding inside the TextField
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your address';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              address = value!;
                            },
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_educationFocusNode);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(bottom: 16),
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
                            "assets/icons/education.png",
                            height: 22, // Adjust size as needed
                            width: 19,
                          ),
                        ),
                        Expanded(
                          child: DropdownButton(
                              focusNode: _educationFocusNode,
                              isExpanded: true,
                              dropdownColor: Color(0Xff666d73),
                              menuMaxHeight: 250,
                              menuWidth: 250,
                              value: dropdownValue,
                              underline: SizedBox.shrink(),
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                    value: items,
                                    child: Text(
                                      items,
                                      style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 14),
                                    ));
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                                print(dropdownValue);
                              }),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(bottom: 16),
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
                            "assets/icons/lock.png",
                            height: 22, // Adjust size as needed
                            width: 19,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: passControlloer,
                            focusNode: _passwordFocusNode,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                            ),
                            cursorColor: Color(0xFFFFFFFF),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'password',
                              hintStyle: TextStyle(
                                color: Color(0xFFFFFFFF),
                                // Simplified color definition
                                fontSize: 14,
                              ), // Ensures no additional padding inside the TextField
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Password';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              password = value!;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 38),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: Color(0XFFFFFFFF),
                          ),
                        ),
                        InkWell(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: Color(0XFF949FA6),
                            ),
                          ),
                          onTap: () {
                            print('Login here');
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Loginpage()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(top: 30),
                          // padding: EdgeInsets.symmetric(horizontal: 100),
                          alignment: Alignment.center,
                          height: 30,
                          width: 90,
                          child: Text(
                            "Register",
                            style: TextStyle(
                                color: Color(0XFFFFFFFF),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins'),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xFF232426),
                          ),
                        ),
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              name = nameControlloer.text;
                              email = emailControlloer.text;
                              dob = dobControlloer.text;
                              address = addressControlloer.text;
                              education = dropdownValue;
                              password = passControlloer.text;
                              lastSignIn = lastSignIn;
                            });
                            registration();
                          }
                        }),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
