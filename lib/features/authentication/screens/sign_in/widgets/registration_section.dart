import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_up/signup.dart';
import 'package:students_complaint_app/utils/constants/colors.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';

class RegistrationSectionSignIn extends StatelessWidget {
  const RegistrationSectionSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
         Text(
          "Don't have an account?",
          style: TextStyle(fontSize: CSizes.fontSizeSm,color: Theme.of(context).colorScheme.onSecondaryContainer,),
        ),
        TextButton(
          onPressed: () {
            Get.to(()=> const SignUpScreen());
          },
          child: const Text(
            "Register",
            style: TextStyle(
              color: CColors.info,
              fontSize: CSizes.fontSizeSm,
            ),
          ),
        ),
      ],
    );
  }
}