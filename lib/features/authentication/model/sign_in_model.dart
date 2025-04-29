class SignInModel {
  String? email;
  String? password;

  SignInModel({
    this.email,
    this.password,
  });

  // Converts the model to a map for Firestore or API
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  // Creates an instance from a Firestore document or API response
  factory SignInModel.fromMap(Map<String, dynamic> map) {
    return SignInModel(
      email: map['email'],
      password: map['password'],
    );
  }
}
