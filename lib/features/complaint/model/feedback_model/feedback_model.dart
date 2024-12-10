// models/feedback.dart
class FeedbackModel {
  final int positive;
  final int negative;
  final int pending;

  FeedbackModel({
    this.positive = 0,
    this.negative = 0,
    this.pending = 0,
  });
}