import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students_complaint_app/commons/widgets/custom_textformfield.dart';
import 'package:students_complaint_app/features/authentication/controllers/authentication/sign_up/sign_up_controller.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_up/widgets/elevated_button.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';
 final SignUpController controller = Get.put(SignUpController());

Widget buildStepOne(BuildContext context) {
  return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
       CTextFormField(
        
         validator: (value) => value == null || value.isEmpty
                        ? 'Full name required'
                        : null,
        keyboardType: TextInputType.text,
        label: 'Full Name',
        hint: 'Jawad Khan',
        prefixIcon: const Icon(Icons.person),
      ),
       const SizedBox(height: CSizes.spaceBtwInputFields),
        CTextFormField(
        validator: (value) => value == null || value.isEmpty
                        ? 'Valid email required'
                        : null,
        keyboardType: TextInputType.emailAddress,
        label: 'Email',
        hint: 'abcd@gmail.com',
        prefixIcon: const Icon(Icons.email),
      ),
       const SizedBox(height: CSizes.spaceBtwInputFields),
        CTextFormField(
        validator: (value) => value == null || value.isEmpty
                        ? 'Mobile no. required'
                        : null,
        keyboardType: TextInputType.phone,
        label: 'Phone Number',
        hint: '030XXXXXXXX',
        prefixIcon: const Icon(Icons.phone),
      ),
      
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CButton(
                            label: "NEXT",
                            onPressed: controller.nextPage,
                            width: MediaQuery.of(context).size.width * 0.3),
                      ],
                    ),
                  )
    ],
  );
}
/////////////////////////////////////////////////////////////////////

// Build Step two

Widget buildStepTwo(BuildContext context) {
  return  Column(
    children: [
       CTextFormField(
        validator: (value) => value == null || value.isEmpty
                        ? 'Correct registeration no. required'
                        : null,
        keyboardType: TextInputType.text,
        label: 'Enrollment Number',
        hint: '201022',
        prefixIcon: const Icon(Icons.numbers),
      ),
       const SizedBox(height: CSizes.spaceBtwInputFields),
       CTextFormField(
        controller: controller.passwordController.value,
        validator: (value) => value == null || value.length < 6
                        ? 'Password must be at least 6 characters'
                        : null,
        keyboardType: TextInputType.text,
        obscureText: false,
        label: 'Password',
        hint: '*******',
        prefixIcon: const Icon(Icons.password),
        suffixIcon: const Icon(Icons.visibility_off),
      ),
       const SizedBox(height: CSizes.spaceBtwInputFields),
       CTextFormField(
        controller: controller.confirmPasswordController.value,
        validator: (value) =>
                        value != controller.passwordController.value.text
                            ? 'Passwords do not match'
                            : null,
        keyboardType: TextInputType.text,
        obscureText: false,
        label: 'Confirm Password',
        hint: '********',
        prefixIcon: const Icon(Icons.password),
        suffixIcon: const Icon(Icons.visibility_off),
      ),
       const SizedBox(height: 20),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CButton(
                            label: "BACK",
                            onPressed: controller.previousPage,
                            width: MediaQuery.of(context).size.width * 0.3),
                    CButton(
                            label: "NEXT",
                            onPressed: controller.nextPage,
                            width: MediaQuery.of(context).size.width * 0.3),
                      ],
                    ),
                  ),
    ],
  );
}

Widget buildStepThree(BuildContext context){
  return Column(
                children: [
                  Obx(() => DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                            labelText: 'Academic Level',
                            border: OutlineInputBorder()),
                        value: controller.academicLevel.value,
                        items: controller.academicLevels.map((level) {
                          return DropdownMenuItem<String>(
                            value: level,
                            child: Text(level),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          controller.academicLevel.value = newValue!;
                          controller.academicProgram.value = '';
                        },
                        validator: (value) => value == null || value.isEmpty
                            ? 'Please select an academic level'
                            : null,
                      )),
                  const SizedBox(height: 20),
                  Obx(() => DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                            labelText: 'Academic Program',
                            border: OutlineInputBorder()),
                        value: controller.academicProgram.value.isEmpty
                            ? null
                            : controller.academicProgram.value,
                        items: controller.programsForSelectedLevel.map((program) {
                          return DropdownMenuItem<String>(
                            value: program,
                            child: Text(program),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          controller.academicProgram.value = newValue!;
                        },
                        validator: (value) => value == null || value.isEmpty
                            ? 'Please select an academic program'
                            : null,
                      )),
                  const SizedBox(height: 20),
                  Obx(() => CheckboxListTile(
                        value: controller.termsAccepted.value,
                        onChanged: (value) {
                          controller.termsAccepted.value = value ?? false;
                        },
                        title:
                            const Text('I agree to the terms and conditions'),
                        controlAffinity: ListTileControlAffinity.leading,
                      )),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CButton(
                            label: "BACK",
                            onPressed: controller.previousPage,
                            width: MediaQuery.of(context).size.width * 0.3),
                        CButton(
                            label: "SUBMIT",
                            onPressed: controller.nextPage,
                            width: MediaQuery.of(context).size.width * 0.3),
                      ],
                    ),
                  ),
                ],
              );
}