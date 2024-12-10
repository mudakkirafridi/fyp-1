class SignUpModel {
  String? fullName;
  String? contactNo;
  String? email;
  String? enrollmentNumber;
  String? password;
  String? academicLevel;
  String? academicProgram;
  bool termsAccepted = false;

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
}
