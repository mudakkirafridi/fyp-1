
// // controllers/complaints_controller.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_category_model/complaint_level3_model.dart';
// import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_category_model/complaint_sub_category_model.dart';
// import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_model.dart';

// class ComplaintsController extends GetxController {
//   // final ComplaintsController controller = Get.put(ComplaintsController());
//   /*--------- VARIABLLES -------=*/
//   // GlobalKey for the form
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   // TextEditingControllers for form inputs
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   final TextEditingController categoryController = TextEditingController();
//   final TextEditingController statusController = TextEditingController();
//   final TextEditingController subCategoryController = TextEditingController();
//   final TextEditingController level3CategoryController = TextEditingController();
//   // Observable instance of ComplaintModel, which keeps track of complaint data
//   var complaintModel = ComplaintModel(
//     title: '',
//     description: '',
//     category: '',
//     status: '',
//     timestamp: DateTime.now(),
//     //  subCategory: '', level3Category: '',

//   ).obs;
  
//   // Observable variable to track expansion state of the floating action button
//   var isExpanded = false.obs;

//   // Initialize counts with default values
//   var openCount = 0.obs;
//   var closedCount = 0.obs;
//   var droppedCount = 0.obs;
//   var positiveFeedbackCount = 0.obs;
//   var negativeFeedbackCount = 0.obs;
//   var pendingFeedbackCount = 0.obs;

//   // Method to toggle the expansion state of the floating action button
//   void toggleFab() {
//     isExpanded.value = !isExpanded.value;
//   }

//   // Update complaint counts based on data fetched from the backend or API
//   void updateComplaintCounts(int open, int closed, int dropped) {
//     openCount.value = open;
//     closedCount.value = closed;
//     droppedCount.value = dropped;
//   }

//   // Update feedback counts based on data fetched from the backend or API
//   void updateFeedbackCounts(int positive, int negative, int pending) {
//     positiveFeedbackCount.value = positive;
//     negativeFeedbackCount.value = negative;
//     pendingFeedbackCount.value = pending;
//   }

//   // Fetch complaint data from a service or API (stubbed for now)
//   Future<void> fetchComplaintData() async {
//     try {
//       // Simulate API call or database fetch here, e.g.,
//       // var data = await ComplaintService.getComplaints();

//       // Example dummy data
//       updateComplaintCounts(5, 10, 2);
//       updateFeedbackCounts(3, 1, 6);
//     } catch (e) {
//       // Handle error
//       print("Error fetching complaints data: $e");
//     }
//   }

//   // Method to add a new complaint to Firebase
//   Future<void> addComplaintToFirebase(String title, String description, String category, String status,) async {
//     try {
//       // Create a new ComplaintModel instance with the provided data
//       ComplaintModel newComplaint = ComplaintModel(
//         title: title,
//         description: description,
//         category: category,
//         status: status,
//         timestamp: DateTime.now(),
//         // subCategory: subCategory,
//         //  level3Category: level3Category,
//       );

//       // Send the complaint data to Firebase Firestore
//       await FirebaseFirestore.instance.collection('complaints').add(newComplaint.toMap());

//       // Optionally, update the complaint model or perform other actions (e.g., show a confirmation message)
//       print("Complaint added successfully");
//     } catch (e) {
//       print("Error adding complaint to Firebase: $e");
//     }
//   }
// // Method to add category3 complaint to Firebase
//   Future<void> addLevel3ToFirebase(String level3Category) async {
//     try {
//       // Create a new ComplaintModel instance with the provided data
//       ComplaintLevel3Model newComplaint = ComplaintLevel3Model(name: level3Category,
        
//       );

//       // Send the complaint data to Firebase Firestore
//       await FirebaseFirestore.instance.collection('complaints').add(newComplaint.toMap());

//       // Optionally, update the complaint model or perform other actions (e.g., show a confirmation message)
//       print("Complaint category 3 added successfully");
//     } catch (e) {
//       print("Error adding complaint category3 to Firebase: $e");
//     }
//   }
//   // Method to add a new complaint to Firebase
//   Future<void> addSubCategoryToFirebase(String subCategory) async {
//     try {
//       // Create a new ComplaintModel instance with the provided data
//       ComplaintSubCategoryModel newComplaint = ComplaintSubCategoryModel(name: subCategory, level3Categories: [],);

//       // Send the complaint data to Firebase Firestore
//       await FirebaseFirestore.instance.collection('complaints').add(newComplaint.toMap());

//       // Optionally, update the complaint model or perform other actions (e.g., show a confirmation message)
//       print("Complaint subCategory added successfully");
//     } catch (e) {
//       print("Error adding complaint Subcategory to Firebase: $e");
//     }
//   }
//   // Method to handle user feedback on complaints
//   void submitFeedback(int complaintId, String feedbackType) {
//     // This would involve updating the feedback count and possibly sending feedback to the backend
//     if (feedbackType == 'positive') {
//       positiveFeedbackCount.value++;
//     } else if (feedbackType == 'negative') {
//       negativeFeedbackCount.value++;
//     } else if (feedbackType == 'pending') {
//       pendingFeedbackCount.value++;
//     }
//   }

//   // Override this method to fetch data when the controller is initialized
//   @override
//   void onInit() {
//     fetchComplaintData(); // Fetch initial data for complaints and feedback
//     super.onInit();
//   }
// }

// // controllers/complaints_controller.dart
// import 'package:get/get.dart';
// import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_model.dart';

// class ComplaintsController extends GetxController {
//   // Observable instance of ComplaintModel, which keeps track of complaint data
//   var complaintModel = ComplaintModel(title: "").obs;
//   // variable to observe the expension of floating actoin button
//   // Observable variable to track expansion state
//   var isExpanded = false.obs;

//   // Method to toggle the expansion state
//   void toggleFab() {
//     isExpanded.value = !isExpanded.value;
//   }

//   // Initialize counts with default values
//   var openCount = 0.obs;
//   var closedCount = 0.obs;
//   var droppedCount = 0.obs;
//   var positiveFeedbackCount = 0.obs;
//   var negativeFeedbackCount = 0.obs;
//   var pendingFeedbackCount = 0.obs;

//   // Update complaint counts based on data fetched from backend or API
//   void updateComplaintCounts(int open, int closed, int dropped) {
//     openCount.value = open;
//     closedCount.value = closed;
//     droppedCount.value = dropped;
//   }

//   // Update feedback counts based on data fetched from backend or API
//   void updateFeedbackCounts(int positive, int negative, int pending) {
//     positiveFeedbackCount.value = positive;
//     negativeFeedbackCount.value = negative;
//     pendingFeedbackCount.value = pending;
//   }

//   // Fetch complaint data from a service or API (stubbed for now)
//   Future<void> fetchComplaintData() async {
//     try {
//       // Simulate API call or database fetch here, e.g.,
//       // var data = await ComplaintService.getComplaints();

//       // Example dummy data
//       updateComplaintCounts(5, 10, 2);
//       updateFeedbackCounts(3, 1, 6);
//     } catch (e) {
//       // Handle error
//       // print("Error fetching complaints data: $e");
//     }
//   }

//   // Method to add a new complaint
//   void addComplaint(String title, String description) {
//     // This would typically involve sending data to the backend
//     // print("Complaint added with title: $title and description: $description");
//   }

//   // Method to handle user feedback on complaints
//   void submitFeedback(int complaintId, String feedbackType) {
//     // This would involve updating the feedback count and possibly sending feedback to the backend
//     if (feedbackType == 'positive') {
//       positiveFeedbackCount.value++;
//     } else if (feedbackType == 'negative') {
//       negativeFeedbackCount.value++;
//     } else if (feedbackType == 'pending') {
//       pendingFeedbackCount.value++;
//     }
//   }
  

//   // Override this method to fetch data when the controller is initialized
//   @override
//   void onInit() {
//     fetchComplaintData(); // Fetch initial data for complaints and feedback
//     super.onInit();
//   }
// }
