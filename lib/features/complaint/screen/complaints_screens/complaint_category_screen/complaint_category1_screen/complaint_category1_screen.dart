import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students_complaint_app/commons/widgets/custom_text/custom_text.dart';
import 'package:students_complaint_app/features/complaint/controller/complaint_controller/complaint_category_controller/complaint_category_controller.dart';
import 'package:students_complaint_app/utils/constants/colors.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';

class ComplaintCategoryOneScreen extends StatefulWidget {
  const ComplaintCategoryOneScreen({super.key});

  @override
  State<ComplaintCategoryOneScreen> createState() =>
      _ComplaintCategoryOneScreenState();
}

class _ComplaintCategoryOneScreenState
    extends State<ComplaintCategoryOneScreen> {
  @override
  Widget build(BuildContext context) {
    // Initialize GetX controller
    final ComplaintCategoryController controller =
        Get.put(ComplaintCategoryController());

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
                    const Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: CAppText(
                        text: "Select Category L-1",
                        fontSize: CSizes.fontSizeLg,
                        color: CColors.white,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.5,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        size: 35,
                        color: CColors.white,
                      ),
                    ),
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
                padding: const EdgeInsets.all(20.0),
                child: Obx(
                  () {
                    // If categories list is empty, show a loading or empty state
                    if (controller.categories.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    // Display categories in GridView
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.5,
                      ),
                      itemCount: controller.categories.length,
                      itemBuilder: (context, index) {
                        final category = controller.categories[index];
                        return GestureDetector(
                          onTap: () =>
                              // controller.navigateToSubCategoryScreen,
                              controller.navigateToSubCategoryScreen(category),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 32,
                                  backgroundColor: CColors.accent,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: CColors.white,
                                  child: ClipOval(
                                    child: Image.asset(
                                      category
                                          .iconPath, // Path to the image in assets
                                      width: 55.0, // Adjust the width as needed
                                      height:
                                          55.0, // Adjust the height as needed
                                      fit: BoxFit
                                          .contain, // Ensures the entire image fits inside the circle
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                category.name,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: CColors.darkGrey,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
