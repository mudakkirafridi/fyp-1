class ComplaintModel {
  final String title;
  final String description; // Description of the complaint
  final String category; // Category of the complaint (e.g., 'Academic', 'Non-Academic', etc.)
  final String subCategory; // Sub-category of the complaint
  final String level3Category; // Level 3 category of the complaint
  final String status; // Status of the complaint (e.g., 'Open', 'Closed', 'Pending')
  // final int openCount; // Open complaints count (if applicable)
  // final int closedCount; // Closed complaints count (if applicable)
  // final int droppedCount; // Dropped complaints count (if applicable)
  final DateTime timestamp; // Time when the complaint was created

  ComplaintModel({
    required this.title,
    required this.description,
    required this.category,
    required this.subCategory,
    required this.level3Category,
    required this.status,
    // this.openCount = 0,
    // this.closedCount = 0,
    // this.droppedCount = 0,
    required this.timestamp,
  });

  // Convert the complaint model to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'category': category,
      'subCategory': subCategory,
      'level3Category': level3Category,
      'status': status,
      // 'openCount': openCount,
      // 'closedCount': closedCount,
      // 'droppedCount': droppedCount,
      'timestamp': timestamp.toIso8601String(), // Convert timestamp to string for Firestore
    };
  }

  // Create a complaint model from a map (for Firestore document snapshot)
  factory ComplaintModel.fromMap(Map<String, dynamic> map) {
    return ComplaintModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      subCategory: map['subCategory'] ?? '',
      level3Category: map['level3Category'] ?? '',
      status: map['status'] ?? '',
      // openCount: map['openCount'] ?? 0,
      // closedCount: map['closedCount'] ?? 0,
      // droppedCount: map['droppedCount'] ?? 0,
      timestamp: DateTime.parse(map['timestamp'] ?? DateTime.now().toIso8601String()), // Parse timestamp
    );
  }
}
