import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_in/forget_password/forget_password.dart';
import 'package:students_complaint_app/utils/constants/colors.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';
import 'package:students_complaint_app/utils/constants/text_strings.dart';

class ForgetPasswordSignIn extends StatelessWidget {
  const ForgetPasswordSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => Get.to(() => const ForgetPasswordScreen()),
        child: Text(
          CTexts.forgetPassword,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            fontSize: CSizes.fontSizeSm,
            fontWeight: FontWeight.w600,
            
          ).copyWith(color: CColors.error),
        ),
      ),
    );
  }
}
