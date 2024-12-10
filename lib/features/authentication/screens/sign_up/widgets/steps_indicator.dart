  // Step Indicator Widget with Numbers
  import 'package:flutter/material.dart';
import 'package:students_complaint_app/utils/constants/colors.dart';

Widget buildStepIndicators(int currentStep) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < 3; i++)
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: i == currentStep ? CColors.primary : CColors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: CColors.primary)
            ),
            alignment: Alignment.center,
            child: Text(
              '${i + 1}',
              style:  TextStyle(
                color: i == currentStep ? CColors.white : CColors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }