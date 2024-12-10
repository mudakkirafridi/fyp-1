import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  // Dropdown and checkbox state
  var academicLevel = "Bachelor’s".obs;  // Initial value for academicLevel
  var academicProgram = "BS Computer Science".obs;
  var termsAccepted = false.obs;

  // Dropdown options
  final List<String> academicLevels = ['Bachelor’s', 'Intermediate'];
  final Map<String, List<String>> academicPrograms = {
    'Bachelor’s': ['BS Computer Science', 'BS Political Science','BS Urdu','BS Zoology'],
    'Intermediate': ['FA', 'FSc'],
  };

  // Programs based on selected academic level
  List<String> get programsForSelectedLevel => academicPrograms[academicLevel.value] ?? [];

  // Navigate to the next page
  void nextPage() {
    if (formKey.currentState?.validate() == true) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  // Navigate to the previous page
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
