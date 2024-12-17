import 'package:flutter/material.dart';
import 'package:students_complaint_app/utils/constants/colors.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';

class CTextFormField extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final TextInputType keyboardType;

  const CTextFormField({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    required Function(dynamic value) onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle:
            const TextStyle(color: CColors.grey, fontSize: CSizes.fontSizeSm),
        labelStyle:
            const TextStyle(fontSize: CSizes.fontSizeSm, color: CColors.grey),
        errorStyle: const TextStyle(fontSize: 10),
      ),
    );
  }
}
