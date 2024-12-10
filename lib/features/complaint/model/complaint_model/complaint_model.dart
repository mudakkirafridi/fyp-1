// models/complaint.dart
class ComplaintModel {
  final String title;
  final int openCount;
  final int closedCount;
  final int droppedCount;

  ComplaintModel({
    required this.title,
    this.openCount = 0,
    this.closedCount = 0,
    this.droppedCount = 0,
  });
}


