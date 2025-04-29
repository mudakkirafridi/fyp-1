import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:students_complaint_app/features/complaint/screen/complaints_screens/complaint_dashboard/complaint_dashboard.dart';
import 'package:students_complaint_app/utils/constants/colors.dart';
import 'package:students_complaint_app/utils/loaders/loader.dart';

class SignInController extends GetxController {
  RxBool isPasswordVisible = true.obs;
  // Form key for validation
  final formKey = GlobalKey<FormState>();

  // Firebase Authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  

  /// Method for signing in with email and password
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  /// Method to handle form submission
  Future<void> submitForm() async {
    if (formKey.currentState?.validate() == true) {
      try {
        // Show loading dialog
        LoaderUtil.showLoader();

        // Attempt to sign in
        await signInWithEmailAndPassword(
          emailController.text,
          passwordController.text,
        );

        // Dismiss the loader
        LoaderUtil.hideLoader();

        // Show success message
        Get.snackbar(
          'Success',
          'Signed in successfully!',
          colorText: CColors.textWhite,
          backgroundColor: CColors.success,
          snackPosition: SnackPosition.BOTTOM,
        );

        // Navigate to the Complaints Dashboard
        Get.offAll(() => const ComplaintsDashboard());
      } catch (e) {
        // Dismiss the loader in case of error
        LoaderUtil.hideLoader();

        // Show error message
        Get.snackbar(
          'Error',
          'Invalid email or password. Please try again.',
          colorText: CColors.textWhite,
          backgroundColor: CColors.warning,
          snackPosition: SnackPosition.BOTTOM,
        );
      } finally {
        // Clear the form fields
        emailController.clear();
        passwordController.clear();
      }
    }
  }
 

  // Dispose controllers to avoid memory leaks
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
