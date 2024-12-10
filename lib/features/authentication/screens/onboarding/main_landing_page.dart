import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_in/sign_in.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_up/signup.dart';
import 'package:students_complaint_app/utils/constants/image_strings.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';
import 'package:students_complaint_app/utils/constants/text_strings.dart';

class MainLandingScreen extends StatelessWidget {
  const MainLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: CSizes.spaceBtwSections / 2,
              horizontal: CSizes.spaceBtwSections),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    radius: CSizes.avatarLg,
                    backgroundImage: const AssetImage(CImages.collegeAppLogo),
                  ),
                ],
              ),
              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),
              Column(
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
                  const SizedBox(
                    height: CSizes.spaceBtwItems / 2,
                  ),
                  Center(
                    // gpgc text
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
                  const SizedBox(
                    height: CSizes.spaceBtwItems / 2,
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
                  const SizedBox(
                    height: CSizes.appBarHeight * 2,
                  ),
                  Column(
                    children: [
                      // SIGN IN / SIGN UP SECTION
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .07,
                        child: ElevatedButton(
                          // sign in elevated button
                          onPressed: () {
                            Get.to(() => const SignInScreen());
                            // Navigator.push(context, MaterialPageRoute(builder: (context) =>const SignInScreen()));
                          },
                          child: const Text(
                            'SIGN IN',
                            style: TextStyle(
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w600,
                              fontSize: CSizes.fontSizeMd,
                            ),
                          ),
                        ),
                      ),
                      // some free space
                      const SizedBox(
                        height: CSizes.spaceBtwInputFields,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .07,
                        child: OutlinedButton(
                          // sign up button
                          onPressed: () {
                             Get.to(() => const SignUpScreen());
                          },
                          child: const Text(
                            'SIGN Up',
                            style: TextStyle(
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w600,
                              fontSize: CSizes.fontSizeMd,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              // POWERED BY TEXT SECTION
              Padding(
                padding:
                    const EdgeInsets.only(top: CSizes.spaceBtwSections * 5.3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      CTexts.poweredByText,
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.primary,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
