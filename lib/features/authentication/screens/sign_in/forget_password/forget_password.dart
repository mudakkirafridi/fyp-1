import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:students_complaint_app/features/authentication/controllers/authentication/forget_password_controller.dart';
import 'package:students_complaint_app/utils/constants/text_strings.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';
import 'package:students_complaint_app/utils/validators/validation.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPasswordController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(CTexts.forgetPasswordTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title and Subtitle
              Text(
                CTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              Text(
                CTexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: CSizes.spaceBtwSections),
          
              /// Email Input Field
              TextFormField(
                validator: (value) {
                return CValidator.validEmptyText("Email", value!);
              },
                controller: controller.emailController,
                decoration: const InputDecoration(
                  labelText: CTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: CSizes.spaceBtwSections),
          
              /// Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                     // Validate the form
                    if (controller.formKey.currentState?.validate() ?? false) {
                      // Only proceed if the form is valid
                      controller.resendPasswordResetEmail();
                    }
                   
                  },
                  child: const Text(CTexts.submit),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
