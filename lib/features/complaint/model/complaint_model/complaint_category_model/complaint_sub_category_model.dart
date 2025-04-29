import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_category_model/complaint_level3_model.dart';

class ComplaintSubCategoryModel {
  final String name;
  final List<ComplaintLevel3Model> level3Categories;

  ComplaintSubCategoryModel({
    required this.name,
    required this.level3Categories,
  });

  // Convert model to map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'level3Categories': level3Categories.map((level3Category) => level3Category.toMap()).toList(),
    };
  }

  // Create model from Firestore document
  factory ComplaintSubCategoryModel.fromMap(Map<String, dynamic> map) {
    return ComplaintSubCategoryModel(
      name: map['name'] ?? '',
      level3Categories: List<ComplaintLevel3Model>.from(
        map['level3Categories']?.map((level3CategoryMap) => ComplaintLevel3Model.fromMap(level3CategoryMap)) ?? [],
      ),
    );
  }
}
