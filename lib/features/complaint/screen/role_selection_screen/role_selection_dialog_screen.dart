// views/role_selection_dialog.dart
import 'package:flutter/material.dart';

class RoleSelectionDialog extends StatelessWidget {
  const RoleSelectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Select Role"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile(
            title: const Text("Personal grievance / Complaint"),
            value: 1,
            groupValue: 0,
            onChanged: (value) {},
          ),
          RadioListTile(
            title: const Text("Complaint as a social responsibility"),
            value: 2,
            groupValue: 0,
            onChanged: (value) {},
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("CANCEL")),
        ElevatedButton(onPressed: () {}, child: const Text("OK")),
      ],
    );
  }
}