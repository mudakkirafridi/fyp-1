import 'package:flutter/material.dart';
import 'package:students_complaint_app/commons/widgets/custom_text/custom_text.dart';
import 'package:students_complaint_app/utils/constants/colors.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';

class DashboardContainer extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double customHeight, customWidth;
  final VoidCallback onTap;

  const DashboardContainer({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.customHeight,
    required this.customWidth,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.27,
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
            color: CColors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // Shadow position
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imageUrl,
                width: customWidth,
                height: customHeight,
                fit: BoxFit.cover,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              CAppText(
                text: title,
                fontSize: CSizes.fontSizeSm * 0.8,
                color: CColors.darkerGrey,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
