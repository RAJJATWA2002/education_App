import 'package:education_app/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settingss extends StatefulWidget {
  @override
  State<Settingss> createState() => _Settingss();
}

class _Settingss extends State<Settingss> {
  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0Xff666d73),
      appBar: AppBar(
        backgroundColor: Color(0XFF6d73),
        toolbarHeight: 106,
        leading: Padding(
          padding: EdgeInsets.only(left: 33.0),
          child: BackButton(
            color: Color(0XFFFFFFFF),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 34.0),
          child: Text(
            'Settings',
            style: TextStyle(color: Color(0XFFFFFFFF)),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 33.0),
            child: Image.asset(
              'assets/icons/settingsPicon.png',
              height: 20,
              width: 20,
            ),
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 460,
        margin: EdgeInsets.symmetric(
          horizontal: 33,
        ),
        padding: EdgeInsets.only(left: 40, right: 40, top: 67),
        decoration: BoxDecoration(
            color: Color(0XFF363E40), borderRadius: BorderRadius.circular(10)),
        child: ListView(
          children: [
            ListTile(
              leading: Image.asset('assets/icons/accounts.png'),
              title: Text(
                'Accounts settings',
                style: TextStyle(
                    color: Color(0XFFFFFFFF),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            ListTile(
              leading: Image.asset(
                'assets/icons/notification.png',
                height: 20,
                width: 20,
              ),
              title: Text(
                'Notifications',
                style: TextStyle(
                    color: Color(0XFFFFFFFF),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            SizedBox(
              height: 40,
              child: Container(
                padding: EdgeInsets.only(left: 25),
                color: Colors.transparent,
                child: Row(
                  children: [
                    Text(
                      'App notification',
                      style: TextStyle(
                          color: Color(0XFFFFFFFF),
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          overflow: TextOverflow.ellipsis),
                    ),
                    SizedBox(width: 15),
                    FlutterSwitch(
                      width: 32,
                      height: 16,
                      borderRadius: 16,
                      padding: 0.0,
                      toggleSize: 12,
                      activeColor: Colors.blue,
                      inactiveColor: Color(0XFF363E40),
                      toggleColor: Color(0xFFF2F2F2),
                      switchBorder: Border.all(
                        color: Color(0XFF6C63FF),
                        width: 1,
                      ),
                      value: isSwitch,
                      onToggle: (val) {
                        setState(
                          () {
                            print('$val');
                            isSwitch = val;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Image.asset(
                'assets/icons/languageicon.png',
                height: 20,
                width: 20,
              ),
              title: Text(
                'Language & Region',
                style: TextStyle(
                    color: Color(0XFFFFFFFF),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            ListTile(
              leading: Image.asset(
                'assets/icons/privacy.png',
                height: 20,
                width: 20,
              ),
              title: Text(
                'Privacy settings',
                style: TextStyle(
                    color: Color(0XFFFFFFFF),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            ListTile(
              leading: Image.asset(
                'assets/icons/about.png',
                height: 20,
                width: 20,
              ),
              title: Text(
                'About',
                style: TextStyle(
                    color: Color(0XFFFFFFFF),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            GestureDetector(
              child: ListTile(
                leading: Image.asset(
                  'assets/icons/logout.png',
                  height: 20,
                  width: 20,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                      color: Color(0XFFFFFFFF),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
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
    );
  }
}
