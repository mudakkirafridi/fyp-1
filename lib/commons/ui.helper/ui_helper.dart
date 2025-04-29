import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students_complaint_app/utils/constants/colors.dart';

class UiHelper  {
 customSnackbar({required String title, required String message}) {
  Get.snackbar(
    title,
    message,
    titleText: Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: CColors.darkerGrey,
      ),
    ),
    messageText: Text(
      message,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 16,
        color: CColors.darkerGrey,
      ),
    ),
    backgroundColor: CColors.white,
    snackPosition: SnackPosition.TOP,
    margin: const EdgeInsets.all(12),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    borderRadius: 12,
    boxShadows: const [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10,
        spreadRadius: 2,
      ),
    ],
  );
}

}