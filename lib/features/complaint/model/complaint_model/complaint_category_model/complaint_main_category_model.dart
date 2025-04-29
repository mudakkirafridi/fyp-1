import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_category_model/complaint_sub_category_model.dart';

class ComplaintCategoryModel {
  final String name;
  final String iconPath;
  final List<ComplaintSubCategoryModel> subCategories;

  ComplaintCategoryModel({
    required this.name,
    required this.iconPath,
    required this.subCategories,
  });

  // Convert model to map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'iconPath': iconPath,
      'subCategories': subCategories.map((subCategory) => subCategory.toMap()).toList(),
    };
  }

  // Create model from Firestore document
  factory ComplaintCategoryModel.fromMap(Map<String, dynamic> map) {
    return ComplaintCategoryModel(
      name: map['name'] ?? '',
      iconPath: map['iconPath'] ?? '',
      subCategories: List<ComplaintSubCategoryModel>.from(
        map['subCategories']?.map((subCategoryMap) => ComplaintSubCategoryModel.fromMap(subCategoryMap)) ?? [],
      ),
    );
  }
}
