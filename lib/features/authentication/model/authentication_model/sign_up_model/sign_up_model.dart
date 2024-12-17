class SignUpModel {
  String? fullName;
  String? contactNo;
  String? email;
  String? enrollmentNumber;
  String? password;
  String? academicLevel;
  String? academicProgram;
  bool termsAccepted;

  SignUpModel({
    this.fullName,
    this.contactNo,
    this.email,
    this.enrollmentNumber,
    this.password,
    this.academicLevel,
    this.academicProgram,
    this.termsAccepted = false,
  });

  // Converts the model to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'full_name': fullName,
      'contact_no': contactNo,
      'email': email,
      'enrollment_number': enrollmentNumber,
      'academic_level': academicLevel,
      'academic_program': academicProgram,
      'terms_accepted': termsAccepted,
      'created_at': DateTime.now(),
    };
  }
}
