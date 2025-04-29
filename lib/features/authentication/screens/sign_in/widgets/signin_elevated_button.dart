import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students_complaint_app/features/authentication/controllers/authentication/sign_in_controller.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';

class SignInElevatedButton extends StatelessWidget {
  const SignInElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SignInController controller = Get.put(SignInController());
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .07,
      child: ElevatedButton(
        onPressed:  () async {
                if (controller.formKey.currentState!.validate()) {
                  print("========= Login functionality on tap ==========");
                  await controller.submitForm();
                  
                }
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
