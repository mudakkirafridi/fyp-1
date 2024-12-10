import 'package:flutter/material.dart';
import 'package:students_complaint_app/commons/widgets/custom_text/custom_text.dart';
import 'package:students_complaint_app/utils/constants/colors.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';

class ContainerGreen extends StatelessWidget {
  const ContainerGreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03,),
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      color: CColors.primary,
      child: const CAppText(
        text: "Registration",
        fontSize: CSizes.fontSizeLg,
        color: CColors.white,
        fontWeight: FontWeight.w800,
        letterSpacing: 1.5,
        textAlign: TextAlign.center,
      ),
    );
  }
}