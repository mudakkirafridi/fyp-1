import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students_complaint_app/features/complaint/screen/complaints_screens/complaint_dashboard/complaint_dashboard.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';

class SignInElevatedButton extends StatelessWidget {
  const SignInElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .07,
      child: ElevatedButton(
        onPressed: () {
          Get.to(() => const ComplaintsDashboard());
        },
        child: const Text(
          'Sign In',
          style: TextStyle(
            letterSpacing: 1.5,
            fontWeight: FontWeight.w600,
            fontSize: CSizes.fontSizeMd,
          ),
        ),
      ),
    );
  }
}
