import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_in/sign_in.dart';
import 'package:students_complaint_app/features/profile/model/user_model.dart';
import 'package:students_complaint_app/utils/exceptions/firebase_auth_exception.dart';
import 'package:students_complaint_app/utils/exceptions/firebase_exception.dart';
import 'package:students_complaint_app/utils/exceptions/platform_exception.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch user data from Firestore
  Future<UserModel?> getUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user == null) return null;

      DocumentSnapshot doc = await _firestore.collection('users').doc(user.uid).get();
      if (!doc.exists) return null;

      return UserModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    } catch (e) {
      print('Error fetching user: $e');
      return null;
    }
  }

  // Update user's profile information
  Future<void> updateUserProfile(UserModel updatedUser) async {
    try {
      await _firestore.collection('users').doc(updatedUser.uid).update(updatedUser.toMap());
      Get.snackbar('Success', 'Profile updated successfully.', snackPosition: SnackPosition.BOTTOM);
    } on FirebaseException catch (e) {
      throw CFirebaseException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Update user's email
  Future<void> updateEmail(String newEmail) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.verifyBeforeUpdateEmail(newEmail);
        Get.snackbar('Success', 'Your email has been updated.', snackPosition: SnackPosition.BOTTOM);
      }
    } on FirebaseAuthException catch (e) {
      throw CFirebaseAuthException(e.code).message;
    } on PlatformException catch (e) {
      throw CPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Update user's password
  Future<void> updatePassword(String newPassword) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
        Get.snackbar('Success', 'Your password has been updated.', snackPosition: SnackPosition.BOTTOM);
      }
    } on FirebaseAuthException catch (e) {
      throw CFirebaseAuthException(e.code).message;
    } on PlatformException catch (e) {
      throw CPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Delete user account
  Future<void> deleteAccount() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).delete();
        await user.delete();
      }
    } catch (e) {
      print('Error deleting account: $e');
    }
  }

  // Logout user
  Future<void> logout() async {
    await _auth.signOut();
    Get.offAll(()=>SignInScreen()); // Replace with actual sign-in route
  }
}
