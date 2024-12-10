import 'package:flutter/material.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_in/widgets/forget_password_section.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_in/widgets/form_sign.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_in/widgets/registration_section.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_in/widgets/signin_elevated_button.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';
import 'package:students_complaint_app/utils/constants/text_strings.dart';

class HeaderTextColumnSignIn extends StatelessWidget {
  const HeaderTextColumnSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Welcome Texts
        Center(
          child: Text(
            CTexts.welcomeText,
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).colorScheme.primary,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Center(
          child: Text(
            CTexts.gpgcText,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).colorScheme.primary,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Center(
          child: Text(
            CTexts.cmsText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).colorScheme.primary,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        const SizedBox(height: CSizes.spaceBtwSections),
        // Login Form
       const FormSignIn(),
        const SizedBox(height: CSizes.spaceBtwItems / 2),
        // Forget Password Link
      const  ForgetPasswordSignIn(),
        const SizedBox(height: CSizes.spaceBtwSections),
        // Login Button
      const  SignInElevatedButton(),
        const SizedBox(height: CSizes.spaceBtwSections / 2),
        // Register Section
       const RegistrationSectionSignIn(),
      ],
    );
  }
}

