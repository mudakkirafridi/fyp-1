import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students_complaint_app/commons/widgets/custom_text/custom_text.dart';
import 'package:students_complaint_app/features/complaint/complain_diary_screen.dart';
import 'package:students_complaint_app/features/complaint/controller/complaint_controller/complaint_category_controller/complaint_category_controller.dart';
import 'package:students_complaint_app/features/complaint/screen/all_compaints_screen/all_complain_screen.dart';
import 'package:students_complaint_app/features/complaint/screen/complaints_screens/complaint_category_screen/complaint_category1_screen/complaint_category1_screen.dart';
import 'package:students_complaint_app/features/filtered_complain_screen/filtered_complain_screen.dart';
import 'package:students_complaint_app/features/profile/screen/app_drawer.dart';
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
  final controller = Get.put(ComplaintCategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      centerTitle: true,
       iconTheme: const IconThemeData(color: Colors.white), 
      backgroundColor: CColors.primary,
      title: Text("GPGC's CMS",style: TextStyle(fontSize: 20,color: CColors.textWhite),),
      ),
          drawer: const AppDrawer(),
      body: Stack(children: [
        // show college logo with opicity
        Positioned(
          top: MediaQuery.of(context).size.height * 0.30,
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

        Positioned(
          top: MediaQuery.of(context).size.height * 0.05,
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
  top: MediaQuery.of(context).size.height * 0.12,
  left: MediaQuery.of(context).size.height * 0.035,
  right: MediaQuery.of(context).size.height * 0.03,
  child: FutureBuilder<Map<String, int>>(
    future: fetchComplaintCounts(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return const Center(child: CircularProgressIndicator());
      }

      final data = snapshot.data!;
      return Column(
        children: [
          // Total complaints
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
                    text: '${data['total']}',
                    fontSize: CSizes.fontSizeLg * 1.5,
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  InkWell(
                    onTap: (){
                      // i want total complaints screen in this 
                      Get.to(AllComplaintsScreen());
                    },
                    child: const CAppText(
                      text: "TOTAL COMPLAINTS",
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCountCard(
                count: data['Pending']!,
                label: "Pending",
                color: Colors.orange.shade700,
                textColor: Colors.orange.shade400,
                
              ),
              _buildCountCard(
                count: data['In Progress']!,
                label: "In Progress",
                color: CColors.primary,
                textColor: CColors.secondary,
              ),
              _buildCountCard(
                count: data['Resolved']!,
                label: "Resolved",
                color: Colors.deepPurple.shade700,
                textColor: Colors.purple,
              ),
            ],
          )
        ],
      );
    },
  ),
),

        // FEEDBACKS SECTION STARTS
        Positioned(
          top: MediaQuery.of(context).size.height * 0.45,
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
          top: MediaQuery.of(context).size.height * 0.52,
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
                            Get.offAll(
                                () => const ComplaintCategoryOneScreen());
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
// Update with actual path

Widget _buildCountCard({
  required int count,
  required String label,
  required Color color,
  required Color textColor,
}) {
  return InkWell(
    onTap: () {
      Get.to(() => FilteredComplaintsScreen(status: label));
    },
    child: Container(
      height: MediaQuery.of(Get.context!).size.height * 0.12,
      width: MediaQuery.of(Get.context!).size.width * 0.26,
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
              text: '$count',
              fontSize: CSizes.fontSizeLg * 1.5,
              color: color,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: MediaQuery.of(Get.context!).size.height * 0.015,
            ),
            CAppText(
              text: label.toUpperCase(),
              color: textColor,
            )
          ],
        ),
      ),
    ),
  );
}


}



