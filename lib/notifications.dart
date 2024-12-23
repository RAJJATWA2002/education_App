import 'package:education_app/home.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _Notifications createState() => _Notifications();
}

class _Notifications extends State<Notifications> {
  final List<Map<String, String>> items = [
    {
      'cntHeading': 'Congratulation',
      'cntDes': 'You have completed Python course',
      'buttonText': 'Download certificate'
    },
    {
      'cntHeading': 'Hurry Up !!',
      'cntDes': 'It’s time for the Flutter class, learn about Firebase',
      'buttonText': 'Get into class'
    },
    {
      'cntHeading': 'Great Job!',
      'cntDes': 'You have completed the JavaScript course',
      'buttonText': 'View progress'
    },
    {
      'cntHeading': 'Next Step',
      'cntDes': 'Start your journey into advanced Dart programming',
      'buttonText': 'Enroll now'
    },
    {
      'cntHeading': 'You did it!',
      'cntDes': 'You have successfully finished the CSS course',
      'buttonText': 'Claim your certificate'
    },
    {
      'cntHeading': 'Almost There',
      'cntDes': 'Only a few lessons left in the Java course',
      'buttonText': 'Continue learning'
    },
    {
      'cntHeading': 'Keep it Up!',
      'cntDes': 'Great progress in the C++ course, finish strong',
      'buttonText': 'Complete course'
    },
    {
      'cntHeading': 'Let\'s Go!',
      'cntDes': 'You are ready to dive into the SQL database class',
      'buttonText': 'Start lesson'
    },
    {
      'cntHeading': 'Achievement Unlocked',
      'cntDes': 'You’ve completed the HTML basics',
      'buttonText': 'Download certificate'
    },
    {
      'cntHeading': 'Join Now',
      'cntDes': 'The next Data Science class is about to begin',
      'buttonText': 'Enroll in class'
    },
    {
      'cntHeading': 'Congratulations!',
      'cntDes': 'You mastered the React Native framework',
      'buttonText': 'Download certificate'
    },
    {
      'cntHeading': 'New Milestone',
      'cntDes': 'You finished the Bootstrap UI course',
      'buttonText': 'View certificate'
    },
    {
      'cntHeading': 'Keep Going!',
      'cntDes': 'You’re halfway through the Android development class',
      'buttonText': 'Continue'
    },
    {
      'cntHeading': 'Time to Learn',
      'cntDes': 'Start learning about AI and Machine Learning today',
      'buttonText': 'Join class'
    },
    {
      'cntHeading': 'Fantastic Work',
      'cntDes': 'You have completed the Git and GitHub course',
      'buttonText': 'Download your badge'
    },
  ];

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
            'Notification',
            style: TextStyle(
              color: Color(0XFFFFFFFF),
              fontWeight: FontWeight.w600,
              fontSize: 18,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 33.0),
            child: Image.asset(
              'assets/icons/notification.png',
              height: 20,
              width: 19,
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 32),
       child:  ListView.builder(
           itemCount: items.length,
           itemBuilder: (context, Index) {
             return Container(
               width: double.infinity,
               margin: EdgeInsets.only(bottom: 15),
               padding: EdgeInsets.all(10),
               decoration: BoxDecoration(
                 color: Color(0XFF363E40),
                 borderRadius: BorderRadius.circular(10),
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(
                     width: MediaQuery.of(context).size.width,
                     child: Text(
                       items[Index]['cntHeading'] ?? '',
                       maxLines: 1,
                       overflow: TextOverflow.clip,
                       textAlign: TextAlign.start,
                       style: TextStyle(
                         color: Color(0XFFFFFFFF),
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                   SizedBox(height: 5),
                   Container(
                     width: MediaQuery.of(context).size.width *
                         0.6, // Limiting width
                     child: Text(
                       items[Index]['cntDes'] ?? '',
                       maxLines: 2,
                       overflow: TextOverflow.ellipsis,
                       textAlign: TextAlign.start,
                       style: TextStyle(
                         color: Color(0XFFFFFFFF),
                         fontSize: 12,
                         fontWeight: FontWeight.normal,
                       ),
                     ),
                   ),
                   SizedBox(height: 5),
                   Align(
                     alignment: Alignment.bottomRight,
                     child: Container(
                       alignment: Alignment.center,
                       width: MediaQuery.of(context).size.width * 0.4,
                       padding: EdgeInsets.all(5),
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           color: Color(0XFF3E32FF)),
                       height: 35,
                       child: Text(
                         items[Index]['buttonText'] ?? '',
                         style: TextStyle(
                             color: Color(0XFFFFFFFF),
                             fontWeight: FontWeight.normal,
                             fontSize: 10),
                         overflow: TextOverflow.ellipsis,
                       ),
                     ),
                   )
                 ],
               ),
             );
           }),
      ),
    );
  }
}
