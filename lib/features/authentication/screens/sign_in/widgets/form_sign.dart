import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';
import 'package:students_complaint_app/utils/constants/text_strings.dart';

class FormSignIn extends StatelessWidget {
  const FormSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // email
          TextFormField(
            decoration: const InputDecoration(
                labelText: CTexts.email,
                prefixIcon: Icon(Iconsax.direct_right)),
          ),
          const SizedBox(
            height: CSizes.spaceBtwInputFields,
          ),
          // password
          TextFormField(
            decoration: const InputDecoration(
                labelText: CTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash)),
          ),
        ],
      ),
    );
  }
}
