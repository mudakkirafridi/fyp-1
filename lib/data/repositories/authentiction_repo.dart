import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:students_complaint_app/features/authentication/screens/onboarding/main_landing_page.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_in/sign_in.dart';
import 'package:students_complaint_app/features/complaint/screen/complaints_screens/complaint_dashboard/complaint_dashboard.dart';
import 'package:students_complaint_app/features/profile/model/user_model.dart';
import 'package:students_complaint_app/features/splash_screen/splash_screen.dart';
import 'package:students_complaint_app/utils/exceptions/firebase_auth_exception.dart';
import 'package:students_complaint_app/utils/exceptions/firebase_exception.dart';
import 'package:students_complaint_app/utils/exceptions/format_exception.dart';
import 'package:students_complaint_app/utils/exceptions/platform_exception.dart';


class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /* ----------- VARIABLES ------------*/
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  

  /* ------ Call from main.dart on app launch -------*/
  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /* ---------- Function to show relavent screen -----------*/
  screenRedirect() async {
    if (kDebugMode) {
      print("========================= GET STORAGE ====================");
      print(deviceStorage.read('isFirstTime'));
    }
    deviceStorage.writeIfNull("isFirstTime", true);
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const SignInScreen())
        : Get.offAll(() => const SplashScreen());
  }

  /* ---------------- Email & password Sign in --------------------*/
  // [email authentication] - sign-in
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
  try {
    return await _auth.signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    throw CFirebaseAuthException(e.code).message;
  } on FormatException catch (_) {
    throw const CFormatException();
  } on PlatformException catch (e) {
    throw CPlatformException(e.code).message;
  } catch (e) {
    throw "Something went wrong. Please try again";
  }
}

  // [email authentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw CFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const CFormatException();
    } on PlatformException catch (e) {
      throw CPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  // [EmailVerification] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw CFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CFormatException();
    } on PlatformException catch (e) {
      throw CPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
/// Check if the user is already logged in
   checkUserLoggedIn() {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      // User is logged in, navigate to the Complaints Dashboard
      Get.offAll(() => const ComplaintsDashboard());
    } else {
      // User is not logged in, navigate to the Sign-In screen
      Get.offAll(() => const MainLandingScreen());
    }
  }
  // [Re authenticate] - Re authenticate user
  /* ---------------- Forget Password --------------------*/
  // [email authentication] - Forget password
   
  forgetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar(
        'Success',
        'Password reset email sent! Check your inbox.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } on FirebaseAuthException catch (e) {
      throw CFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const CFormatException();
    } on PlatformException catch (e) {
      throw CPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
  /* ---------------- User Data Operations --------------------*/
  // [Fetch user data from Firestore]
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

  // [Delete User Account] - Removes user from Firestore and Firebase Authentication
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

  // [Logout] - Sign out user
  Future<void> logout() async {
    await _auth.signOut();
  }

  // [Update Password] - Update user's password
  Future<void> updatePassword(String newPassword) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
        Get.snackbar(
          'Success',
          'Your password has been updated.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } on FirebaseAuthException catch (e) {
      throw CFirebaseAuthException(e.code).message;
    } on PlatformException catch (e) {
      throw CPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // [Update Email] - Update user's email
  Future<void> updateEmail(String newEmail) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updateEmail(newEmail);
        Get.snackbar(
          'Success',
          'Your email has been updated.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } on FirebaseAuthException catch (e) {
      throw CFirebaseAuthException(e.code).message;
    } on PlatformException catch (e) {
      throw CPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  /* ---------------- Faderated identity & social sign-in --------------------*/
  // [Google authentication] - Google
  // [Facebook authentication] - Facebook
}
