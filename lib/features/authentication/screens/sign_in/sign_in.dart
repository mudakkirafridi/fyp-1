import 'package:flutter/material.dart';
import 'package:students_complaint_app/commons/widgets/custom_text/custom_text.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_in/widgets/circle_avatar.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_in/widgets/forget_password_section.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_in/widgets/form_sign.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_in/widgets/header_green_container.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_in/widgets/registration_section.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_in/widgets/signin_elevated_button.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';
import 'package:students_complaint_app/utils/constants/text_strings.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Prevent overflow when keyboard appears
      body: Stack(
        children: [
          // Background containers (green header + white body)
          Column(
            children: [
              // Green background (Header)
              const HeaderGreenContainerSignIn(),
              // White background for the form container
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ],
          ),
          // Logo positioned between the green header and white body
          const CCircleAvatar(),
          // Main Form and Register Section (Scrollable)
          Positioned.fill(
            // Ensures form starts below the logo
            top: MediaQuery.of(context).size.height * 0.18,
            // Scrollable content
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                // Adjust for keyboard
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Padding(
                padding: const EdgeInsets.all(CSizes.defaultSpace),
                // header text, welcome/ gpgc/cms
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Welcome Texts
                    Center(
                      child: CAppText(
                        text: CTexts.welcomeText,
                        fontSize: 24,
                        color: Theme.of(context).colorScheme.primary,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Center(
                      child: CAppText(
                        text: CTexts.gpgcText,
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.primary,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Center(
                      child: CAppText(
                        text: CTexts.cmsText,
                        textAlign: TextAlign.center,
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.primary,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: CSizes.spaceBtwSections),
                    // Login Form
                    const FormSignIn(),
                    const SizedBox(height: CSizes.spaceBtwItems / 2),
                    // Forget Password Link
                    const ForgetPasswordSignIn(),
                    const SizedBox(height: CSizes.spaceBtwSections),
                    // Login Button
                    const SignInElevatedButton(),
                    const SizedBox(height: CSizes.spaceBtwSections / 2),
                    // Register Section
                    const RegistrationSectionSignIn(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
