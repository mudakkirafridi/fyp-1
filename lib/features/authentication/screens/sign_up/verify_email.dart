import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_in/sign_in.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_up/success_screen.dart';
import 'package:students_complaint_app/utils/constants/image_strings.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';
import 'package:students_complaint_app/utils/constants/text_strings.dart';
import 'package:students_complaint_app/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const SignInScreen()),
              icon: const Icon(Icons.close))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              /// Images
              Image(
                  width: CHelperFunctions.screenWidth() * 0.6,
                  image: const AssetImage(CImages.deliveredEmailIllustration)),
              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              /// Title & Sub-title
              Text(
                CTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              Text(
                "Happycoding99@gmail.com",
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),
              Text(
                CTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              /// Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.to(
                      () => const SuccessScreen(),
                    ),
                    child: const Text(CTexts.tContinue),
                  )),
              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {}, child: const Text(CTexts.resendEmail)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
