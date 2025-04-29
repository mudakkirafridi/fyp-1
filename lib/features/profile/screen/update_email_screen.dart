import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UpdateEmailScreen extends StatefulWidget {
  const UpdateEmailScreen({super.key});

  @override
  State<UpdateEmailScreen> createState() => _UpdateEmailScreenState();
}

class _UpdateEmailScreenState extends State<UpdateEmailScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _oldEmailController = TextEditingController();
  final TextEditingController _newEmailController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Function to update the email
  Future<void> _updateEmail() async {
    final currentUser = _auth.currentUser;

    if (_formKey.currentState!.validate()) {
      if (_oldEmailController.text.trim() != currentUser?.email) {
        Get.snackbar('Error', 'Old email does not match your current email.');
        return;
      }

      try {
        await currentUser?.verifyBeforeUpdateEmail(_newEmailController.text.trim());
        Get.snackbar('Success', 'Verification link sent to your new email.');
      } catch (e) {
        Get.snackbar('Error', 'Failed to update email: ${e.toString()}');
      }
    }
  }

  /// Confirmation dialog before updating
  void _showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String message,
    required VoidCallback onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel',style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              onConfirm(); // Proceed with action
            },
            child: const Text('Confirm',style: TextStyle(color: Colors.green),),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Email'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Old Email Field
              TextFormField(
                controller: _oldEmailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: 'Current Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your current email';
                  }
                  if (!value.contains('@') || !value.contains('.')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              /// New Email Field
              TextFormField(
                controller: _newEmailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'New Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a new email';
                  }
                  if (!value.contains('@') || !value.contains('.')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              /// Update Email Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    _showConfirmationDialog(
                      context: context,
                      title: "Update Email",
                      message: "Are you sure you want to update your email?",
                      onConfirm: _updateEmail,
                    );
                  },
                  child: const Text('Update Email'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:students_complaint_app/features/profile/widgets/update_action.dart';

// class UpdateEmailScreen extends StatefulWidget {
//   const UpdateEmailScreen({super.key});

//   @override
//   _UpdateEmailScreenState createState() => _UpdateEmailScreenState();
// }

// class _UpdateEmailScreenState extends State<UpdateEmailScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   void _updateEmail() async {
//     try {
//       await _auth.currentUser?.verifyBeforeUpdateEmail(_emailController.text.trim());
//       Get.snackbar('Success', 'Email updated successfully.');
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to update email. Please try again.');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Update Email'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             TextField(
              
//               controller: _emailController,
              
//               decoration: const InputDecoration(
//                 prefixIcon: Icon(Icons.email),
//                 labelText: 'New Email',
//               ),
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//               height: 55,
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: ()=>confirmAction(
//               context,
//               "Update Email",
//               "Are you sure you want to update your email?",
//               const UpdateEmailScreen(),
//             ),
//                 child: const Text('Update Password'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
