import 'package:flutter/material.dart';
import 'package:students_complaint_app/utils/constants/colors.dart';

// ignore: non_constant_identifier_names
Widget CButton({
  required String label,
  required VoidCallback onPressed,
  Color color = CColors.primary,
  double width = double.infinity,
}) {
  return SizedBox(
    width: width,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Button background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Circular shape
        ),
        padding: const EdgeInsets.symmetric(vertical: -1), // Button padding
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white, // Text color
          fontSize: 16, // Font size
        ),
      ),
    ),
  );
}
