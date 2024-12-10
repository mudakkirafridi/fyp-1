import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students_complaint_app/features/authentication/controllers/authentication/sign_up/sign_up_controller.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_up/widgets/build_steps.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_up/widgets/container_green.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_up/widgets/title_section.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.put(SignUpController());

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
                        const SizedBox(height: CSizes.lg * 1.5),
                        Form(
                              key: controller.formKey,
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height * .98,
                                child: PageView(
                                  
                                  controller: controller.pageController,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    // Step 1: Basic Information
                                    
                                    buildStepOne(context),
                                                    
                                    // Step 2: Enrollment & Password
                                    buildStepTwo(context),
                                                    
                                    // Step 3: Academic Information & Terms of conditions
                                    buildStepThree(context)
                                  ],
                                ),
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
