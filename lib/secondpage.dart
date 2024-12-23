import 'package:education_app/loginpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Secondpage extends StatefulWidget {
  @override
  _Secondpage createState() => _Secondpage();
}

class _Secondpage extends State<Secondpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0Xff666d73),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only( top: 180.0),
              child: Image.asset(
                'assets/images/grades.png',
                fit: BoxFit.contain,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 48),
              child: Text(
                "Empower your\neducation to next level",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF2F2F2)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                'Learn new things and develop your problem solving skills ',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: const Color(0xFF949FA6)),
              ),
            ),
            SizedBox(height: 8,),

            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 5.0),
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    borderRadius:
                        BorderRadius.circular(2),
                  ),
                ),
                Container(
                  width: 18.0,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    borderRadius:
                        BorderRadius.circular(7.5), // Adjusted from 0.3 * fem
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Container(
                      height: 40,
                      width: 90,
                      alignment: Alignment.center,
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                          color: const Color(0xFFF2F2F2),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: const Color(0xFF232426),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Loginpage()),
                      );
                    },
                  ),
                  GestureDetector(
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        color: const Color(0xFFF2F2F2),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Loginpage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
