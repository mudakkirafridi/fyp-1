import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students_complaint_app/data/repositories/authentiction_repo.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_in/forget_password/reset_password.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_in/sign_in.dart';
import 'package:students_complaint_app/utils/constants/colors.dart';
import 'package:students_complaint_app/utils/loaders/loader.dart';
class ResetPasswordController extends GetxController {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  /// Sends the password reset email again
  Future<void> resendPasswordResetEmail() async {
    final email = emailController.text.trim();


    if (email.isEmpty) {
      Get.snackbar(
        'Error',
        'Email field cannot be empty.',
        backgroundColor: CColors.warning,
        colorText: CColors.textWhite,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      LoaderUtil.showLoader();

      // Call the method from AuthenticationRepository to send the reset email
      await AuthenticationRepository.instance.forgetPassword(email);

      LoaderUtil.hideLoader();
      Get.snackbar(
        'Email Sent',
        'Password reset email has been sent successfully.Please check you inbox.',
        backgroundColor: CColors.success,
        colorText: CColors.textWhite,
        snackPosition: SnackPosition.BOTTOM,
      );
      Future.delayed(const Duration(seconds: 3), () => Get.offAll(() => ResetPasswordScreen()));

    } catch (e) {
      LoaderUtil.hideLoader();
      Get.snackbar(
        'Error',
        'Failed to resend email: $e',
        backgroundColor: CColors.warning,
        colorText: CColors.textWhite,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /// Completes the password reset process
  Future<void> done() async {
    try {
      LoaderUtil.showLoader();

      // Simulate completion process (add custom logic here if needed)
      await Future.delayed(const Duration(seconds: 1));

      LoaderUtil.hideLoader();
      Get.offAll(() => const SignInScreen()); // Navigate to Sign In screen
    } catch (e) {
      LoaderUtil.hideLoader();
      Get.snackbar(
        'Error',
        'Something went wrong: $e',
        backgroundColor: CColors.warning,
        colorText: CColors.textWhite,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
