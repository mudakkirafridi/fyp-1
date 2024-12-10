
// Model for top-level complaint category
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
}






