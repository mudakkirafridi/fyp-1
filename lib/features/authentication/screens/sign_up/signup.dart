import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:students_complaint_app/features/authentication/controllers/authentication/sign_up/sign_up_controller.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_up/verify_email.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_up/widgets/container_green.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_up/widgets/title_section.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';
import 'package:students_complaint_app/utils/constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = SignUpController();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const ContainerGreen(),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.1,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(CSizes.defaultSpace),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TitleSection(),
                        const SizedBox(height: CSizes.spaceBtwSections),
                        Form(
                            child: Column(
                          children: [
                            /* --------------- Form ----------*/
                            // full name
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: CTexts.fullName,
                                prefixIcon: Icon(Iconsax.user),
                              ),
                            ),
                            const SizedBox(height: CSizes.spaceBtwItems),
                            // full name
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: CTexts.email,
                                prefixIcon: Icon(Iconsax.direct_right),
                              ),
                            ),
                            const SizedBox(height: CSizes.spaceBtwItems),
                            // phone number
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: CTexts.phoneNo,
                                prefixIcon: Icon(Iconsax.call),
                              ),
                            ),

                            /// password
                            const SizedBox(height: CSizes.spaceBtwItems),
                            // phone number
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: CTexts.password,
                                prefixIcon: Icon(
                                  Iconsax.password_check,
                                ),
                                suffixIcon: Icon(Iconsax.eye_slash),
                              ),
                            ),
                            const SizedBox(height: CSizes.spaceBtwItems),

                            /// registeration number
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: CTexts.registrationNo,
                                prefixIcon: Icon(Iconsax.hashtag),
                              ),
                            ),
                            const SizedBox(height: CSizes.spaceBtwItems),

                            /// academic level
                            Obx(
                              () => DropdownButtonFormField<String>(
                                value: controller.academicLevel
                                    .value, // Current selected value
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                items: controller.academicLevels.map((level) {
                                  return DropdownMenuItem<String>(
                                    value: level, // Value to be returned
                                    child: Text(level), // Displayed text
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  controller.academicLevel.value =
                                      newValue!; // Update the selected value
                                },
                              ),
                            ),
                            const SizedBox(height: CSizes.spaceBtwItems),

                            /// terms & conditions
                            Row(
                              children: [
                                SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: Checkbox(
                                        value: (true), onChanged: (Value) {})),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text.rich(TextSpan(children: [
                                  TextSpan(
                                    text: CTexts.iAgreeTo,
                                  ),
                                  TextSpan(
                                      text: CTexts.privacyPolicy,
                                      style: TextStyle(color: Colors.blue)),
                                  TextSpan(text: CTexts.and),
                                  TextSpan(
                                      text: CTexts.termsOfUse,
                                      style: TextStyle(color: Colors.blue)),
                                ])),
                              ],
                            ),

                            /// create account button
                            const SizedBox(
                              height: CSizes.spaceBtwSections,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () =>
                                    Get.to(() => const VerifyEmailScreen()),
                                child: const Text(CTexts.createAccount),
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
