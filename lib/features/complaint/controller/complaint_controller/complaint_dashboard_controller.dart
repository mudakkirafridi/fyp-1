import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ComplaintCategoryController extends GetxController {
  RxString userName = ''.obs; // Observable for the user's name

  @override
  void onInit() {
    super.onInit();
    fetchUserName(); // Automatically fetch the username on initialization
  }

  /// Fetch the logged-in user's name from Firestore
  Future<void> fetchUserName() async {
    try {
      // Get the currently logged-in user
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        // Retrieve user data from Firestore
        DocumentSnapshot<Map<String, dynamic>> userDoc = await FirebaseFirestore.instance
            .collection('users') // Replace 'users' with your collection name
            .doc(currentUser.uid)
            .get();

        // Update the observable `userName`
        userName.value = userDoc.data()?['name'] ?? 'Guest User';
      } else {
        userName.value = 'Guest User'; // Fallback if no user is logged in
      }
    } catch (e) {
      userName.value = 'Error fetching name'; // Handle errors
      print('Error fetching user name: $e');
    }
  }
}
