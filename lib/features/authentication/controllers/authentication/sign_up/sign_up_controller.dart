import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:students_complaint_app/features/authentication/model/authentication_model/sign_up_model/sign_up_model.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final PageController pageController = PageController();
  final SignUpModel model = SignUpModel();

  // Text controllers for form fields
  final fullNameController = TextEditingController().obs;
  final contactController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final enrollmentController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  // Firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Dropdown and checkbox state
  var academicLevel = "Bachelor’s".obs;
  var academicProgram = "BS Computer Science".obs;
  var termsAccepted = false.obs;

  // Registration key state
  var registrationKey = ''.obs;
  var registrationKeyError = RxnString();

  // Dropdown options
  final List<String> academicLevels = ['Bachelor’s', 'Intermediate'];
  final Map<String, List<String>> academicPrograms = {
    'Bachelor’s': [
      'BS Computer Science',
      'BS Political Science',
      'BS Urdu',
      'BS Zoology',
    ],
    'Intermediate': ['FA', 'FSc'],
  };

  // Programs based on selected academic level
  List<String> get programsForSelectedLevel =>
      academicPrograms[academicLevel.value] ?? [];

  // Validate Registration Key
  Future<bool> validateRegistrationKey(String key) async {
    try {
      final doc =
          await _firestore.collection('registration_keys').doc(key).get();
      return doc.exists; // Check if the registration key exists
    } catch (e) {
      Get.snackbar('Error', 'Failed to validate registration key: $e');
      return false;
    }
  }

  // Create Firebase User
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar('Error', 'Failed to create account: $e');
      rethrow;
    }
  }

  // Save User Data to Firestore
  Future<void> saveUserData() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final signUpData = SignUpModel(
          fullName: fullNameController.value.text,
          contactNo: contactController.value.text,
          email: emailController.value.text,
          enrollmentNumber: enrollmentController.value.text,
          academicLevel: academicLevel.value,
          academicProgram: academicProgram.value,
          termsAccepted: termsAccepted.value,
        );
        await _firestore
            .collection('users')
            .doc(user.uid)
            .set(signUpData.toMap());
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to save user data: $e');
      rethrow;
    }
  }

  // Final Submission
  Future<void> submitForm() async {
    if (formKey.currentState?.validate() == true) {
      // Validate registration key
      final isValidKey = await validateRegistrationKey(registrationKey.value);
      if (!isValidKey) {
        registrationKeyError.value = 'Invalid registration key';
        return;
      }

      // Create Firebase user
      await createUserWithEmailAndPassword(
          emailController.value.text, passwordController.value.text);

      // Save user data to Firestore
      await saveUserData();

      Get.snackbar('Success', 'Account created successfully');
    }
  }

  // Navigation
  void nextPage() {
    if (formKey.currentState?.validate() == true) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void previousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  // Dispose controllers when done
  @override
  void onClose() {
    fullNameController.value.dispose();
    contactController.value.dispose();
    emailController.value.dispose();
    enrollmentController.value.dispose();
    passwordController.value.dispose();
    confirmPasswordController.value.dispose();
    pageController.dispose();
    super.onClose();
  }
}
