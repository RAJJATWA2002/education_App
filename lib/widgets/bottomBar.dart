import 'package:education_app/home.dart';
import 'package:flutter/material.dart';
import 'package:education_app/account.dart';
import 'package:education_app/ebook.dart';
import 'package:education_app/certificates.dart';

class BottomBar extends StatefulWidget {
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Ebook(),
    Certificates(),
    Account(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0Xff666d73),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: Container(
        height: 52,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 33),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BottomNavigationBar(
            backgroundColor: Color(0XFFFFFFFF),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(
                  _selectedIndex != 0
                      ? 'assets/icons/home.png'
                      : 'assets/icons/homedark.png',
                  height: 17,
                  width: 17,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  _selectedIndex != 1
                      ? 'assets/icons/ebookicon.png'
                      : 'assets/icons/ebooksdark.png',
                  height: 17,
                  width: 17,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  _selectedIndex != 2
                      ? 'assets/icons/certificates.png'
                      : 'assets/icons/certificatesdark.png',
                  height: 17,
                  width: 17,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  _selectedIndex != 3
                      ? 'assets/icons/admin.png'
                      : 'assets/icons/admindark.png',
                  height: 17,
                  width: 17,
                ),
                label: '',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
