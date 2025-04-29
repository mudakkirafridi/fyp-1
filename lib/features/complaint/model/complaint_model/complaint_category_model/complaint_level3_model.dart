class ComplaintLevel3Model {
  final String name;

  ComplaintLevel3Model({
    required this.name,
  });

  // Convert model to map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  // Create model from Firestore document
  factory ComplaintLevel3Model.fromMap(Map<String, dynamic> map) {
    return ComplaintLevel3Model(
      name: map['name'] ?? '',
    );
  }
}
