// Model for sub-category
import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_category_model/complaint_level3_model.dart';

class ComplaintSubCategoryModel {
  final String name;
  final List<ComplaintLevel3Model> level3Categories;

  ComplaintSubCategoryModel({
    required this.name,
    required this.level3Categories,
  });
}