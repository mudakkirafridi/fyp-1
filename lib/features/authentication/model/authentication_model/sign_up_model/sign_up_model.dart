// 
import 'package:intl/intl.dart';

class SignUpModel {
  String? id; // Firebase user UID
  String? fullName;
  String? email;
  String? phoneNo;
  String? registrationNo;
  String? academicLevel;
  bool termsAccepted;

  SignUpModel({
    this.id,
    this.fullName,
    this.email,
    this.phoneNo,
    this.registrationNo,
    this.academicLevel,
    this.termsAccepted = false,
  });

  // Converts the model to a map for Firestore
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
      'phone_no': phoneNo,
      'registration_no': registrationNo,
      'academic_level': academicLevel,
      'terms_accepted': termsAccepted,
      'created_at':DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),

    };
  }

  // Creates an instance from a Firestore document
  factory SignUpModel.fromMap(Map<String, dynamic> map) {
    return SignUpModel(
      id: map['id'],
      fullName: map['full_name'],
      email: map['email'],
      phoneNo: map['phone_no'],
      registrationNo: map['registration_no'],
      academicLevel: map['academic_level'],
      termsAccepted: map['terms_accepted'] ?? false,
    );
  }
}
