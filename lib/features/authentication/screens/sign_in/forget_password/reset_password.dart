import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students_complaint_app/features/authentication/controllers/authentication/forget_password_controller.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_in/sign_in.dart';
import 'package:students_complaint_app/utils/constants/image_strings.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';
import 'package:students_complaint_app/utils/constants/text_strings.dart';
import 'package:students_complaint_app/utils/helpers/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final ResetPasswordController controller = Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => SignInScreen()),
              icon: const Icon(Icons.close)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              Image(
                width: CHelperFunctions.screenWidth() * 0.6,
                image: const AssetImage(CImages.deliveredEmailIllustration),
              ),
              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              /// Title & Sub-title
              Text(
                CTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),
              Text(
                CTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.done,
                  child: const Text(CTexts.done),
                ),
              ),
              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
