import 'package:flutter/material.dart';
import 'package:students_complaint_app/utils/constants/colors.dart';

class CAppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final double letterSpacing;
  final TextAlign textAlign;

  // Constructor to initialize the properties
   const CAppText( {
    super.key,
    required this.text,
    this.fontSize = 12.0,
    this.color = CColors.black,
    this.fontWeight = FontWeight.normal,
    this.letterSpacing = 1.0,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        fontFamily: 'Poppins', // Custom font (Poppins)
      ),
    );
  }
}
