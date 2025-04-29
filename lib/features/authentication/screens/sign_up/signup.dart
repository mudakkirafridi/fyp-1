import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:students_complaint_app/features/authentication/controllers/authentication/sign_up/sign_up_controller.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_up/widgets/container_green.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_up/widgets/title_section.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';
import 'package:students_complaint_app/utils/constants/text_strings.dart';
import 'package:students_complaint_app/utils/validators/validation.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.put(
        SignUpController()); // Ensure the controller is properly initialized

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
                          key: controller.formKey,
                          child: Column(
                            children: [
                              // Full Name
                              TextFormField(
                                controller: controller.fullNameController,
                                decoration: const InputDecoration(
                                  labelText: CTexts.fullName,
                                  prefixIcon: Icon(Iconsax.user),
                                ),
                                validator: (value) {
                                  return CValidator.validEmptyText(
                                      CTexts.fullName, value!);
                                },
                              ),
                              const SizedBox(height: CSizes.spaceBtwItems),

                              // Email
                              TextFormField(
                                controller: controller.emailController,
                                decoration: const InputDecoration(
                                  labelText: CTexts.email,
                                  prefixIcon: Icon(Iconsax.direct_right),
                                ),
                                validator: (value) {
                                  return CValidator.validateEmail(value);
                                },
                              ),
                              const SizedBox(height: CSizes.spaceBtwItems),

                              // Phone Number
                              TextFormField(
                                controller: controller.phoneNoController,
                                decoration: const InputDecoration(
                                  labelText: CTexts.phoneNo,
                                  prefixIcon: Icon(Iconsax.call),
                                ),
                                validator: (value) {
                                  return CValidator.validatePhoneNumber(value);
                                },
                              ),

                              const SizedBox(height: CSizes.spaceBtwItems),

                              // Password
                              Obx(
                                () => TextFormField(
                                  controller: controller.passwordController,
                                  obscureText:
                                      controller.isPasswordVisible.value,
                                  decoration: InputDecoration(
                                    labelText: CTexts.password,
                                    prefixIcon:
                                        const Icon(Iconsax.password_check),
                                    suffixIcon: controller
                                            .isPasswordVisible.value
                                        ? IconButton(
                                            icon: const Icon(Iconsax.eye_slash),
                                            onPressed: () {
                                              controller
                                                      .isPasswordVisible.value =
                                                  !controller
                                                      .isPasswordVisible.value;
                                            },
                                          )
                                        : IconButton(
                                            icon: const Icon(Iconsax.eye),
                                            onPressed: () {
                                              controller
                                                      .isPasswordVisible.value =
                                                  !controller
                                                      .isPasswordVisible.value;
                                            },
                                          ),
                                  ),
                                  validator: (value) {
                                    return CValidator.validatePassword(value);
                                  },
                                ),
                              ),
                              const SizedBox(height: CSizes.spaceBtwItems),

                              // Registration Number
                              TextFormField(
                                controller: controller.registrationNoController,
                                decoration: const InputDecoration(
                                  labelText: CTexts.registrationNo,
                                  prefixIcon: Icon(Iconsax.hashtag),
                                ),
                                validator: (value) {
                                  return CValidator.validateRegistrationNumber(
                                      value);
                                },
                              ),
                              const SizedBox(height: CSizes.spaceBtwItems),

                              // Academic Level Dropdown
                              Obx(
                                () => DropdownButtonFormField<String>(
                                  value: controller.academicLevel.value,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  items: controller.academicLevels.map((level) {
                                    return DropdownMenuItem<String>(
                                      value: level,
                                      child: Text(level),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    controller.academicLevel.value = newValue!;
                                  },
                                  validator: (value) {
                                    return CValidator.validateAcademicLevel(
                                        value);
                                  },
                                ),
                              ),
                              const SizedBox(height: CSizes.spaceBtwItems),

                              // Terms & Conditions Checkbox
                              Row(
                                children: [
                                  Obx(
                                    () => SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: Checkbox(
                                        value: controller.termsAccepted.value,
                                        onChanged: (value) {
                                          controller.termsAccepted.value =
                                              value!;
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Text.rich(TextSpan(children: [
                                    TextSpan(text: CTexts.iAgreeTo),
                                    TextSpan(
                                      text: CTexts.privacyPolicy,
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    TextSpan(text: CTexts.and),
                                    TextSpan(
                                      text: CTexts.termsOfUse,
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ])),
                                ],
                              ),

                              const SizedBox(height: CSizes.spaceBtwSections),

                              // Create Account Button
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      controller.submitForm();
                                    }
                                  },
                                  child: const Text(CTexts.createAccount),
                                ),
                              ),
                            ],
                          ),
                        ),
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
