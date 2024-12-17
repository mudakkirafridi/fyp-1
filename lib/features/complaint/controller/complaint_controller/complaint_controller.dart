// controllers/complaints_controller.dart
import 'package:get/get.dart';
import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_model.dart';

class ComplaintsController extends GetxController {
  // Observable instance of ComplaintModel, which keeps track of complaint data
  var complaintModel = ComplaintModel(title: "").obs;
  // variable to observe the expension of floating actoin button
  // Observable variable to track expansion state
  var isExpanded = false.obs;

  // Method to toggle the expansion state
  void toggleFab() {
    isExpanded.value = !isExpanded.value;
  }

  // Initialize counts with default values
  var openCount = 0.obs;
  var closedCount = 0.obs;
  var droppedCount = 0.obs;
  var positiveFeedbackCount = 0.obs;
  var negativeFeedbackCount = 0.obs;
  var pendingFeedbackCount = 0.obs;

  // Update complaint counts based on data fetched from backend or API
  void updateComplaintCounts(int open, int closed, int dropped) {
    openCount.value = open;
    closedCount.value = closed;
    droppedCount.value = dropped;
  }

  // Update feedback counts based on data fetched from backend or API
  void updateFeedbackCounts(int positive, int negative, int pending) {
    positiveFeedbackCount.value = positive;
    negativeFeedbackCount.value = negative;
    pendingFeedbackCount.value = pending;
  }

  // Fetch complaint data from a service or API (stubbed for now)
  Future<void> fetchComplaintData() async {
    try {
      // Simulate API call or database fetch here, e.g.,
      // var data = await ComplaintService.getComplaints();

      // Example dummy data
      updateComplaintCounts(5, 10, 2);
      updateFeedbackCounts(3, 1, 6);
    } catch (e) {
      // Handle error
      // print("Error fetching complaints data: $e");
    }
  }

  // Method to add a new complaint
  void addComplaint(String title, String description) {
    // This would typically involve sending data to the backend
    // print("Complaint added with title: $title and description: $description");
  }

  // Method to handle user feedback on complaints
  void submitFeedback(int complaintId, String feedbackType) {
    // This would involve updating the feedback count and possibly sending feedback to the backend
    if (feedbackType == 'positive') {
      positiveFeedbackCount.value++;
    } else if (feedbackType == 'negative') {
      negativeFeedbackCount.value++;
    } else if (feedbackType == 'pending') {
      pendingFeedbackCount.value++;
    }
  }

  // Override this method to fetch data when the controller is initialized
  @override
  void onInit() {
    fetchComplaintData(); // Fetch initial data for complaints and feedback
    super.onInit();
  }
}
