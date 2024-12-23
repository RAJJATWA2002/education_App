import 'package:flutter/material.dart';

class CommonPage extends StatefulWidget {
  final String? imagePath;
  final String title;
  final VoidCallback? onBackButtonPressed;

  CommonPage({
    this.imagePath,
    required this.title,
    this.onBackButtonPressed,
  });


  @override
  _CommonPage createState() => _CommonPage();
}

class _CommonPage extends State<CommonPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BackButton(
          color: Color(0XFFFFFFFF),
          onPressed: widget.onBackButtonPressed ?? () => Navigator.pop(context),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 103),
          child: Text(
            widget.title,
            style: const TextStyle(
              color: Color(0XFFFFFFFF),
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        if (widget.imagePath != null)
          Image.asset(
            widget.imagePath!,
            width: 19,
            height: 29,
          ),
      ],
    );
  }
}
