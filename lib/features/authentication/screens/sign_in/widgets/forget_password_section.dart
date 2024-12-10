import 'package:flutter/material.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';

class ForgetPasswordSignIn extends StatelessWidget {
  const ForgetPasswordSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Forget Password?',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            fontSize: CSizes.fontSizeSm,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}