import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoaderUtil {
  // Show loader dialog
  static void showLoader() {
    if (Get.isDialogOpen != true) {
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
    }
  }

  // Hide loader dialog
  static void hideLoader() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }
}
