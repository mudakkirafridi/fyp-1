import 'package:flutter/material.dart';
import 'package:students_complaint_app/utils/constants/colors.dart';
import 'package:students_complaint_app/utils/constants/image_strings.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';

class CCircleAvatar extends StatelessWidget {
  const CCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.07,
      left: 0,
      right: 0,
      child: Center(
        child: CircleAvatar(
          radius: CSizes.avatarMd,
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          child: const CircleAvatar(
            backgroundColor: CColors.white,
            radius: CSizes.avatarSm,
            backgroundImage: AssetImage(CImages.collegeAppLogo),
          ),
        ),
      ),
    );
  }
}
