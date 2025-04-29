import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:students_complaint_app/features/authentication/controllers/authentication/sign_in_controller.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';
import 'package:students_complaint_app/utils/constants/text_strings.dart';
import 'package:students_complaint_app/utils/validators/validation.dart';

class FormSignIn extends StatelessWidget {
  final SignInController controller = Get.put(SignInController());

  FormSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          // Email Field
          TextFormField(
            controller: controller.emailController,
            decoration: const InputDecoration(
              labelText: CTexts.email,
              prefixIcon: Icon(Iconsax.direct_right),
            ),
            validator: (value) {
              return CValidator.validEmptyText(CTexts.email, value!);
            }, // Access the validator function directly
          ),
          const SizedBox(height: CSizes.spaceBtwInputFields),

          // Password Field
          Obx(()=>TextFormField(
            controller: controller.passwordController,
            decoration: InputDecoration(
              labelText: CTexts.password,
              prefixIcon: const Icon(Iconsax.password_check),
              suffixIcon: controller.isPasswordVisible.value
                  ? IconButton(
                      icon: const Icon(Iconsax.eye_slash),
                      onPressed: () {
                        controller.isPasswordVisible.value = !controller.isPasswordVisible.value;
                      },
                    )
                  : IconButton(
                      icon: const Icon(Iconsax.eye),
                      onPressed: () {
                        controller.isPasswordVisible.value = !controller.isPasswordVisible.value;
                      },
                    ),
            ),
            obscureText: controller.isPasswordVisible.value,
            validator: CValidator
                .validatePassword, // Access the validator function directly
          ),),
          const SizedBox(height: CSizes.spaceBtwInputFields),
        ],
      ),
    );
  }
}
