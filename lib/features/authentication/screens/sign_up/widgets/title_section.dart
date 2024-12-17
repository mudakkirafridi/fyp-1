import 'package:flutter/material.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // Title Section
        Center(
          child: Text(
            "Create",
            style: TextStyle(
              fontSize: CSizes.fontSizeLg,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: CSizes.spaceBtwItems),
        Text(
          "Your account in just a few easy steps",
          style: TextStyle(
            fontSize: CSizes.fontSizeMd,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
