import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_in/sign_in.dart';
import 'package:students_complaint_app/features/profile/model/user_model.dart';
import 'package:students_complaint_app/features/profile/screen/privacy_policy_screen.dart';
import 'package:students_complaint_app/features/profile/screen/update_email_screen.dart';
import 'package:students_complaint_app/features/profile/screen/update_password_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: Column(
        children: [
          _buildUserHeader(user),
          _buildListTile(
            icon: Icons.email,
            text: "Update Email",
            color: Colors.blue,
            onTap: () => Get.to(()=> UpdateEmailScreen()),
            
          ),
          _buildListTile(
            icon: Icons.lock,
            text: "Update Password",
            color: Colors.orange,
            onTap: () => Get.to(()=>UpdatePasswordScreen()),
            
          ),
          _buildListTile(
            icon: Icons.privacy_tip,
            text: "Privacy Policy",
            color: Colors.purple,
            onTap: () => Get.to(() => const PrivacyPolicyScreen()),
          ),
          _buildListTile(
            icon: Icons.logout,
            text: "Logout",
            color: Colors.red,
            onTap: () => _confirmLogout(context),
          ),
          _buildListTile(
            icon: Icons.delete,
            text: "Delete Account",
            color: Colors.redAccent,
            onTap: () => _confirmDeleteAccount(context),
          ),
        ],
      ),
    );
  }

Widget _buildUserHeader(User? user) {
  return UserAccountsDrawerHeader(
    accountName: FutureBuilder<UserModel>(
      future: _fetchUserData(user?.uid ?? ''),
      builder: (context, snapshot) {
        print("Connection State: ${snapshot.connectionState}");

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }

        if (snapshot.hasError) {
          print("Error: ${snapshot.error}");
          return const Text("Error loading data");
        }

        if (!snapshot.hasData || snapshot.data == null) {
          print("Snapshot has no data");
          return const Text("No Data Found (No Snapshot Data)");
        }

        final userData = snapshot.data!;
        print("UserData: $userData");

        return Text(userData.name);
      },
    ),
    accountEmail: Text(user?.email ?? 'No Email'),
    currentAccountPicture: CircleAvatar(
      backgroundColor: Colors.white,
      child: Text(
        // Use the first letter of displayName or fallback to 'U'
        (user?.displayName != null && user!.displayName!.isNotEmpty)
            ? user.displayName![0].toUpperCase()
            : 'U', // Fallback initial
        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green),
      ),
    ),
    decoration: const BoxDecoration(color: Colors.green),
  );
}

Future<UserModel> _fetchUserData(String uid) async {
  try {
    // Fetch the user document from Firestore
    DocumentSnapshot docSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (docSnapshot.exists) {
      // If the document exists, map the data to UserModel
      var data = docSnapshot.data() as Map<String, dynamic>?;
      return UserModel.fromMap(data, docSnapshot.id);
    } else {
      throw Exception("User not found");
    }
  } catch (e) {
    throw Exception("Error fetching user data: $e");
  }
}
  // ListTile Builder
  Widget _buildListTile({
    required IconData icon,
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text),
      onTap: onTap,
    );
  }

  // Confirmation Dialog for Logout
  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await FirebaseAuth.instance.signOut();
              Get.offAll(() => const SignInScreen());
            },
            child: const Text("Logout", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  // Confirmation Dialog for Deleting Account
  void _confirmDeleteAccount(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Account"),
        content: const Text("Are you sure you want to delete your account? This action cannot be undone."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              try {
                final user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  await FirebaseFirestore.instance.collection('users').doc(user.uid).delete();
                  await user.delete();
                  Get.offAll(() => const SignInScreen());
                }
              } catch (e) {
                Get.snackbar("Error", "Unable to delete account. Please re-authenticate.");
              }
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
