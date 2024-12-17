import 'package:get/get.dart';
import 'package:students_complaint_app/features/complaint/data/complaint_category_data.dart';
import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_category_model/complaint_level3_model.dart';
import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_category_model/complaint_main_category_model.dart';
import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_category_model/complaint_sub_category_model.dart';
import 'package:students_complaint_app/features/complaint/screen/complaints_screens/complaint_category_screen/complaint_category2_screen/complaint_category2_screen.dart';
import 'package:students_complaint_app/features/complaint/screen/complaints_screens/complaint_category_screen/complaint_category3_screen/complaint_category3_screen.dart';

class ComplaintCategoryController extends GetxController {
  // Lists of categories
  final RxList<ComplaintCategoryModel> categories =
      <ComplaintCategoryModel>[].obs;
  final RxList<ComplaintSubCategoryModel> subCategories =
      <ComplaintSubCategoryModel>[].obs;
  final RxList<ComplaintLevel3Model> level3Categories =
      <ComplaintLevel3Model>[].obs;

  // Selected items
  Rx<ComplaintCategoryModel?> selectedCategory =
      Rx<ComplaintCategoryModel?>(null);
  Rx<ComplaintSubCategoryModel?> selectedSubCategory =
      Rx<ComplaintSubCategoryModel?>(null);
  Rx<ComplaintLevel3Model?> selectedLevel3Category =
      Rx<ComplaintLevel3Model?>(null);

  // Loading state
  final RxBool isLoading = false.obs;

  ComplaintCategoryController() {
    loadCategories();
  }

  // Load main categories
  void loadCategories() {
    isLoading.value = true;
    try {
      categories.assignAll(complaintCategories);
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
}
