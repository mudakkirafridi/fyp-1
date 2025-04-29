  // Confirmation Dialog for Navigation Actions
  import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students_complaint_app/features/complaint/screen/complaints_screens/complaint_diary/complaint_diary.dart';

void confirmAction(BuildContext context, String title, String message, Widget screen) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Get.to(() => ComplaintDairyScreen());
            },
            child: const Text("Proceed", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
