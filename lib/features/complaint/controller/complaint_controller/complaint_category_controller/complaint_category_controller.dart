import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:students_complaint_app/commons/ui.helper/ui_helper.dart';
import 'package:students_complaint_app/features/complaint/data/complaint_category_data.dart';
import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_category_model/complaint_level3_model.dart';
import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_category_model/complaint_sub_category_model.dart';
import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_category_model/complaint_main_category_model.dart';
import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_model.dart';
import 'package:students_complaint_app/features/complaint/screen/complaints_screens/complaint_category_screen/complaint_category2_screen/complaint_category2_screen.dart';
import 'package:students_complaint_app/features/complaint/screen/complaints_screens/complaint_category_screen/complaint_category3_screen/complaint_category3_screen.dart';
import 'package:students_complaint_app/features/complaint/screen/complaints_screens/complaint_diary/complaint_diary.dart';
import 'package:students_complaint_app/utils/constants/colors.dart';

class ComplaintCategoryController extends GetxController {
  // Variables for complaint categories, subcategories, and level 3 categories
  final RxList<ComplaintCategoryModel> categories =
      <ComplaintCategoryModel>[].obs;
  final RxList<ComplaintSubCategoryModel> subCategories =
      <ComplaintSubCategoryModel>[].obs;
  final RxList<ComplaintLevel3Model> level3Categories =
      <ComplaintLevel3Model>[].obs;

  // Variables for selected categories
  Rx<ComplaintCategoryModel?> selectedCategory =
      Rx<ComplaintCategoryModel?>(null);
  Rx<ComplaintSubCategoryModel?> selectedSubCategory =
      Rx<ComplaintSubCategoryModel?>(null);
  Rx<ComplaintLevel3Model?> selectedLevel3Category =
      Rx<ComplaintLevel3Model?>(null);

  // Loading state
  final RxBool isLoading = false.obs;

  // Variables for handling complaint form and feedback
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController statusController = TextEditingController();

  var complaintModel = ComplaintModel(
          title: '',
          description: '',
          category: '',
          subCategory: '',
          level3Category: '',
          status: '',
          timestamp: DateTime.now(), uid: '')
      .obs;

  // Variables to track complaint and feedback counts
  var isExpanded = false.obs;
  var openCount = 0.obs;
  var closedCount = 0.obs;
  var droppedCount = 0.obs;
  var positiveFeedbackCount = 0.obs;
  var negativeFeedbackCount = 0.obs;
  var pendingFeedbackCount = 0.obs;

  // Constructor to initialize the categories
  ComplaintCategoryController() {
    loadCategories();
  }

  // Load main categories
  void loadCategories() {
    isLoading.value = true;
    try {
      categories.assignAll(
          complaintCategories); // complaintCategories should be preloaded data or fetched from an API
    } finally {
      isLoading.value = false;
    }
  }

  // Load subcategories for the selected main category
  void loadSubCategories(ComplaintCategoryModel category) {
    selectedCategory.value = category;
    subCategories.assignAll(category.subCategories);
    selectedSubCategory.value = null; // Reset selected subcategory
    level3Categories.clear(); // Clear level 3 categories
    selectedLevel3Category.value = null; // Reset level 3 selection
  }

  // Load level 3 categories for the selected subcategory
  void loadLevel3Categories(ComplaintSubCategoryModel subCategory) {
    selectedSubCategory.value = subCategory;
    level3Categories.assignAll(subCategory.level3Categories);
    selectedLevel3Category.value = null; // Reset level 3 selection
  }

  // Navigation to subcategory screen
  void navigateToSubCategoryScreen(ComplaintCategoryModel category) {
    loadSubCategories(category);
    Get.to(() =>
        const ComplaintSubCategoryScreen()); // Pass the selected category if needed
  }

  // Navigation to level 3 category screen
  void navigateToLevel3CategoryScreen(ComplaintSubCategoryModel subCategory) {
    loadLevel3Categories(subCategory);
    Get.to(() =>
        const ComplaintSubCategory3Screen()); // Pass the selected subcategory if needed
  }

  // Save complaint category to Firestore
  Future<void> saveComplaintCategory(ComplaintCategoryModel category) async {
    try {
      CollectionReference categoriesCollection =
          FirebaseFirestore.instance.collection('complaints');
      await categoriesCollection.add(category.toMap());
      Get.snackbar('Success', 'Category added successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add category: $e');
    }
  }

  // Save subcategory to Firestore
  Future<void> saveComplaintSubCategory(
      ComplaintSubCategoryModel subCategory) async {
    try {
      if (selectedCategory.value == null) {
        Get.snackbar('Error', 'Select a category first');
        return;
      }
      String categoryId = selectedCategory.value!.name;
      CollectionReference subCategoriesCollection = FirebaseFirestore.instance
          .collection('complaints')
          .doc(categoryId)
          .collection('subcategories');
      await subCategoriesCollection.add(subCategory.toMap());
      Get.snackbar('Success', 'Subcategory added successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add subcategory: $e');
    }
  }

  // Save level 3 category to Firestore
  Future<void> saveComplaintLevel3Category(
      ComplaintLevel3Model level3Category) async {
    try {
      if (selectedSubCategory.value == null) {
        Get.snackbar('Error', 'Select a subcategory first');
        return;
      }
      String categoryId = selectedCategory.value!.name;
      String subCategoryId = selectedSubCategory.value!.name;
      CollectionReference level3CategoriesCollection = FirebaseFirestore
          .instance
          .collection('complaints')
          .doc(categoryId)
          .collection('subcategories')
          .doc(subCategoryId)
          .collection('level3Categories');
      await level3CategoriesCollection.add(level3Category.toMap());
      Get.snackbar('Success', 'Level 3 category added successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add level 3 category: $e');
    }
  }

  // Method to add a new complaint to Firebase
  Future<void> addComplaintToFirebase(
    String title,
    String description,
    String category,
    String status,
    String subCategory,
    String level3Category) async {
  try {
    // Show loading dialog
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(color: CColors.white),
      ),
      barrierDismissible: false,
    );

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception("User not logged in");
    }

    ComplaintModel newComplaint = ComplaintModel(
      title: title,
      description: description,
      category: category,
      status: status,
      timestamp: DateTime.now(),
      subCategory: subCategory,
      level3Category: level3Category,
      uid: user.uid, // <-- assign UID
    );

    await FirebaseFirestore.instance
        .collection('complaints')
        .add(newComplaint.toMap());

    // Navigate back
    Get.offAll(() => const ComplaintDairyScreen(),
        duration: const Duration(seconds: 1));

    UiHelper().customSnackbar(
        title: "Success", message: "New complaint added successfully");

    // Clear input fields
    titleController.clear();
    descriptionController.clear();
  } catch (e) {
    Get.snackbar('Error', 'Failed to add complaint: $e');
    UiHelper().customSnackbar(
        title: "Error", message: 'Failed to add complaint: $e');
  }
}


  // Method to handle user feedback on complaints
  void submitFeedback(int complaintId, String feedbackType) {
    if (feedbackType == 'positive') {
      positiveFeedbackCount.value++;
    } else if (feedbackType == 'negative') {
      negativeFeedbackCount.value++;
    } else if (feedbackType == 'pending') {
      pendingFeedbackCount.value++;
    }
  }

  // Fetch initial complaint data
  Future<void> fetchComplaintData() async {
    try {
      // Example data update
      updateComplaintCounts(5, 10, 2);
      updateFeedbackCounts(3, 1, 6);
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching complaints data: $e");
      }
    }
  }

  // Method to update complaint counts
  void updateComplaintCounts(int open, int closed, int dropped) {
    openCount.value = open;
    closedCount.value = closed;
    droppedCount.value = dropped;
  }

  // Method to update feedback counts
  void updateFeedbackCounts(int positive, int negative, int pending) {
    positiveFeedbackCount.value = positive;
    negativeFeedbackCount.value = negative;
    pendingFeedbackCount.value = pending;
  }

  @override
  void onInit() {
    fetchComplaintData(); // Fetch initial data for complaints and feedback
    super.onInit();
  }

  //   // Method to toggle the expansion state of the floating action button
  void toggleFab() {
    isExpanded.value = !isExpanded.value;
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:students_complaint_app/features/complaint/data/complaint_category_data.dart';
// import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_category_model/complaint_level3_model.dart';
// import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_category_model/complaint_main_category_model.dart';
// import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_category_model/complaint_sub_category_model.dart';
// import 'package:students_complaint_app/features/complaint/screen/complaints_screens/complaint_category_screen/complaint_category2_screen/complaint_category2_screen.dart';
// import 'package:students_complaint_app/features/complaint/screen/complaints_screens/complaint_category_screen/complaint_category3_screen/complaint_category3_screen.dart';

// class ComplaintCategoryController extends GetxController {
//   // Lists of categories
//   final RxList<ComplaintCategoryModel> categories = <ComplaintCategoryModel>[].obs;
//   final RxList<ComplaintSubCategoryModel> subCategories = <ComplaintSubCategoryModel>[].obs;
//   final RxList<ComplaintLevel3Model> level3Categories = <ComplaintLevel3Model>[].obs;

//   // Selected items
//   Rx<ComplaintCategoryModel?> selectedCategory = Rx<ComplaintCategoryModel?>(null);
//   Rx<ComplaintSubCategoryModel?> selectedSubCategory = Rx<ComplaintSubCategoryModel?>(null);
//   Rx<ComplaintLevel3Model?> selectedLevel3Category = Rx<ComplaintLevel3Model?>(null);

//   // Loading state
//   final RxBool isLoading = false.obs;

//   ComplaintCategoryController() {
//     loadCategories();
//   }

//   // Load main categories
//   void loadCategories() {
//     isLoading.value = true;
//     try {
//       categories.assignAll(complaintCategories);
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // Load subcategories for the selected main category
//   void loadSubCategories(ComplaintCategoryModel category) {
//     selectedCategory.value = category;
//     subCategories.assignAll(category.subCategories);
//     selectedSubCategory.value = null; // Reset selected subcategory
//     level3Categories.clear(); // Clear level 3 categories
//     selectedLevel3Category.value = null; // Reset level 3 selection
//   }

//   // Load level 3 categories for the selected subcategory
//   void loadLevel3Categories(ComplaintSubCategoryModel subCategory) {
//     selectedSubCategory.value = subCategory;
//     level3Categories.assignAll(subCategory.level3Categories);
//     selectedLevel3Category.value = null; // Reset level 3 selection
//   }

//   // Navigation to subcategory screen
//   void navigateToSubCategoryScreen(ComplaintCategoryModel category) {
//     loadSubCategories(category);
//     Get.to(() => const ComplaintSubCategoryScreen()); // Pass the selected category if needed
//   }

//   // Navigation to level 3 category screen
//   void navigateToLevel3CategoryScreen(ComplaintSubCategoryModel subCategory) {
//     loadLevel3Categories(subCategory);
//     Get.to(() => const ComplaintSubCategory3Screen()); // Pass the selected subcategory if needed
//   }

//   // Save complaint category to Firestore
//   Future<void> saveComplaintCategory(ComplaintCategoryModel category) async {
//     try {
//       CollectionReference categoriesCollection = FirebaseFirestore.instance.collection('complaints');
//       // Convert category to map and save to Firestore
//       await categoriesCollection.add(category.toMap());
//       Get.snackbar('Success', 'Category added successfully');
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to add category: $e');
//     }
//   }

//   // Save subcategory to Firestore
//   Future<void> saveComplaintSubCategory(ComplaintSubCategoryModel subCategory) async {
//     try {
//       if (selectedCategory.value == null) {
//         Get.snackbar('Error', 'Select a category first');
//         return;
//       }
//       String categoryId = selectedCategory.value!.name;
//       CollectionReference subCategoriesCollection = FirebaseFirestore.instance
//           .collection('complaints')
//           .doc(categoryId)
//           .collection('subcategories');
//       // Convert subcategory to map and save to Firestore
//       await subCategoriesCollection.add(subCategory.toMap());
//       Get.snackbar('Success', 'Subcategory added successfully');
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to add subcategory: $e');
//     }
//   }

//   // Save level 3 category to Firestore
//   Future<void> saveComplaintLevel3Category(ComplaintLevel3Model level3Category) async {
//     try {
//       if (selectedSubCategory.value == null) {
//         Get.snackbar('Error', 'Select a subcategory first');
//         return;
//       }
//       String categoryId = selectedCategory.value!.name;
//       String subCategoryId = selectedSubCategory.value!.name;
//       CollectionReference level3CategoriesCollection = FirebaseFirestore.instance
//           .collection('complaints')
//           .doc(categoryId)
//           .collection('subcategories')
//           .doc(subCategoryId)
//           .collection('level3Categories');
//       // Convert level 3 category to map and save to Firestore
//       await level3CategoriesCollection.add(level3Category.toMap());
//       Get.snackbar('Success', 'Level 3 category added successfully');
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to add level 3 category: $e');
//     }
//   }
// }

// import 'package:get/get.dart';
// import 'package:students_complaint_app/features/complaint/data/complaint_category_data.dart';
// import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_category_model/complaint_level3_model.dart';
// import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_category_model/complaint_main_category_model.dart';
// import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_category_model/complaint_sub_category_model.dart';
// import 'package:students_complaint_app/features/complaint/screen/complaints_screens/complaint_category_screen/complaint_category2_screen/complaint_category2_screen.dart';
// import 'package:students_complaint_app/features/complaint/screen/complaints_screens/complaint_category_screen/complaint_category3_screen/complaint_category3_screen.dart';

// class ComplaintCategoryController extends GetxController {
//   // Lists of categories
//   final RxList<ComplaintCategoryModel> categories =
//       <ComplaintCategoryModel>[].obs;
//   final RxList<ComplaintSubCategoryModel> subCategories =
//       <ComplaintSubCategoryModel>[].obs;
//   final RxList<ComplaintLevel3Model> level3Categories =
//       <ComplaintLevel3Model>[].obs;

//   // Selected items
//   Rx<ComplaintCategoryModel?> selectedCategory =
//       Rx<ComplaintCategoryModel?>(null);
//   Rx<ComplaintSubCategoryModel?> selectedSubCategory =
//       Rx<ComplaintSubCategoryModel?>(null);
//   Rx<ComplaintLevel3Model?> selectedLevel3Category =
//       Rx<ComplaintLevel3Model?>(null);

//   // Loading state
//   final RxBool isLoading = false.obs;

//   ComplaintCategoryController() {
//     loadCategories();
//   }

//   // Load main categories
//   void loadCategories() {
//     isLoading.value = true;
//     try {
//       categories.assignAll(complaintCategories);
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // Load subcategories for the selected main category
//   void loadSubCategories(ComplaintCategoryModel category) {
//     selectedCategory.value = category;
//     subCategories.assignAll(category.subCategories);
//     selectedSubCategory.value = null; // Reset selected subcategory
//     level3Categories.clear(); // Clear level 3 categories
//     selectedLevel3Category.value = null; // Reset level 3 selection
//   }

//   // Load level 3 categories for the selected subcategory
//   void loadLevel3Categories(ComplaintSubCategoryModel subCategory) {
//     selectedSubCategory.value = subCategory;
//     level3Categories.assignAll(subCategory.level3Categories);
//     selectedLevel3Category.value = null; // Reset level 3 selection
//   }

//   // Navigation to subcategory screen
//   void navigateToSubCategoryScreen(ComplaintCategoryModel category) {
//     loadSubCategories(category);
//     Get.to(() =>
//         const ComplaintSubCategoryScreen()); // Pass the selected category if needed
//   }

//   // Navigation to level 3 category screen
//   void navigateToLevel3CategoryScreen(ComplaintSubCategoryModel subCategory) {
//     loadLevel3Categories(subCategory);
//     Get.to(() =>
//         const ComplaintSubCategory3Screen()); // Pass the selected subcategory if needed
//   }
// }
