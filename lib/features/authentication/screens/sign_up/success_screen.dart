import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_in/sign_in.dart';
import 'package:students_complaint_app/utils/constants/image_strings.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';
import 'package:students_complaint_app/utils/constants/text_strings.dart';
import 'package:students_complaint_app/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: CSizes.appBarHeight,
              left: CSizes.defaultSpace,
              right: CSizes.defaultSpace,
              bottom: CSizes.defaultSpace),
          child: Column(
            children: [
              Image(
                  width: CHelperFunctions.screenWidth() * 0.6,
                  image: const AssetImage(CImages.staticSuccessIllustration)),
              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              /// Title & Sub-title
              Text(
                CTexts.yourAccountCreatedTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),
              Text(
                CTexts.yourAccountCreatedSubTitle,
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
                    onPressed: () => Get.to(() => const SignInScreen()),
                    child: const Text(CTexts.tContinue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
