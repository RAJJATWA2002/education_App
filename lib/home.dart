import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/certificates.dart';
import 'package:education_app/loginpage.dart';
import 'package:education_app/notifications.dart';
import 'package:education_app/settingss.dart';
import 'package:education_app/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  void initState() {
    super.initState();
    getvalue();
  }

  String name = '';
  String email = '';
  String photoUrl = '';
  String uid = '';

  void getvalue() async {
    var prefs = await SharedPreferences.getInstance();

    setState(() {
      name = prefs.getString('name') ?? '';
      email = prefs.getString('email') ?? '';
      uid = prefs.getString('uid') ?? '';
      photoUrl = prefs.getString('photoUrl') ?? '';
    });
  }

  void getAllValues() async {
    var prefs = await SharedPreferences.getInstance();

    // Get all keys from SharedPreferences
    Set<String> keys = prefs.getKeys();

    // Print each key-value pair
    for (String key in keys) {
      var value = prefs.get(key);
      print("datat call :-$key: $value");
    }
  }

  final List<Map<String, String>> items = [
    {'image': 'assets/images/python.png', 'label': 'Python'},
    {'image': 'assets/images/flutter.png', 'label': 'Flutter'},
    {'image': 'assets/images/cplusplus.png', 'label': 'C++'},
    {'image': 'assets/images/dataAnalytics.png', 'label': 'Data\nAnalytics'},
    {
      'image': 'assets/images/machineLearning.png',
      'label': 'Machine\nLearning'
    },
    {'image': 'assets/images/cloudcomputing.png', 'label': 'Cloud\nComputing'},
    {'image': 'assets/images/fb.png', 'label': 'Fb'},
    {'image': 'assets/images/python.png', 'label': 'Python'},
    {'image': 'assets/images/flutter.png', 'label': 'Flutter'},
    {'image': 'assets/images/cplusplus.png', 'label': 'C++'},
    {'image': 'assets/images/dataAnalytics.png', 'label': 'Data\nAnalytics'},
    {
      'image': 'assets/images/machineLearning.png',
      'label': 'Machine\nLearning'
    },
  ];
  final List<Map<String, String>> rec = [
    {
      'image': 'assets/images/machineLearning.png',
      'label': 'Machine\nLearning'
    },
    {'image': 'assets/images/cloudcomputing.png', 'label': 'Cloud\nComputing'},
    {'image': 'assets/images/dataAnalytics.png', 'label': 'Data\nAnalytics'},
    {'image': 'assets/images/python.png', 'label': 'Python'},
    {'image': 'assets/images/flutter.png', 'label': 'Flutter'},
    {'image': 'assets/images/cplusplus.png', 'label': 'C++'},
    {'image': 'assets/images/cloudcomputing.png', 'label': 'Cloud\nComputing'},
    {'image': 'assets/images/fb.png', 'label': 'Fb'},
    {'image': 'assets/images/python.png', 'label': 'Python'},
    {'image': 'assets/images/flutter.png', 'label': 'Flutter'},
    {'image': 'assets/images/cplusplus.png', 'label': 'C++'},
    {'image': 'assets/images/dataAnalytics.png', 'label': 'Data\nAnalytics'},
    {
      'image': 'assets/images/machineLearning.png',
      'label': 'Machine\nLearning'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0Xff666d73),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 106,
        backgroundColor: Color(0Xff666d73),
        title: Padding(
          padding: const EdgeInsets.only(left: 33),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome!',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Color(0XFFFFFFFF)),
                ),
                Text(name,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Poppins',
                        color: Color(0XFFFFFFFF)))
              ],
            ),
          ),
        ),
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 33.0),
              child: Image.asset(
                'assets/icons/notification.png',
                height: 20,
                width: 19,
              ),
            ),
            onTap: () {
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Notifications()));
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 33.0),
            child: Builder(
              builder: (context) => GestureDetector(
                child: Image.asset(
                  'assets/icons/menu.png',
                  height: 29,
                  width: 31,
                ),
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ),
          ),
        ],
      ),
      endDrawer: Align(
        alignment: Alignment.topRight,
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.65),
          child: Drawer(
            backgroundColor: Color(0XFF363E40),
            width: 240,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 33,
              ),
              margin: EdgeInsets.only(top: 73, bottom: 0),
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      '$name\n$email',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Color(0XFFF2F2F2),
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          fontSize: 14),
                    ),
                    leading: GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: Color(0XFFFFFFFF),
                        radius: 20,
                        child: Image.network(photoUrl),
                      ),
                      onTap: () {
                        print('lsdfjlskfjlsk ohodfis :');
                        getAllValues();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/icons/certificate.png',
                      height: 20,
                      width: 19,
                    ),
                    title: Text(
                      'Certificates',
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Certificates()));
                    },
                  ),
                  ListTile(
                    leading: Image.asset('assets/icons/notification.png',
                        height: 20, width: 19),
                    title: Text(
                      'Notification',
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Notifications()));
                    },
                  ),
                  ListTile(
                    leading: Image.asset('assets/icons/settings.png',
                        height: 20, width: 19),
                    title: Text(
                      'Settings',
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Settingss()));
                    },
                  ),
                  ListTile(
                    leading: Image.asset('assets/icons/logout.png',
                        height: 20, width: 19),
                    title: Text(
                      'Logout',
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    onTap: () async {
                      SharedPreferences shared =
                          await SharedPreferences.getInstance();
                      shared.setBool(SplashState.Keylogin, false);
                      await shared.clear();
                      await FirebaseAuth.instance.signOut();
                      GoogleSignIn googleSignIn = GoogleSignIn();
                      googleSignIn.signOut();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Loginpage()));
                    },
                  ),
                  ListTile(
                    leading: Image.asset('assets/icons/exit.png',
                        height: 20, width: 19),
                    title: Text(
                      'Exit',
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    onTap: () async {
                      SharedPreferences share =
                          await SharedPreferences.getInstance();

                      await share.clear();
                      await share.setBool(SplashState.Keylogin, false);
                      await FirebaseAuth.instance.signOut();
                      GoogleSignIn googleSignIn = GoogleSignIn();
                      await googleSignIn.signOut();

                      SystemNavigator.pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 33.0,
            right: 33,
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 19),
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22.5),
                  color: Color(0XFFF2F2F2),
                ),
                child: TextField(
                  style: TextStyle(
                    color: Color(0XFF232426),
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                  keyboardType: TextInputType.name,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      hintText: ' Search',
                      hintStyle: TextStyle(
                          color: Color(0XFF232426),
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                      suffixIcon: Icon(
                        Icons.search_rounded,
                        color: Color(0XFF949FA6),
                        // size: 30,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  autocorrect: true,
                  cursorColor: Color(0XFFF2F2F2),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 21,
                margin: EdgeInsets.only(top: 29),
                child: Text(
                  'Course in progress',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: Color(0XFFFFFFFF)),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 27),
                height: 140,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: items.map(
                      (item) {
                        return Container(
                          height: 140,
                          width: 85,
                          child: Column(
                            children: [
                              Image.asset(
                                item['image']!,
                                height: 70,
                                width: 70,
                              ),
                              SizedBox(height: 20),
                              Text(
                                item['label']!,
                                style: TextStyle(
                                    color: Color(0XFFF2F2F2),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 21,
                margin: EdgeInsets.only(
                  top: 15,
                ),
                child: Text(
                  'Recommeded',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: Color(0XFFFFFFFF)),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 27),
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 140,
                        width: 85,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              rec[index]['image']!,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: 20),
                            Text(
                              rec[index]['label']!,
                              style: TextStyle(
                                  color: Color(0XFFF2F2F2),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
