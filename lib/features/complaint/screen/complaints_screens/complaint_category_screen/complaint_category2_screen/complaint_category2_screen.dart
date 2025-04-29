import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students_complaint_app/commons/widgets/custom_text/custom_text.dart';
import 'package:students_complaint_app/features/complaint/controller/complaint_controller/complaint_category_controller/complaint_category_controller.dart';
import 'package:students_complaint_app/utils/constants/colors.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';

class ComplaintSubCategoryScreen extends StatefulWidget {
  const ComplaintSubCategoryScreen({super.key});

  @override
  State<ComplaintSubCategoryScreen> createState() =>
      _ComplaintSubCategoryScreenState();
}

class _ComplaintSubCategoryScreenState
    extends State<ComplaintSubCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final ComplaintCategoryController controller = Get.find();

    return Scaffold(
      body: Stack(
        children: [
          // Top container with app bar and back button
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
            ),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: CColors.primary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_outlined,
                      size: 35,
                      color: CColors.white,
                    ),
                  ),
                ),
                // App bar title and search icon
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.2,
                          top: MediaQuery.of(context).size.height * 0.02),
                      child: const CAppText(
                        text: "Select Subcategory",
                        fontSize: CSizes.fontSizeLg,
                        color: CColors.white,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.5,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: const Icon(
                    //     Icons.search,
                    //     size: 35,
                    //     color: CColors.white,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),

          // Content container
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.85,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: CColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.03,
                ),
                child: Obx(
                  () => ListView.separated(
                    itemCount: controller.subCategories.length,
                    itemBuilder: (context, index) {
                      final subCategory = controller.subCategories[index];
                      return ListTile(
                        title: CAppText(
                          text: subCategory.name,
                          fontSize: 12,
                          color: CColors.darkGrey,
                          fontWeight: FontWeight.w500,
                        ),
                        leading: const CircleAvatar(
                          radius: 25,
                          backgroundColor: CColors.grey,
                        ),
                        trailing: CircleAvatar(
                          radius: 15,
                  
                          backgroundColor: CColors.secondary.withOpacity(.2),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: CColors.darkerGrey,
                            size: 16,
                          ),
                        ),
                        onTap: () {
                          controller
                              .navigateToLevel3CategoryScreen(subCategory);
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                      color: CColors.lightContainer,
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
