

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students_complaint_app/commons/widgets/custom_text/custom_text.dart';
import 'package:students_complaint_app/features/complaint/controller/complaint_controller/complaint_controller.dart';
import 'package:students_complaint_app/features/complaint/screen/complaints_screens/complaint_category_screen/complaint_category1_screen/complaint_category1_screen.dart';
import 'package:students_complaint_app/features/complaint/screen/complaints_screens/complaint_dashboard/complaint_dashboard.dart';
import 'package:students_complaint_app/utils/constants/colors.dart';
import 'package:students_complaint_app/utils/constants/image_strings.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';

class ComplaintDairyScreen extends StatefulWidget {
  const ComplaintDairyScreen({super.key});

  @override
  State<ComplaintDairyScreen> createState() => _ComplaintDairyScreenState();
}

class _ComplaintDairyScreenState extends State<ComplaintDairyScreen> {
  // Initialize the controller
  final controller = Get.put(ComplaintsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        // show college logo with opicity
        Positioned(
          top: MediaQuery.of(context).size.height * 0.50,
          // left: MediaQuery.of(context).size.height * 0.01,
          right: MediaQuery.of(context).size.height * 0.07,
          child: const Opacity(
            opacity: 0.05, // Set opacity to 5%
            child: CircleAvatar(
              radius: 150,
              backgroundImage: AssetImage(CImages.collegeAppLogo),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
        ),
        Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.03,
          ),
          height: MediaQuery.of(context).size.height * 0.13,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: CColors.primary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Get.to(() => const ComplaintsDashboard());
                },
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  size: 35,
                  color: CColors.white,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.19,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: CAppText(
                  text: "GPGC's CMS",
                  fontSize: CSizes.fontSizeLg,
                  color: CColors.white,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.17,
          left: MediaQuery.of(context).size.height * 0.09,
          right: MediaQuery.of(context).size.height * 0.05,
          child: const Row(
            children: [
            
              CAppText(
                text: "COMPLAINTS DIARY",
                fontSize: CSizes.fontSizeLg,
                color: CColors.grey,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.24,
          left: MediaQuery.of(context).size.height * 0.035,
          right: MediaQuery.of(context).size.height * 0.03,
          child: Column(
            children: [
              // Totla Complaint Container
              Container(
                height: MediaQuery.of(context).size.height * 0.12,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: CColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CAppText(
                        text: '120',
                        fontSize: CSizes.fontSizeLg * 1.5,
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      const CAppText(
                        text: "TOTAL COMPLAINTS",
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // This row contains three container
              // 1-> Open Complaints
              // 2-> closed complaints
              // 3-> Droped complaints
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // open complaints container
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.26,
                    decoration: BoxDecoration(
                      color: CColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CAppText(
                            text: '12',
                            fontSize: CSizes.fontSizeLg * 1.5,
                            color: Colors.orange.shade700,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          CAppText(
                            text: "OPEN",
                            color: Colors.orange.shade400,
                          )
                        ],
                      ),
                    ),
                  ),
                  // Colsed container
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.26,
                    decoration: BoxDecoration(
                      color: CColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const CAppText(
                            text: '0',
                            fontSize: CSizes.fontSizeLg * 1.5,
                            color: CColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          const CAppText(
                            text: "CLOSED",
                            color: CColors.secondary,
                          )
                        ],
                      ),
                    ),
                  ),
                  // Dropped container
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.26,
                    decoration: BoxDecoration(
                      color: CColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CAppText(
                            text: '0',
                            fontSize: CSizes.fontSizeLg * 1.5,
                            color: Colors.deepPurple.shade700,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          const CAppText(
                            text: "DROPED",
                            color: Colors.purple,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // FEEDBACKS SECTION STARTS
        Positioned(
          top: MediaQuery.of(context).size.height * 0.528,
          left: MediaQuery.of(context).size.height * 0.15,
          // right: MediaQuery.of(context).size.height * 0.05,
          child: const Row(
            children: [
              // SizedBox(
              //   height: 25,
              //   width: 30,
              //   child: Image(
              //       image: AssetImage(
              //           'assets/images/icons/feedback.png')),
              // ),
              CAppText(
                text: "FEEDBACKS",
                fontSize: CSizes.fontSizeLg,
                color: CColors.grey,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

// three container starts here
// 1-> Positive feedback container
// 2-> Negative feedback container
// 3-> Pending feedback container
        Positioned(
          top: MediaQuery.of(context).size.height * 0.59,
          left: MediaQuery.of(context).size.height * 0.03,
          right: MediaQuery.of(context).size.height * 0.03,
          child: Column(
            children: [
              // This row contains three container
              // 1-> Open Complaints
              // 2-> closed complaints
              // 3-> Droped complaints
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Positive complaints container
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.26,
                    decoration: BoxDecoration(
                      color: CColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const CAppText(
                            text: '25',
                            fontSize: CSizes.fontSizeLg * 1.5,
                            color: CColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          const CAppText(
                            text: "POSITIVE",
                            color: CColors.secondary,
                          )
                        ],
                      ),
                    ),
                  ),
                  // Negative feedback container
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.26,
                    decoration: BoxDecoration(
                      color: CColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const CAppText(
                            text: '33',
                            fontSize: CSizes.fontSizeLg * 1.5,
                            color: CColors.error,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          CAppText(
                            text: "NEGATIVE",
                            color: Colors.red.shade500,
                          )
                        ],
                      ),
                    ),
                  ),
                  // Pending feedback container
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.26,
                    decoration: BoxDecoration(
                      color: CColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CAppText(
                            text: '5',
                            fontSize: CSizes.fontSizeLg * 1.5,
                            color: Colors.orange.shade800,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          CAppText(
                            text: "PENDING",
                            color: Colors.orange.shade700,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Floating Action Button section
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.035,
          right: MediaQuery.of(context).size.height * 0.035,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // 1. Expanded FAB (shows only when expanded)
              Obx(() => controller.isExpanded.value
                  ? Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.height * 0.18,
                          decoration: const BoxDecoration(
                              color: CColors.darkerGrey,
                              boxShadow: [
                                BoxShadow(
                                    color: CColors.darkGrey,
                                    blurRadius: 20,
                                    spreadRadius: 1,
                                    offset: Offset(0, 5))
                              ]),
                          child: const CAppText(
                            text: "New Complaint",
                            color: CColors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        // editing Fab
                        FloatingActionButton(
                          mini: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          backgroundColor: Colors.blue.shade500,
                          onPressed: () {
                            Get.to(()=> const ComplaintCategoryOneScreen());
                          },
                          child: const Icon(
                            size: 30,
                            Icons.edit_sharp,
                            color: CColors.white,
                          ),
                        )
                      ],
                    )
                  : const SizedBox()), // Empty container if not expanded

              const SizedBox(height: 15),

              // 2. Main FAB with toggle functionality
              Obx(() => FloatingActionButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    backgroundColor: Colors.orange.shade700,
                    onPressed: controller.toggleFab,
                    child: Icon(
                      size: 35,
                      color: CColors.white,
                      controller.isExpanded.value ? Icons.close : Icons.add,
                    ),
                  )),
            ],
          ),
        ),
      ]),
    );
  }
}
