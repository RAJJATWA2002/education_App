import 'package:education_app/loginpage.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Account extends StatefulWidget {
  @override
  _Account createState() => _Account();
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

class _Account extends State<Account> {
  @override
  void initState() {
    super.initState();
    getValue();
  }

  DateTime selectedDate = DateTime.now();
  DateTime? picked;

  bool pickedVisible = false;
  bool? dateColor;

  final FirebaseFirestore store = FirebaseFirestore.instance;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  // final TextEditingController educationController = TextEditingController();
  bool isnameCheked = false;
  bool isEmailCheked = false;
  bool isAddressCheked = false;
  bool isDobCheked = false;
  bool isEducationCheked = false;
  bool isShareCheked = false;
  bool isLoguout = false;

  String name = '';
  String email = '';
  String dob = '';
  String address = '';
  String education = '';
  String uid = '';

  void getValue() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '';
      email = prefs.getString('email') ?? '';
      dob = prefs.getString('dob') ?? '';
      address = prefs.getString('address') ?? '';
      education = prefs.getString('education') ?? '';
      uid = prefs.getString('uid') ?? '';
    });
  }

  void setName(String newName, String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', newName);
    await store.collection('users').doc(uid).update({'name': newName});
    print('New Name :$newName');
  }

  void setEmail(String newEmail, String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', newEmail);
    await store.collection('users').doc(uid).update({'email': email});
  }

  void setAddress(String newAddress, String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('address', newAddress);
    await store.collection('users').doc(uid).update({'address': newAddress});
  }

  void setDob(String newDob, String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('dob', newDob);
    await store.collection('users').doc(uid).update({'dob': newDob});
  }

  void setEducation(String newEducation, String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('education', newEducation);
    await store
        .collection('users')
        .doc(uid)
        .update({'education': newEducation});
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
        dobController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
        dob = dobController.text;
        setDob(dob, uid);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0Xff666d73),
      appBar: AppBar(
        toolbarHeight: 106,
        backgroundColor: Color(0Xff666d73),
        leading: Padding(
          padding: EdgeInsets.only(left: 33.0),
          child: BackButton(
            color: Color(0XFFFFFFFF),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 34.0),
          child: Text(
            'Accounts',
            style: TextStyle(color: Color(0XFFFFFFFF)),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 33.0),
            child: Image.asset(
              'assets/icons/accounts.png',
              height: 20,
              width: 20,
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 73, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      isnameCheked = !isnameCheked;
                    });
                  },
                  child: isnameCheked
                      ? Container(
                          alignment: Alignment.centerLeft,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                child: Container(
                                  child: Text(
                                    '$name',
                                    style: TextStyle(
                                      color: Color(0XFFF2F2F2),
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  margin: EdgeInsets.all(5),
                                ),
                                onTap: () {
                                  setState(() {
                                    isnameCheked = false;
                                  });
                                },
                              ),
                              Container(
                                height: 41,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Color(0XFFFFFFFF).withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    showCursor: true,
                                    controller: nameController,
                                    autofocus: true,
                                    cursorColor: Color(0XFFF2F2F2),
                                    decoration: InputDecoration(
                                      hintStyle:
                                          TextStyle(color: Color(0xFFF2F2F2)),
                                      hintText: 'Change Name',
                                      border: InputBorder.none,
                                    ),
                                    style: TextStyle(color: Color(0XFFF2F2F2)),
                                    onFieldSubmitted: (value) {
                                      setState(() {
                                        name = value;
                                        setName(name, uid);
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: Color(0XFF6C63FF),
                              borderRadius: BorderRadius.circular(5)),
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 20),
                          height: 41,
                          child: Text(
                            '$name',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0XFFF2F2F2),
                                overflow: TextOverflow.ellipsis),
                          ),
                        )),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      isEmailCheked = !isEmailCheked;
                    });
                  },
                  child: isEmailCheked
                      ? Container(
                          alignment: Alignment.centerLeft,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                child: Container(
                                  child: Text(
                                    '$email',
                                    style: TextStyle(
                                      color: Color(0XFFF2F2F2),
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  margin: EdgeInsets.all(5),
                                ),
                                onTap: () {
                                  setState(() {
                                    isEmailCheked = false;
                                  });
                                },
                              ),
                              Container(
                                height: 41,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Color(0XFFFFFFFF).withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    showCursor: true,
                                    controller: emailController,
                                    autofocus: true,
                                    cursorColor: Color(0XFFF2F2F2),
                                    decoration: InputDecoration(
                                      hintStyle:
                                          TextStyle(color: Color(0xFFF2F2F2)),
                                      hintText: '+Add Account',
                                      border: InputBorder.none,
                                    ),
                                    style: TextStyle(color: Color(0XFFF2F2F2)),
                                    onFieldSubmitted: (value) {
                                      setState(() {
                                        email = value;
                                        setEmail(email, uid);
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: Color(0XFF6C63FF),
                              borderRadius: BorderRadius.circular(5)),
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 20),
                          height: 41,
                          child: Text(
                            '$email',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0XFFF2F2F2),
                                overflow: TextOverflow.ellipsis),
                          ),
                        )),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      isAddressCheked = !isAddressCheked;
                    });
                  },
                  child: isAddressCheked
                      ? Container(
                          alignment: Alignment.centerLeft,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                child: Container(
                                  child: Text(
                                    '$address',
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Color(0XFFF2F2F2),
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  margin: EdgeInsets.all(5),
                                ),
                                onTap: () {
                                  setState(() {
                                    isAddressCheked = false;
                                  });
                                },
                              ),
                              Container(
                                height: 50,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Color(0XFFFFFFFF).withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: TextFormField(
                                    maxLines: 2,
                                    keyboardType: TextInputType.text,
                                    showCursor: true,
                                    controller: addressController,
                                    autofocus: true,
                                    cursorColor: Color(0XFFF2F2F2),
                                    decoration: InputDecoration(
                                      helperMaxLines: 2,
                                      hintStyle:
                                          TextStyle(color: Color(0xFFF2F2F2)),
                                      hintText: 'Modify',
                                      border: InputBorder.none,
                                    ),
                                    style: TextStyle(color: Color(0XFFF2F2F2)),
                                    onFieldSubmitted: (value) {
                                      setState(() {
                                        address = value;
                                        setAddress(address, uid);
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: Color(0XFF6C63FF),
                              borderRadius: BorderRadius.circular(5)),
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 20),
                          height: 41,
                          child: Text(
                            '$address',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0XFFF2F2F2),
                                overflow: TextOverflow.ellipsis),
                          ),
                        )),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      isDobCheked = !isDobCheked;
                    });
                  },
                  child: isDobCheked
                      ? Container(
                          alignment: Alignment.centerLeft,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                child: Container(
                                  child: Text(
                                    dob,
                                    style: TextStyle(
                                      color: Color(0XFFF2F2F2),
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  margin: EdgeInsets.all(5),
                                ),
                                onTap: () {
                                  setState(() {
                                    isDobCheked = false;
                                  });
                                },
                              ),
                              Container(
                                height: 41,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Color(0XFFFFFFFF).withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: TextFormField(
                                    readOnly: true,
                                    onTap: () {
                                      selectDate(context);
                                    },
                                    controller: dobController,
                                    // autofocus: true,
                                    cursorColor: Color(0XFFF2F2F2),
                                    decoration: InputDecoration(
                                      hintStyle:
                                          TextStyle(color: Color(0xFFF2F2F2)),
                                      hintText: 'Modify',
                                      border: InputBorder.none,
                                    ),
                                    style: TextStyle(color: Color(0XFFF2F2F2)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: Color(0XFF6C63FF),
                              borderRadius: BorderRadius.circular(5)),
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 20),
                          height: 41,
                          child: Text(
                            dob,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0XFFF2F2F2),
                                overflow: TextOverflow.ellipsis),
                          ),
                        )),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      isEducationCheked = !isEducationCheked;
                    });
                  },
                  child: isEducationCheked
                      ? Container(
                          alignment: Alignment.centerLeft,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                child: Container(
                                  child: Text(
                                    education,
                                    style: TextStyle(
                                      color: Color(0XFFF2F2F2),
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  margin: EdgeInsets.all(5),
                                ),
                                onTap: () {
                                  setState(() {
                                    isEducationCheked = false;
                                  });
                                },
                              ),
                              Container(
                                height: 41,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Color(0XFFFFFFFF).withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: DropdownButton<String>(
                                      isExpanded: true,
                                      dropdownColor: Color(0Xff666d73),
                                      value: dropdownValue,
                                      underline: SizedBox.shrink(),
                                      items: items.map((String items) {
                                        return DropdownMenuItem<String>(
                                            value: items,
                                            child: Text(
                                              items,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0XFFFFFFFF)),
                                            ));
                                      }).toList(),
                                      onChanged: (String? newEducation) {
                                        setState(() {
                                          dropdownValue = newEducation!;
                                          education = dropdownValue;
                                          setEducation(education, uid);
                                        });
                                        print(education);
                                      }),
                                ),
                              )
                            ],
                          ),
                        )
                      : Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: Color(0XFF6C63FF),
                              borderRadius: BorderRadius.circular(5)),
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 20),
                          height: 41,
                          child: Text(
                            education,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0XFFF2F2F2),
                                overflow: TextOverflow.ellipsis),
                          ),
                        )),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      isShareCheked = !isShareCheked;
                    });
                  },
                  child: isShareCheked
                      ? Container(
                          alignment: Alignment.centerLeft,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Share your Certificates and\nand hold',
                                style: TextStyle(
                                    color: Color(0XFFF2F2F2), fontSize: 11),
                                textAlign: TextAlign.start,
                              ),
                              GestureDetector(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  decoration: BoxDecoration(
                                      color: Color(0XFFFFFFFF).withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Share',
                                          style: TextStyle(
                                              color: Color(0XFFF2F2F2)),
                                        ),
                                        Image.asset(
                                            'assets/icons/forwardicon.png')
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () {},
                              )
                            ],
                          ),
                        )
                      : Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: Color(0XFF6C63FF),
                              borderRadius: BorderRadius.circular(5)),
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 20),
                          height: 41,
                          child: Text(
                            'Share',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0XFFF2F2F2),
                                overflow: TextOverflow.ellipsis),
                          ),
                        )),
              GestureDetector(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Color(0XFF6C63FF),
                      borderRadius: BorderRadius.circular(5)),
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 20),
                  height: 41,
                  child: Text(
                    'Logout',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0XFFF2F2F2),
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                onTap: () async {
                  SharedPreferences shared =
                      await SharedPreferences.getInstance();
                  await shared.clear();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Loginpage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
