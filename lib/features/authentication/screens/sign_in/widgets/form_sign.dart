import 'package:flutter/material.dart';
import 'package:students_complaint_app/commons/widgets/custom_textformfield.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';

class FormSignIn extends StatelessWidget {
  const FormSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Column(
        children: [
          // Email Field
          CTextFormField(
             keyboardType: TextInputType.emailAddress,
              label: 'Email',
              hint: 'abcd@gmail.com',
              prefixIcon: Icon(Icons.email),
            ),
          SizedBox(height: CSizes.spaceBtwInputFields),
          // Password Field
        CTextFormField(
            obscureText: true,
              label: 'Password',
              hint: '123@abc',
               suffixIcon: Icon(Icons.visibility_off),
            ),
          
        ],
      ),
    );
  }
}