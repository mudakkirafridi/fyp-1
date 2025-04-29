import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:students_complaint_app/features/authentication/model/authentication_model/sign_up_model/sign_up_model.dart';
import 'package:students_complaint_app/utils/exceptions/firebase_exception.dart';
import 'package:students_complaint_app/utils/exceptions/platform_exception.dart';

/// Repository class for user-related operations.
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore.
  Future<void> saveUserRecord(SignUpModel user) async {
    try {
      print("Saving user record: ${user.toJson()}");
      await _db.collection("Users").doc(user.id).set(user.toJson());
      print("User record saved successfully.");
      // Add navigation logic here if needed
    } on FirebaseException catch (e) {
      print("FirebaseException: ${e.code}");
      throw CFirebaseException(e.code);
    } on FormatException {
      print("FormatException: Invalid format provided");
      throw const FormatException("Invalid format provided");
    } on CFirebaseException catch (e) {
      print("TFirebaseException: ${e.code}");
      throw CPlatformException(e.code);
    } catch (e) {
      print("Exception: Something went wrong. Please try again. Error: $e");
      throw Exception("Something went wrong. Please try again.");
    }
  }
}