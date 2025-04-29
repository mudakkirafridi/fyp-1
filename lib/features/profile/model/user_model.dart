class UserModel {
  final String uid;
  final String name;
  final String email;
  final String phoneNumber;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phoneNumber,
  }); 

  /// Convert a UserModel into a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  /// Create a UserModel from Firestore DocumentSnapshot
  factory UserModel.fromMap(Map<String, dynamic>? data, String documentId) {
    if (data == null) {
      throw Exception("User data is null");
    }
    return UserModel(
      uid: documentId,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
    );
  }

  /// CopyWith method to update specific fields
  UserModel copyWith({
    String? name,
    String? email,
    String? phoneNumber,
  }) {
    return UserModel(
      uid: uid, // UID remains unchanged
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
