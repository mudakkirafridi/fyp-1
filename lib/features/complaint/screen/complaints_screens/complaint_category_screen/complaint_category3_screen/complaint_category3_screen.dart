import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students_complaint_app/commons/widgets/custom_text/custom_text.dart';
import 'package:students_complaint_app/features/complaint/controller/complaint_controller/complaint_category_controller/complaint_category_controller.dart';
import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_category_model/complaint_level3_model.dart';
import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_category_model/complaint_main_category_model.dart';
import 'package:students_complaint_app/features/complaint/model/complaint_model/complaint_category_model/complaint_sub_category_model.dart';
import 'package:students_complaint_app/utils/constants/colors.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';

class ComplaintSubCategory3Screen extends StatefulWidget {
  const ComplaintSubCategory3Screen({super.key});

  @override
  State<ComplaintSubCategory3Screen> createState() =>
      _ComplaintSubCategory3ScreenState();
}

class _ComplaintSubCategory3ScreenState
    extends State<ComplaintSubCategory3Screen> {
  @override
  Widget build(BuildContext context) {
    final ComplaintCategoryController controller = Get.find();

    return Scaffold(
      body: Stack(
        children: [
          // Top container with app bar and back button
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.07,
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
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_outlined,
                    size: 35,
                    color: CColors.white,
                  ),
                ),
                // App bar title and search icon
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.27,
                          top: 7),
                      child: const CAppText(
                        text: "New Complaint",
                        fontSize: CSizes.fontSizeLg,
                        color: CColors.white,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.5,
                        textAlign: TextAlign.center,
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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.05,
                        horizontal: MediaQuery.of(context).size.height * 0.02),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    text: "SUBJECT ",
                                    style: TextStyle(
                                      fontSize: CSizes.fontSizeLg,
                                      color: CColors.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "*",
                                        style: TextStyle(
                                          color: CColors.error,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                                height: CSizes.spaceBtwInputFields / 2),

                            /// TEXT FORM FIELS FOR COMPLAINT SUBJECT
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Enter subject here",
                                hintText: "Academic",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8.0,
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.04),
                                // Adding rounded border
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                // Border when the TextField is focused
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: const BorderSide(
                                    color: Colors
                                        .blue, // Customize the color for focused state
                                    width: 2.0,
                                  ),
                                ),
                                // Border when the TextField is enabled but not focused
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: const BorderSide(
                                    color: Colors
                                        .grey, // Customize the color for enabled state
                                    width: 1.0,
                                  ),
                                ),
                                // Border when the TextField is disabled
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                // Optional: Adding icon or suffix to show mandatory field or additional hints
                                suffixIcon:
                                    const Icon(Icons.edit, color: Colors.grey),
                              ),
                              style: const TextStyle(
                                  fontSize: 16.0), // Adjust text size if needed
                            ),

                            const SizedBox(
                                height: CSizes.spaceBtwInputFields / 2),
                            const Row(
                              children: [
                                CAppText(
                                  text: "Minimum 5 characters",
                                  fontSize: 10,
                                  color: CColors.error,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                            const SizedBox(height: CSizes.spaceBtwInputFields),
                            const Divider(
                              thickness: 1,
                              color: CColors.grey,
                            )
                          ],
                        ),
                        const SizedBox(height: CSizes.spaceBtwInputFields),
                        // Level one category section

                        Column(
                          children: [
                            Row(
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    text: "CATEGORY 1 ",
                                    style: TextStyle(
                                      fontSize: CSizes.fontSizeLg,
                                      color: CColors.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "*",
                                        style: TextStyle(
                                          color: CColors.error,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                                height: CSizes.spaceBtwInputFields / 2),

                            /// LEVEL ONE CATEGORY DROP DOWN

                            Obx(() =>
                                DropdownButtonFormField<ComplaintCategoryModel>(
                                  isExpanded: true,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          30.0), // Circular border
                                      borderSide: const BorderSide(
                                        color: CColors
                                            .grey, // Customize border color
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          30.0), // Circular border
                                      borderSide: const BorderSide(
                                        color: CColors
                                            .grey, // Customize border color
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  value: controller.selectedCategory.value,
                                  items: controller.categories.map((category) {
                                    return DropdownMenuItem(
                                        value: category,
                                        child: Text(
                                          category.name,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: CColors.darkGrey,
                                              fontWeight: FontWeight.w600),
                                        ));
                                  }).toList(),
                                  onChanged: (selected) {
                                    if (selected != null) {
                                      controller.loadSubCategories(selected);
                                    }
                                  },
                                )),

                            const SizedBox(
                                height: CSizes.spaceBtwInputFields / 2),
                            const Row(
                              children: [],
                            ),
                            const SizedBox(height: CSizes.spaceBtwInputFields),
                            const Divider(
                              thickness: 1,
                              color: CColors.grey,
                            )
                          ],
                        ),
                        const SizedBox(height: CSizes.spaceBtwInputFields),
                        // Level two category section

                        Column(
                          children: [
                            Row(
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    text: "CATEGORY 2 ",
                                    style: TextStyle(
                                      fontSize: CSizes.fontSizeLg,
                                      color: CColors.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "*",
                                        style: TextStyle(
                                          color: CColors.error,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                                height: CSizes.spaceBtwInputFields / 2),

                            /// LEVEL TWO CATEGORY DROP DOWN
                            Obx(() => DropdownButtonFormField<
                                    ComplaintSubCategoryModel>(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          30.0), // Circular border
                                      borderSide: const BorderSide(
                                        color: CColors
                                            .grey, // Customize border color
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          30.0), // Circular border
                                      borderSide: const BorderSide(
                                        color: CColors
                                            .grey, // Customize border color
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  isExpanded: true,
                                  value: controller.selectedSubCategory.value,
                                  items: controller.subCategories
                                      .map((subCategory) {
                                    return DropdownMenuItem(
                                      value: subCategory,
                                      child: Text(
                                        subCategory.name,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: CColors.darkGrey,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (selected) {
                                    if (selected != null) {
                                      controller.selectedSubCategory.value =
                                          selected; // Update selected subcategory
                                      controller.loadLevel3Categories(
                                          selected); // Load level 3 categories based on selected subcategory
                                    }
                                  },
                                )),

                            const SizedBox(height: CSizes.spaceBtwInputFields),
                            const Row(
                              children: [],
                            ),
                            const SizedBox(height: CSizes.spaceBtwInputFields),
                            const Divider(
                              thickness: 1,
                              color: CColors.grey,
                            )
                          ],
                        ),
                        const SizedBox(height: CSizes.spaceBtwInputFields),
                        // Level three category section

                        Column(
                          children: [
                            Row(
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    text: "CATEGORY 3 ",
                                    style: TextStyle(
                                      fontSize: CSizes.fontSizeLg,
                                      color: CColors.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "*",
                                        style: TextStyle(
                                          color: CColors.error,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                                height: CSizes.spaceBtwInputFields / 2),

                            /// LEVEL THREE CATEGORY DROP DOWN
                            Obx(() =>
                                DropdownButtonFormField<ComplaintLevel3Model>(
                                  isExpanded: true,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          30.0), // Circular border
                                      borderSide: const BorderSide(
                                        color: CColors
                                            .grey, // Customize border color
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          30.0), // Circular border
                                      borderSide: const BorderSide(
                                        color: CColors
                                            .grey, // Customize border color
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  value:
                                      controller.selectedLevel3Category.value,
                                  items: controller.level3Categories
                                      .map((level3Category) {
                                    return DropdownMenuItem(
                                      value: level3Category,
                                      child: Text(
                                        level3Category.name,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: CColors.darkGrey,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (selected) {
                                    controller.selectedLevel3Category.value =
                                        selected; // Update selected level 3 category
                                  },
                                )),

                            const SizedBox(
                                height: CSizes.spaceBtwInputFields / 2),
                            const Row(
                              children: [],
                            ),
                            const SizedBox(height: CSizes.spaceBtwInputFields),
                            const Divider(
                              thickness: 1,
                              color: CColors.grey,
                            ),
                            const SizedBox(height: CSizes.spaceBtwInputFields),
                          ],
                        ),
                        // complaint details sections
                        Column(
                          children: [
                            Row(
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    text: "COMPLAINT DETAILS ",
                                    style: TextStyle(
                                      fontSize: CSizes.fontSizeLg,
                                      color: CColors.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "*",
                                        style: TextStyle(
                                          color: CColors.error,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                                height: CSizes.spaceBtwInputFields / 2),

                            /// TEXT FORM FIELS FOR COMPLAINT SUBJECT
                            TextFormField(
                              maxLines: 3,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                labelText: "Write a detailed complaint",
                                hintText:
                                    '"Please provide a detailed description of your complaint". Example:The projector in the lecture room is not working during class.',
                                hintStyle: const TextStyle(
                                    fontSize: 10, color: CColors.grey),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 60.0,
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.04),
                                // Adding rounded border
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                // Border when the TextField is focused
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: const BorderSide(
                                    color: CColors.grey,
                                    width: 2.0,
                                  ),
                                ),
                                // Border when the TextField is enabled but not focused
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: const BorderSide(
                                    color: Colors
                                        .grey, // Customize the color for enabled state
                                    width: 1.0,
                                  ),
                                ),
                                // Border when the TextField is disabled
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                // Optional: Adding icon or suffix to show mandatory field or additional hints
                                suffixIcon:
                                    const Icon(Icons.edit, color: Colors.grey),
                              ),
                              style: const TextStyle(
                                  fontSize: 16.0), // Adjust text size if needed
                            ),

                            const SizedBox(
                                height: CSizes.spaceBtwInputFields / 2),
                            const Row(
                              children: [
                                CAppText(
                                  text: "Minimum 30 characters",
                                  fontSize: 10,
                                  color: CColors.error,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                            const SizedBox(height: CSizes.spaceBtwInputFields),
                            const Divider(
                              thickness: 1,
                              color: CColors.grey,
                            )
                          ],
                        ),
                        const SizedBox(height: CSizes.spaceBtwInputFields),
                        // file attachment section
                        Column(
                          children: [
                            const Row(
                              children: [
                                Text(
                                  "ATTACHMENTS",
                                  style: TextStyle(
                                    fontSize: CSizes.fontSizeSm,
                                    color: CColors.primary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: CSizes.spaceBtwInputFields),
                            Row(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: const StadiumBorder(),
                                        padding: EdgeInsets.all(
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                        )),
                                    onPressed: () {},
                                    child: const Text(
                                      "CHOSE FILE",
                                      style: TextStyle(
                                        fontSize: CSizes.fontSizeSm,
                                        color: CColors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: CSizes.spaceBtwInputFields),
                            const Divider(
                              thickness: 1,
                              color: CColors.grey,
                            )
                          ],
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: CSizes.spaceBtwInputFields),
                            Text(
                                "Note: Uploading any illegal material can lead to legal proceedings.",
                                style: TextStyle(
                                  fontSize: CSizes.fontSizeSm,
                                  color: CColors.error,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign
                                    .center // Center aligns the text within its container
                                ),
                            SizedBox(height: CSizes.spaceBtwInputFields * 2),
                          ],
                        ),
                        Column(
                          
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.height * 0.7,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.01,
                                )),
                                onPressed: () {},
                                child: const Text(
                                  "SUBMIT",
                                  style: TextStyle(
                                    fontSize: CSizes.fontSizeLg,
                                    color: CColors.white,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.5
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
