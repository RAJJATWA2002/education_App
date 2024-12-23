import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<Map<String, String>> items = [
  {'image': 'assets/images/python.png', 'name': 'Python', 'level': 'beginner'},
  {'image': 'assets/images/java.png', 'name': 'Java', 'level': 'beginner'},
  {'image': 'assets/images/cplus.png', 'name': 'C++', 'level': 'beginner'},
  {
    'image': 'assets/images/javaScript.png',
    'name': 'Javascript',
    'level': 'beginner'
  },
  {'image': 'assets/images/r.png', 'name': 'R', 'level': 'beginner'},
  {'image': 'assets/images/swift.png', 'name': 'Swift', 'level': 'beginner'},
  {'image': 'assets/images/python.png', 'name': 'Python', 'level': 'beginner'},
  {'image': 'assets/images/java.png', 'name': 'Java', 'level': 'beginner'},
  {'image': 'assets/images/cplus.png', 'name': 'C++', 'level': 'beginner'},
  {
    'image': 'assets/images/javaScript.png',
    'name': 'Javascript',
    'level': 'beginner'
  },
  {'image': 'assets/images/r.png', 'name': 'R', 'level': 'beginner'},
  {'image': 'assets/images/swift.png', 'name': 'Swift', 'level': 'beginner'},
  {'image': 'assets/images/python.png', 'name': 'Python', 'level': 'beginner'},
  {'image': 'assets/images/java.png', 'name': 'Java', 'level': 'beginner'},
  {'image': 'assets/images/cplus.png', 'name': 'C++', 'level': 'beginner'},
  {
    'image': 'assets/images/javaScript.png',
    'name': 'Javascript',
    'level': 'beginner'
  },
  {'image': 'assets/images/r.png', 'name': 'R', 'level': 'beginner'},
  {'image': 'assets/images/swift.png', 'name': 'Swift', 'level': 'beginner'},
  {'image': 'assets/images/python.png', 'name': 'Python', 'level': 'beginner'},
  {'image': 'assets/images/java.png', 'name': 'Java', 'level': 'beginner'},
  {'image': 'assets/images/cplus.png', 'name': 'C++', 'level': 'beginner'},
  {
    'image': 'assets/images/javaScript.png',
    'name': 'Javascript',
    'level': 'beginner'
  },
  {'image': 'assets/images/r.png', 'name': 'R', 'level': 'beginner'},
  {'image': 'assets/images/swift.png', 'name': 'Swift', 'level': 'beginner'},
  {'image': 'assets/images/python.png', 'name': 'Python', 'level': 'beginner'},
  {'image': 'assets/images/java.png', 'name': 'Java', 'level': 'beginner'},
  {'image': 'assets/images/cplus.png', 'name': 'C++', 'level': 'beginner'},
  {
    'image': 'assets/images/javaScript.png',
    'name': 'Javascript',
    'level': 'beginner'
  },
  {'image': 'assets/images/r.png', 'name': 'R', 'level': 'beginner'},
  {'image': 'assets/images/swift.png', 'name': 'Swift', 'level': 'beginner'},
  {'image': 'assets/images/python.png', 'name': 'Python', 'level': 'beginner'},
  {'image': 'assets/images/java.png', 'name': 'Java', 'level': 'beginner'},
  {'image': 'assets/images/cplus.png', 'name': 'C++', 'level': 'beginner'},
  {
    'image': 'assets/images/javaScript.png',
    'name': 'Javascript',
    'level': 'beginner'
  },
  {'image': 'assets/images/r.png', 'name': 'R', 'level': 'beginner'},
  {'image': 'assets/images/swift.png', 'name': 'Swift', 'level': 'beginner'},
  {'image': 'assets/images/python.png', 'name': 'Python', 'level': 'beginner'},
  {'image': 'assets/images/java.png', 'name': 'Java', 'level': 'beginner'},
  {'image': 'assets/images/cplus.png', 'name': 'C++', 'level': 'beginner'},
  {
    'image': 'assets/images/javaScript.png',
    'name': 'Javascript',
    'level': 'beginner'
  },
  {'image': 'assets/images/r.png', 'name': 'R', 'level': 'beginner'},
  {'image': 'assets/images/swift.png', 'name': 'Swift', 'level': 'beginner'},
  {'image': 'assets/images/python.png', 'name': 'Python', 'level': 'beginner'},
  {'image': 'assets/images/java.png', 'name': 'Java', 'level': 'beginner'},
  {'image': 'assets/images/cplus.png', 'name': 'C++', 'level': 'beginner'},
  {
    'image': 'assets/images/javaScript.png',
    'name': 'Javascript',
    'level': 'beginner'
  },
  {'image': 'assets/images/r.png', 'name': 'R', 'level': 'beginner'},
  {'image': 'assets/images/swift.png', 'name': 'Swift', 'level': 'beginner'},
  {'image': 'assets/images/python.png', 'name': 'Python', 'level': 'beginner'},
  {'image': 'assets/images/java.png', 'name': 'Java', 'level': 'beginner'},
  {'image': 'assets/images/cplus.png', 'name': 'C++', 'level': 'beginner'},
  {
    'image': 'assets/images/javaScript.png',
    'name': 'Javascript',
    'level': 'beginner'
  },
  {'image': 'assets/images/r.png', 'name': 'R', 'level': 'beginner'},
  {'image': 'assets/images/swift.png', 'name': 'Swift', 'level': 'beginner'},
  {'image': 'assets/images/python.png', 'name': 'Python', 'level': 'beginner'},
  {'image': 'assets/images/java.png', 'name': 'Java', 'level': 'beginner'},
  {'image': 'assets/images/cplus.png', 'name': 'C++', 'level': 'beginner'},
  {
    'image': 'assets/images/javaScript.png',
    'name': 'Javascript',
    'level': 'beginner'
  },
  {'image': 'assets/images/r.png', 'name': 'R', 'level': 'beginner'},
  {'image': 'assets/images/swift.png', 'name': 'Swift', 'level': 'beginner'},
  {'image': 'assets/images/python.png', 'name': 'Python', 'level': 'beginner'},
  {'image': 'assets/images/java.png', 'name': 'Java', 'level': 'beginner'},
  {'image': 'assets/images/cplus.png', 'name': 'C++', 'level': 'beginner'},
  {
    'image': 'assets/images/javaScript.png',
    'name': 'Javascript',
    'level': 'beginner'
  },
  {'image': 'assets/images/r.png', 'name': 'R', 'level': 'beginner'},
  {'image': 'assets/images/swift.png', 'name': 'Swift', 'level': 'beginner'},
  {'image': 'assets/images/python.png', 'name': 'Python', 'level': 'beginner'},
  {'image': 'assets/images/java.png', 'name': 'Java', 'level': 'beginner'},
  {'image': 'assets/images/cplus.png', 'name': 'C++', 'level': 'beginner'},
  {
    'image': 'assets/images/javaScript.png',
    'name': 'Javascript',
    'level': 'beginner'
  },
  {'image': 'assets/images/r.png', 'name': 'R', 'level': 'beginner'},
  {'image': 'assets/images/swift.png', 'name': 'Swift', 'level': 'beginner'},
  {'image': 'assets/images/python.png', 'name': 'Python', 'level': 'beginner'},
  {'image': 'assets/images/java.png', 'name': 'Java', 'level': 'beginner'},
  {'image': 'assets/images/cplus.png', 'name': 'C++', 'level': 'beginner'},
  {
    'image': 'assets/images/javaScript.png',
    'name': 'Javascript',
    'level': 'beginner'
  },
  {'image': 'assets/images/r.png', 'name': 'R', 'level': 'beginner'},
  {'image': 'assets/images/swift.png', 'name': 'Swift', 'level': 'beginner'},
  {'image': 'assets/images/python.png', 'name': 'Python', 'level': 'beginner'},
  {'image': 'assets/images/java.png', 'name': 'Java', 'level': 'beginner'},
  {'image': 'assets/images/cplus.png', 'name': 'C++', 'level': 'beginner'},
  {
    'image': 'assets/images/javaScript.png',
    'name': 'Javascript',
    'level': 'beginner'
  },
  {'image': 'assets/images/r.png', 'name': 'R', 'level': 'beginner'},
  {'image': 'assets/images/swift.png', 'name': 'Swift', 'level': 'beginner'},
  {'image': 'assets/images/python.png', 'name': 'Python', 'level': 'beginner'},
  {'image': 'assets/images/java.png', 'name': 'Java', 'level': 'beginner'},
  {'image': 'assets/images/cplus.png', 'name': 'C++', 'level': 'beginner'},
  {
    'image': 'assets/images/javaScript.png',
    'name': 'Javascript',
    'level': 'beginner'
  },
  {'image': 'assets/images/r.png', 'name': 'R', 'level': 'beginner'},
  {'image': 'assets/images/swift.png', 'name': 'Swift', 'level': 'beginner'},
  {'image': 'assets/images/python.png', 'name': 'Python', 'level': 'beginner'},
  {'image': 'assets/images/java.png', 'name': 'Java', 'level': 'beginner'},
  {'image': 'assets/images/cplus.png', 'name': 'C++', 'level': 'beginner'},
  {
    'image': 'assets/images/javaScript.png',
    'name': 'Javascript',
    'level': 'beginner'
  },
  {'image': 'assets/images/r.png', 'name': 'R', 'level': 'beginner'},
  {'image': 'assets/images/swift.png', 'name': 'Swift', 'level': 'beginner'},
  {'image': 'assets/images/python.png', 'name': 'Python', 'level': 'beginner'},
  {'image': 'assets/images/java.png', 'name': 'Java', 'level': 'beginner'},
  {'image': 'assets/images/cplus.png', 'name': 'C++', 'level': 'beginner'},
  {
    'image': 'assets/images/javaScript.png',
    'name': 'Javascript',
    'level': 'beginner'
  },
  {'image': 'assets/images/r.png', 'name': 'R', 'level': 'beginner'},
  {'image': 'assets/images/swift.png', 'name': 'Swift', 'level': 'beginner'},
  {'image': 'assets/images/python.png', 'name': 'Python', 'level': 'beginner'},
  {'image': 'assets/images/java.png', 'name': 'Java', 'level': 'beginner'},
  {'image': 'assets/images/cplus.png', 'name': 'C++', 'level': 'beginner'},
  {
    'image': 'assets/images/javaScript.png',
    'name': 'Javascript',
    'level': 'beginner'
  },
  {'image': 'assets/images/r.png', 'name': 'R', 'level': 'beginner'},
  {'image': 'assets/images/swift.png', 'name': 'Swift', 'level': 'beginner'},
  {'image': 'assets/images/python.png', 'name': 'Python', 'level': 'beginner'},
  {'image': 'assets/images/java.png', 'name': 'Java', 'level': 'beginner'},
  {'image': 'assets/images/cplus.png', 'name': 'C++', 'level': 'beginner'},
  {
    'image': 'assets/images/javaScript.png',
    'name': 'Javascript',
    'level': 'beginner'
  },
  {'image': 'assets/images/r.png', 'name': 'R', 'level': 'beginner'},
  {'image': 'assets/images/swift.png', 'name': 'Swift', 'level': 'beginner'},
  {'image': 'assets/images/python.png', 'name': 'Python', 'level': 'beginner'},
  {'image': 'assets/images/java.png', 'name': 'Java', 'level': 'beginner'},
  {'image': 'assets/images/cplus.png', 'name': 'C++', 'level': 'beginner'},
  {
    'image': 'assets/images/javaScript.png',
    'name': 'Javascript',
    'level': 'beginner'
  },
  {'image': 'assets/images/r.png', 'name': 'R', 'level': 'beginner'},
  {'image': 'assets/images/swift.png', 'name': 'Swift', 'level': 'beginner'},
];

class Ebook extends StatefulWidget {
  @override
  _Ebook createState() => _Ebook();
}

class _Ebook extends State<Ebook> {
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
            'ebooks',
            style: TextStyle(color: Color(0XFFFFFFFF)),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 33.0),
            child: Image.asset(
              'assets/icons/ebooks.png',
              height: 20,
              width: 20,
            ),
          )
        ],
      ),
      body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 33, right: 33, bottom: 20, top: 0),
          child: GridView.builder(
            itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.8),
            itemBuilder: (context, Index) {
              return Column(
                children: [
                  Container(
                    child: Image.asset(
                      items[Index]['image']!,
                      height: 90,
                      width: 90,
                    ),
                  ),
                  Text(
                    items[Index]['name']!,
                    style: TextStyle(
                      color: Color(0XFFF2F2F2),
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    items[Index]['level']!,
                    style: TextStyle(
                      color: Color(0XFFF2F2F2).withOpacity(0.6),
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      overflow: TextOverflow.ellipsis,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  // SizedBox(
                  //   height: 15,
                  // )
                ],
              );
            },
          )),
    );
  }
}
