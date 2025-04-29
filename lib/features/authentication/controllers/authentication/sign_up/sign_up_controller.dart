
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:students_complaint_app/features/authentication/model/authentication_model/sign_up_model/sign_up_model.dart';
import 'package:students_complaint_app/features/complaint/screen/complaints_screens/complaint_diary/complaint_diary.dart';
import 'package:students_complaint_app/utils/constants/colors.dart';

class SignUpController extends GetxController {
  RxBool isPasswordVisible = true.obs;
  // Form key for validation
  final formKey = GlobalKey<FormState>();

  // Firebase services
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Text editing controllers
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();
  final registrationNoController = TextEditingController();
  final passwordController = TextEditingController();

  // Reactive state for academic level and terms acceptance
  var academicLevel = "Bachelor’s".obs;
  var termsAccepted = false.obs;

  // Dropdown options for academic levels
  final List<String> academicLevels = [
    "Bachelor’s",
    "Intermediate",
  ];

  // Method to create a Firebase user
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar('Error', 'Failed to create account: $e',
          colorText: CColors.textWhite,
          backgroundColor: CColors.warning,
          snackPosition: SnackPosition.BOTTOM);
      rethrow;
    }
  }

  // Method to save user data in Firestore
  Future<void> saveUserData() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final signUpData = SignUpModel(
          id: user.uid,
          fullName: fullNameController.text,
          email: emailController.text,
          phoneNo: phoneNoController.text,
          registrationNo: registrationNoController.text,
          academicLevel: academicLevel.value,
          termsAccepted: termsAccepted.value,
        );
        await _firestore
            .collection('users')
            .doc(user.uid)
            .set(signUpData.toJson());
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to save user data: $e',
          colorText: CColors.textWhite,
          backgroundColor: CColors.warning,
          snackPosition: SnackPosition.BOTTOM);
      rethrow;
    }
  }
/// SUBMIT FORM BUTTON
  Future<void> submitForm() async {
  if (formKey.currentState?.validate() == true) {
    if (!termsAccepted.value) {
      Get.snackbar('Error', 'You must accept the terms and conditions.',
          colorText: CColors.textWhite,
          backgroundColor: CColors.warning,
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      // Show loading dialog
      Get.dialog(
        Center(child: CircularProgressIndicator()), // Add a loading indicator
        barrierDismissible: false, // Prevent closing the dialog while processing
      );

      // Create Firebase user
      await createUserWithEmailAndPassword(
          emailController.text, passwordController.text);

      // Save user data to Firestore
      await saveUserData();

      // Dismiss the loader
      Get.back();

      // Show success message
      Get.snackbar(
        snackPosition: SnackPosition.BOTTOM,
        'Success',
        'Account created successfully!',
        colorText: CColors.textWhite,
        backgroundColor: CColors.success,
      );

      // Delay the navigation by 2-3 seconds
      Future.delayed(Duration(seconds: 2), () {
        Get.offAll(() => const ComplaintDairyScreen()); // Navigate to the ComplaintsDashboard
      });
    } catch (e) {
      // Dismiss the loader in case of error
      Get.back();
     

      
      // Handle errors if needed
      Get.snackbar(
        'Error',
        'Something went wrong, please try again.',
        colorText: CColors.textWhite,
        backgroundColor: CColors.warning,
        snackPosition: SnackPosition.BOTTOM,
        
      );
    }
  }
}

  // Dispose controllers to avoid memory leaks
  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneNoController.dispose();
    registrationNoController.dispose();
    passwordController.dispose();
    super.onClose();
    
  }
}
