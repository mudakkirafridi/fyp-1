import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students_complaint_app/commons/widgets/custom_textformfield.dart';
import 'package:students_complaint_app/features/authentication/controllers/authentication/sign_up/sign_up_controller.dart';
import 'package:students_complaint_app/features/authentication/screens/sign_up/widgets/elevated_button.dart';

final SignUpController controller = Get.find();

Widget buildStepOne(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CTextFormField(
        controller: controller.fullNameController.value,
        validator: (value) =>
            value == null || value.isEmpty ? 'Full name required' : null,
        keyboardType: TextInputType.text,
        label: 'Full Name',
        hint: 'John Doe',
        prefixIcon: const Icon(Icons.person),
        onChanged: (value) {
          controller.fullNameController.value = value;
        },
      ),
      const SizedBox(height: 10),
      CTextFormField(
        controller: controller.emailController.value,
        validator: (value) => value == null || !GetUtils.isEmail(value)
            ? 'Valid email required'
            : null,
        keyboardType: TextInputType.emailAddress,
        label: 'Email',
        hint: 'email@example.com',
        prefixIcon: const Icon(Icons.email),
        onChanged: (value) {
          controller.emailController.value = value;
        },
      ),
      const SizedBox(height: 10),
      CTextFormField(
        controller: controller.contactController.value,
        validator: (value) =>
            value == null || value.isEmpty ? 'Phone number required' : null,
        keyboardType: TextInputType.phone,
        label: 'Phone Number',
        hint: '1234567890',
        prefixIcon: const Icon(Icons.phone),
        onChanged: (value) {
          controller.contactController.value = value;
        },
      ),
      const SizedBox(height: 10),
      Obx(() => CTextFormField(
            onChanged: (value) {
              controller.registrationKey.value = value;
            },
            validator: (value) => controller.registrationKeyError.value,
            keyboardType: TextInputType.text,
            label: 'Registration Key',
            hint: 'Enter your key',
            prefixIcon: const Icon(Icons.vpn_key),
          )),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CButton(
            label: "NEXT",
            onPressed: () async {
              if (controller.formKey.currentState?.validate() == true) {
                // Validate the registration key asynchronously
                final isValid = await controller
                    .validateRegistrationKey(controller.registrationKey.value);
                if (!isValid) {
                  controller.registrationKeyError.value =
                      'Invalid registration key';
                } else {
                  controller.registrationKeyError.value = null;
                  controller.nextPage();
                }
              }
            },
            width: MediaQuery.of(context).size.width * 0.3,
          ),
        ],
      ),
    ],
  );
}

Widget buildStepTwo(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CTextFormField(
        controller: controller.enrollmentController.value,
        validator: (value) => value == null || value.isEmpty
            ? 'Enrollment number required'
            : null,
        keyboardType: TextInputType.text,
        label: 'Enrollment Number',
        hint: '201022',
        prefixIcon: const Icon(Icons.numbers),
        onChanged: (value) {
          controller.enrollmentController.value = value;
        },
      ),
      const SizedBox(height: 10),
      CTextFormField(
        controller: controller.passwordController.value,
        validator: (value) => value == null || value.length < 6
            ? 'Password must be at least 6 characters'
            : null,
        keyboardType: TextInputType.text,
        obscureText: true,
        label: 'Password',
        hint: '*******',
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: const Icon(Icons.visibility_off),
        onChanged: (value) {
          controller.passwordController.value = value;
        },
      ),
      const SizedBox(height: 10),
      CTextFormField(
        controller: controller.confirmPasswordController.value,
        validator: (value) => value != controller.passwordController.value.text
            ? 'Passwords do not match'
            : null,
        keyboardType: TextInputType.text,
        obscureText: true,
        label: 'Confirm Password',
        hint: '*******',
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: const Icon(Icons.visibility_off),
        onChanged: (value) {
          controller.confirmPasswordController.value = value;
        },
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CButton(
            label: "BACK",
            onPressed: controller.previousPage,
            width: MediaQuery.of(context).size.width * 0.3,
          ),
          CButton(
            label: "NEXT",
            onPressed: () {
              if (controller.formKey.currentState?.validate() == true) {
                controller.nextPage();
              }
            },
            width: MediaQuery.of(context).size.width * 0.3,
          ),
        ],
      ),
    ],
  );
}

Widget buildStepThree(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Obx(() => DropdownButtonFormField<String>(
            decoration: const InputDecoration(
                labelText: 'Academic Level', border: OutlineInputBorder()),
            value: controller.academicLevel.value,
            items: controller.academicLevels.map((level) {
              return DropdownMenuItem<String>(
                value: level,
                child: Text(level),
              );
            }).toList(),
            onChanged: (newValue) {
              controller.academicLevel.value = newValue!;
              controller.academicProgram.value = ''; // Reset academic program
            },
            validator: (value) => value == null || value.isEmpty
                ? 'Please select an academic level'
                : null,
          )),
      const SizedBox(height: 20),
      Obx(() => DropdownButtonFormField<String>(
            decoration: const InputDecoration(
                labelText: 'Academic Program', border: OutlineInputBorder()),
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
            title: const Text('I agree to the terms and conditions'),
            controlAffinity: ListTileControlAffinity.leading,
          )),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CButton(
            label: "BACK",
            onPressed: controller.previousPage,
            width: MediaQuery.of(context).size.width * 0.3,
          ),
          CButton(
            label: "SUBMIT",
            onPressed: () async {
              if (controller.formKey.currentState?.validate() == true) {
                await controller.createUserWithEmailAndPassword(
                  controller.emailController.value.text,
                  controller.passwordController.value.text,
                );
                await controller.saveUserData();
                Get.snackbar('Success', 'Account created successfully!');
              }
            },
            width: MediaQuery.of(context).size.width * 0.3,
          ),
        ],
      ),
    ],
  );
}
