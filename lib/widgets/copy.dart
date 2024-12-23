// import 'package:education_app/loginpage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class Register extends StatefulWidget {
//   @override
//   _Register createState() => _Register();
// }
//
// class _Register extends State<Register> {
//
//
//   TextEditingController nameControlloer = TextEditingController();
//   TextEditingController emailControlloer = TextEditingController();
//   TextEditingController dobControlloer = TextEditingController();
//   TextEditingController ageControlloer = TextEditingController();
//   TextEditingController educationControlloer = TextEditingController();
//   TextEditingController passControlloer = TextEditingController();
//
//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//   String name = '';
//   String email = '';
//   String dob = '';
//   String age = '';
//   String education = '';
//   String password = '';
//
//   FocusNode _nameFocusNode = FocusNode();
//   FocusNode _emailFocusNode = FocusNode();
//   FocusNode _dobFocusNode = FocusNode();
//   FocusNode _ageFocusNode = FocusNode();
//   FocusNode _educationFocusNode = FocusNode();
//   FocusNode _passwordFocusNode = FocusNode();
//
//   @override
//   void dispose() {
//     _nameFocusNode.dispose();
//     _emailFocusNode.dispose();
//     _dobFocusNode.dispose();
//     _ageFocusNode.dispose();
//     _educationFocusNode.dispose();
//     _passwordFocusNode.dispose();
//     super.dispose();
//   }
//
//   void registration() async {
//     if (name.isNotEmpty &&
//         email.isNotEmpty &&
//         dob.isNotEmpty &&
//         age.isNotEmpty &&
//         education.isNotEmpty &&
//         password.isNotEmpty) {
//       try {
//         UserCredential userCredential = await FirebaseAuth.instance
//             .createUserWithEmailAndPassword(email: email, password: password);
//         _shoSuccessDialog();
//       } on FirebaseAuthException catch (e) {
//         String errorMessage = e.message ?? 'An unknown error occurred';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               errorMessage,
//               style: TextStyle(
//                 color: Color(0XFFF2F2F2),
//                 fontFamily: 'Poppins',
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         );
//       }
//     }
//   }
//
//   void _shoSuccessDialog() {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             backgroundColor: Color(0XFF666d73),
//             title: Text(
//               "Registration Successfull",
//               style: TextStyle(
//                   color: Color(0XFFF2F2F2),
//                   fontFamily: 'Poppins',
//                   fontSize: 16),
//             ),
//             actions: <Widget>[
//               TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                     Navigator.pushReplacement(context,
//                         MaterialPageRoute(builder: (context) => Loginpage()));
//                   },
//                   child: Text(
//                     'OK',
//                     style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue),
//                   ))
//             ],
//           );
//         });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color(0Xff666d73),
//         body: SingleChildScrollView(
//           child: Form(
//             key: _formkey,
//             child: Padding(
//               padding: EdgeInsets.only(left: 33, right: 33, top: 130),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Container(
//                     height: 27,
//                     margin: EdgeInsets.only(bottom: 39),
//                     child: Text(
//                       'Register Account',
//                       style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: 18,
//                           color: Color(0XFFFFFFFF),
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   Container(
//                     height: 50,
//                     margin: EdgeInsets.only(bottom: 16),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       border: Border.all(
//                         width: 3,
//                         color: Color(0XFF949FA6),
//                       ),
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 13),
//                           child: Image.asset(
//                             'assets/icons/user.png',
//                             height: 22, // Adjust size as needed
//                             width: 19,
//                           ),
//                         ),
//                         Expanded(
//                           child: TextFormField(
//                             controller: nameControlloer,
//                             focusNode: _nameFocusNode,
//                             keyboardType: TextInputType.name,
//                             style: TextStyle(
//                               color: Color(
//                                   0xFFFFFFFF), // Simplified color definition
//                             ),
//                             cursorColor: Color(0xFFFFFFFF),
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText: 'user Name',
//                               hintStyle: TextStyle(
//                                 color: Color(0xFFFFFFFF),
//                                 fontSize: 14,
//                               ), // Ensures no additional padding inside the TextField
//                             ),
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Please Enter Your Name';
//                               }
//                               return null;
//                             },
//                             onSaved: (value) {
//                               name = value!;
//                             },
//                             onFieldSubmitted: (_) {
//                               FocusScope.of(context)
//                                   .requestFocus(_emailFocusNode);
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     height: 50,
//                     margin: EdgeInsets.only(bottom: 16),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       border: Border.all(
//                         width: 3,
//                         color: Color(0XFF949FA6),
//                       ),
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 13),
//                           child: Image.asset(
//                             "assets/icons/email.png",
//                             height: 22, // Adjust size as needed
//                             width: 19,
//                           ),
//                         ),
//                         Expanded(
//                           child: TextFormField(
//                             controller: emailControlloer,
//                             focusNode: _emailFocusNode,
//                             keyboardType: TextInputType.emailAddress,
//                             style: TextStyle(
//                               color: Color(0xFFFFFFFF),
//                             ),
//                             cursorColor: Color(0xFFFFFFFF),
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText: 'email',
//                               hintStyle: TextStyle(
//                                 color: Color(0xFFFFFFFF),
//                                 // Simplified color definition
//                                 fontSize: 14,
//                               ),
//                               contentPadding: EdgeInsets
//                                   .zero, // Ensures no additional padding inside the TextField
//                             ),
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return "Please Enter your Email";
//                               }
//                               return null;
//                             },
//                             onSaved: (value) {
//                               email = value!;
//                             },
//                             onFieldSubmitted: (_) {
//                               FocusScope.of(context)
//                                   .requestFocus(_dobFocusNode);
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     height: 50,
//                     margin: EdgeInsets.only(bottom: 16),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       border: Border.all(
//                         width: 3,
//                         color: Color(0XFF949FA6),
//                       ),
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 13),
//                           child: Image.asset(
//                             "assets/icons/calender.png",
//                             height: 22, // Adjust size as needed
//                             width: 19,
//                           ),
//                         ),
//                         Expanded(
//                           child: TextFormField(
//                             controller: dobControlloer,
//                             focusNode: _dobFocusNode,
//                             keyboardType: TextInputType.datetime,
//                             style: TextStyle(
//                               color: Color(0xFFFFFFFF),
//                             ),
//                             cursorColor: Color(0xFFFFFFFF),
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText: 'date of birth',
//                               hintStyle: TextStyle(
//                                 color: Color(0xFFFFFFFF),
//                                 // Simplified color definition
//                                 fontSize: 14,
//                               ),
//                               contentPadding: EdgeInsets
//                                   .zero, // Ensures no additional padding inside the TextField
//                             ),
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Please Enter your DOB';
//                               }
//                               return null;
//                             },
//                             onSaved: (value) {
//                               dob = value!;
//                             },
//                             onFieldSubmitted: (_) {
//                               FocusScope.of(context)
//                                   .requestFocus(_ageFocusNode);
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     height: 50,
//                     margin: EdgeInsets.only(bottom: 16),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       border: Border.all(
//                         width: 3,
//                         color: Color(0XFF949FA6),
//                       ),
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 13),
//                           child: Image.asset(
//                             "assets/icons/age.png",
//                             height: 22, // Adjust size as needed
//                             width: 19,
//                           ),
//                         ),
//                         Expanded(
//                           child: TextFormField(
//                             controller: ageControlloer,
//                             focusNode: _ageFocusNode,
//                             keyboardType: TextInputType.number,
//                             style: TextStyle(
//                               color: Color(0xFFFFFFFF),
//                             ),
//                             cursorColor: Color(0xFFFFFFFF),
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText: 'age',
//                               hintStyle: TextStyle(
//                                 color: Color(0xFFFFFFFF),
//                                 // Simplified color definition
//                                 fontSize: 14,
//                               ),
//                               contentPadding: EdgeInsets
//                                   .zero, // Ensures no additional padding inside the TextField
//                             ),
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Please Enter Your Age';
//                               }
//                               return null;
//                             },
//                             onSaved: (value) {
//                               age = value!;
//                             },
//                             onFieldSubmitted: (_) {
//                               FocusScope.of(context)
//                                   .requestFocus(_educationFocusNode);
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     height: 50,
//                     margin: EdgeInsets.only(bottom: 16),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       border: Border.all(
//                         width: 3,
//                         color: Color(0XFF949FA6),
//                       ),
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 13),
//                           child: Image.asset(
//                             "assets/icons/education.png",
//                             height: 22, // Adjust size as needed
//                             width: 19,
//                           ),
//                         ),
//                         Expanded(
//                           child: TextFormField(
//                             controller: educationControlloer,
//                             focusNode: _educationFocusNode,
//                             keyboardType: TextInputType.name,
//                             style: TextStyle(
//                               color: Color(0xFFFFFFFF),
//                             ),
//                             cursorColor: Color(0xFFFFFFFF),
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText: 'educational status',
//                               hintStyle: TextStyle(
//                                 color: Color(0xFFFFFFFF),
//                                 // Simplified color definition
//                                 fontSize: 14,
//                               ),
//                               contentPadding: EdgeInsets
//                                   .zero, // Ensures no additional padding inside the TextField
//                             ),
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Please Enter Your Education';
//                               }
//                               return null;
//                             },
//                             onSaved: (value) {
//                               education = value!;
//                             },
//                             onFieldSubmitted: (_) {
//                               FocusScope.of(context)
//                                   .requestFocus(_passwordFocusNode);
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     height: 50,
//                     margin: EdgeInsets.only(bottom: 16),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       border: Border.all(
//                         width: 3,
//                         color: Color(0XFF949FA6),
//                       ),
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 13),
//                           child: Image.asset(
//                             "assets/icons/lock.png",
//                             height: 22, // Adjust size as needed
//                             width: 19,
//                           ),
//                         ),
//                         Expanded(
//                           child: TextFormField(
//                             controller: passControlloer,
//                             focusNode: _passwordFocusNode,
//                             keyboardType: TextInputType.visiblePassword,
//                             obscureText: true,
//                             style: TextStyle(
//                               color: Color(0xFFFFFFFF),
//                             ),
//                             cursorColor: Color(0xFFFFFFFF),
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText: 'password',
//                               hintStyle: TextStyle(
//                                 color: Color(0xFFFFFFFF),
//                                 // Simplified color definition
//                                 fontSize: 14,
//                               ), // Ensures no additional padding inside the TextField
//                             ),
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Please Enter Your Password';
//                               }
//                               return null;
//                             },
//                             onSaved: (value) {
//                               password = value!;
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 38),
//                     padding: EdgeInsets.symmetric(horizontal: 30),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Already have an account? ",
//                           style: TextStyle(
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.normal,
//                             fontSize: 12,
//                             color: Color(0XFFFFFFFF),
//                           ),
//                         ),
//                         InkWell(
//                           child: Text(
//                             'Login',
//                             style: TextStyle(
//                               fontFamily: 'Poppins',
//                               fontWeight: FontWeight.normal,
//                               fontSize: 12,
//                               color: Color(0XFF949FA6),
//                             ),
//                           ),
//                           onTap: () {
//                             print('Login here');
//                             Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => Loginpage()),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                   Center(
//                     child: GestureDetector(
//                         child: Container(
//                           margin: EdgeInsets.only(top: 30),
//                           // padding: EdgeInsets.symmetric(horizontal: 100),
//                           alignment: Alignment.center,
//                           height: 30,
//                           width: 90,
//                           child: Text(
//                             "Register",
//                             style: TextStyle(
//                                 color: Color(0XFFFFFFFF),
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w500,
//                                 fontFamily: 'Poppins'),
//                           ),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Color(0xFF232426),
//                           ),
//                         ),
//                         onTap: () {
//                           if (_formkey.currentState!.validate()) {
//                             setState(() {
//                               name = nameControlloer.text;
//                               email = emailControlloer.text;
//                               dob = dobControlloer.text;
//                               age = ageControlloer.text;
//                               education = educationControlloer.text;
//                               password = passControlloer.text;
//                             });
//                             registration();
//                           }
//                         }),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }

//
// login page
//
// import 'package:education_app/register.dart';
// import 'package:education_app/widgets/bottomBar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_switch/flutter_switch.dart';
//
// class Loginpage extends StatefulWidget {
//   @override
//   _Loginpage createState() => _Loginpage();
// }
//
// class _Loginpage extends State<Loginpage> {
//   var emailText = TextEditingController();
//   var passwordText = TextEditingController();
//   bool isSwitch = false;
//
//   String email = '';
//   String pass = '';
//
//   void userLogin() async {
//     try {
//       final userCredential = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: pass);
//       final user = userCredential.user;
//
//       print(user?.uid);
//       if (user != null) {
//         for (final provideProfile in user.providerData) {
//           final provider = provideProfile.providerId;
//           final uid = provideProfile.uid;
//           final name = provideProfile.displayName;
//           final emaile = provideProfile.email;
//           final password = provideProfile.runtimeType;
//           print('name $provider\c $emaile\n $password');
//         }
//       }
//       _showSuccessDialog();
//       Future.delayed(Duration(seconds: 2), () {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => BottomBar()),
//         );
//       });
//     } on FirebaseAuthException catch (e) {
//       String errormessage;
//       if (e.code == 'user-not-found') {
//         errormessage = 'No user fount for the email';
//       } else if (e.code == 'wrong-password') {
//         errormessage = 'Wrong Password';
//       } else {
//         errormessage = 'Ab unknown error occured';
//       }
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(
//             errormessage,
//             style: TextStyle(
//               color: Color(0XFFF2F2F2),
//               fontFamily: 'Poppins',
//               fontSize: 16,
//             ),
//           ),
//         ),
//       );
//     }
//   }
//
//   void _showSuccessDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: Color(0XFF666d73),
//           title: Text(
//             'Login Successfull',
//             style: TextStyle(
//                 color: Color(0XFFF2F2F2), fontFamily: 'Poppins', fontSize: 16),
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0Xff666d73),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(
//             top: 125,
//           ),
//           // margin: EdgeInsets.symmetric(horizontal: 32),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   print('google login');
//                 },
//                 child: Container(
//                   height: 50,
//                   width: 295,
//                   margin: EdgeInsets.symmetric(horizontal: 32),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     color: Color(0xFF949FA6),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Image.asset(
//                         'assets/images/goggle.png',
//                         height: 28,
//                         width: 28,
//                       ),
//                       Text(
//                         'Log In with Google',
//                         style: TextStyle(
//                             color: Color(0xFFFFFFFF),
//                             fontFamily: 'Poppins',
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500),
//                       ),
//                       SizedBox(
//                         height: 28,
//                         width: 28,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 36),
//               GestureDetector(
//                 onTap: () {
//                   print('Facebook login');
//                 },
//                 child: Container(
//                   height: 50,
//                   width: 295,
//                   margin: EdgeInsets.symmetric(horizontal: 32),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     color: Color(0xFF949FA6),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Image.asset(
//                         'assets/images/fb.png',
//                         height: 28,
//                         width: 28,
//                       ),
//                       Text(
//                         'Log In with Facebook',
//                         style: TextStyle(
//                             color: Color(0xFFFFFFFF),
//                             fontFamily: 'Poppins',
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500),
//                       ),
//                       SizedBox(
//                         height: 28,
//                         width: 28,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 36),
//               Container(
//                 alignment: Alignment.center,
//                 margin: EdgeInsets.symmetric(horizontal: 32),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(
//                       width: 129,
//                       height: 2,
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF949FA6),
//                         borderRadius: BorderRadius.circular(2),
//                       ),
//                     ),
//                     Container(
//                         child: Text(
//                           'or',
//                           style: TextStyle(
//                               color: Color(0xFFFFFFFF),
//                               fontFamily: 'Poppins',
//                               fontSize: 14,
//                               fontWeight: FontWeight.normal),
//                         )),
//                     Container(
//                       width: 129,
//                       height: 2,
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF949FA6),
//                         borderRadius: BorderRadius.circular(
//                             7.5), // Adjusted from 0.3 * fem
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 46,
//               ),
//               Container(
//                 alignment: Alignment.center,
//                 margin: EdgeInsets.symmetric(horizontal: 32),
//                 height: 50,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   border: Border.all(
//                     width: 3,
//                     color: Color(0XFF949FA6),
//                   ),
//                 ),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 13),
//                       child: Image.asset(
//                         'assets/icons/user.png',
//                         height: 22, // Adjust size as needed
//                         width: 19,
//                       ),
//                     ),
//                     Expanded(
//                       child: TextField(
//                         controller: emailText,
//                         keyboardType: TextInputType.emailAddress,
//                         style: TextStyle(
//                           color:
//                           Color(0xFFFFFFFF), // Simplified color definition
//                         ),
//                         cursorColor: Color(0xFFFFFFFF),
//                         // Simplified color definition
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'Enter Your Email',
//                           hintStyle: TextStyle(
//                             color: Color(0xFFFFFFFF),
//                             // Simplified color definition
//                             fontSize: 14,
//                           ),
//                           contentPadding: EdgeInsets
//                               .zero, // Ensures no additional padding inside the TextField
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 36),
//               Container(
//                 alignment: Alignment.center,
//                 margin: EdgeInsets.symmetric(horizontal: 32),
//                 height: 50,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   border: Border.all(
//                     width: 3,
//                     color: Color(0XFF949FA6),
//                   ),
//                 ),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 13),
//                       child: Image.asset(
//                         'assets/icons/lock.png',
//                         height: 22, // Adjust size as needed
//                         width: 19,
//                       ),
//                     ),
//                     Expanded(
//                       child: TextField(
//                         controller: passwordText,
//                         keyboardType: TextInputType.visiblePassword,
//                         obscureText: true,
//                         style: TextStyle(
//                           color:
//                           Color(0xFFFFFFFF), // Simplified color definition
//                         ),
//                         cursorColor: Color(0xFFFFFFFF),
//                         // Simplified color definition
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'Password',
//                           hintStyle: TextStyle(
//                             color: Color(0xFFFFFFFF),
//                             // Simplified color definition
//                             fontSize: 14,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 12,
//               ),
//               GestureDetector(
//                 child: Container(
//                     height: 15,
//                     alignment: Alignment.centerRight,
//                     padding: EdgeInsets.symmetric(horizontal: 32),
//                     child: Text(
//                       'Forgot password',
//                       style: TextStyle(
//                           fontWeight: FontWeight.normal,
//                           fontSize: 10,
//                           color: Color(0XFFF2F2F2),
//                           fontFamily: 'Poppins'),
//                     )),
//                 onTap: () {
//                   print("forgot Password");
//                 },
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 10),
//                 padding: EdgeInsets.symmetric(horizontal: 23),
//                 child: Row(
//                   children: [
//                     Container(
//                       child: Text(
//                         "Remember me",
//                         style: TextStyle(
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.w500,
//                             fontSize: 13,
//                             color: Color(0xFFFFFFFF)),
//                       ),
//                       margin: EdgeInsets.only(right: 13),
//                     ),
//                     FlutterSwitch(
//                         width: 32,
//                         height: 16,
//                         borderRadius: 16,
//                         padding: 0.0,
//                         toggleSize: 12,
//                         activeColor: Colors.blue,
//                         inactiveColor: Color(0XFF666d73),
//                         toggleColor: Color(0xFFF2F2F2),
//                         switchBorder:
//                         Border.all(color: Color(0XFF6C63FF), width: 1),
//                         value: isSwitch,
//                         onToggle: (val) {
//                           setState(() {
//                             isSwitch = val;
//                             print('$val');
//                           });
//                         })
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                   child: Center(
//                     child: Container(
//                       height: 30,
//                       width: 90,
//                       margin: EdgeInsets.only(top: 48),
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Color(0XFF949FA6),
//                       ),
//                       child: Text(
//                         'Log in',
//                         style: TextStyle(
//                             color: Color(0XFFF2F2F2),
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'Poppins'),
//                       ),
//                     ),
//                   ),
//                   onTap: () {
//                     if (emailText.text.isEmpty || passwordText.text.isEmpty) {
//                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                           content: Text('enter your Email and Password.')));
//                     } else {
//                       setState(() {
//                         email = emailText.text;
//                         pass = passwordText.text;
//                       });
//                       userLogin();
//                     }
//                   }),
//               Container(
//                 padding: EdgeInsets.only(left: 68),
//                 margin: EdgeInsets.only(top: 43),
//                 child: Row(
//                   children: [
//                     Text(
//                       "Don't have an account ?",
//                       style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.normal,
//                           fontSize: 12,
//                           color: Color(0XFFFFFFFF)),
//                     ),
//                     InkWell(
//                       child: Text(' register here',
//                           style: TextStyle(
//                               fontFamily: 'Poppins',
//                               fontWeight: FontWeight.normal,
//                               fontSize: 12,
//                               color: Color(0XFF949FA6))),
//                       onTap: () {
//                         print('Register here');
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(builder: (context) => Register()),
//                         );
//                       }, // splashColor: Colors.blue
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
