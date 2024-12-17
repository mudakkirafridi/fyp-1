import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_in/forget_password/reset_password.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';
import 'package:students_complaint_app/utils/constants/text_strings.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              Text(
                CTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),
              Text(
                CTexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: CSizes.spaceBtwSections * 2,
              ),

              /// TextField
              TextFormField(
                decoration: const InputDecoration(
                  labelText: CTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              /// Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () =>
                        Get.offAll(() => const ResetPasswordScreen()),
                    child: const Text(CTexts.submit)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
