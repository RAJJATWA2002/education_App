import 'package:education_app/loginpage.dart';
import 'package:education_app/secondpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Startpage extends StatefulWidget {
  @override
  _StartpageState createState() => _StartpageState();
}

class _StartpageState extends State<Startpage> {
  @override
  Widget build(BuildContext context) {
    double buttonPaddingVertical = 8.0;
    double buttonPaddingHorizontal = 16.0;
    double buttonBorderRadius = 8.0;
    double fontSize = 16.0;

    return Scaffold(
      backgroundColor: const Color(0Xff666d73),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 180),
              child: Image.asset(
                'assets/images/teaching_x2.png',
                fit: BoxFit.contain,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 48),
              child: const Text(
                'Explore your\nnew skills today',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF2F2F2),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: const Text(
                'You can learn various kinds of\ncourses in your hand',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF949FA6),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5.0),
                  width: 18.0,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    borderRadius:
                        BorderRadius.circular(7.5), // Adjusted from 0.3 * fem
                  ),
                ),
                Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF232426),
                      padding: EdgeInsets.symmetric(
                        vertical: buttonPaddingVertical,
                        horizontal: buttonPaddingHorizontal,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(buttonBorderRadius),
                      ),
                    ),
                    child: Text(
                      'Next',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: fontSize,
                        color: const Color(0xFFF2F2F2),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Secondpage()),
                      );
                    },
                  ),
                  GestureDetector(
                    child: Text(
                      'Skip',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: fontSize,
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
