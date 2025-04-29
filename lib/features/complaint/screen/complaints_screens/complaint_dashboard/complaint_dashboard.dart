// views/complaints_dashboard.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students_complaint_app/commons/widgets/custom_text/custom_text.dart';
import 'package:students_complaint_app/features/complaint/screen/complaints_screens/complaint_diary/complaint_diary.dart';
import 'package:students_complaint_app/features/complaint/screen/complaints_screens/complaint_dashboard/widgets/dashboard_container.dart';
import 'package:students_complaint_app/utils/constants/colors.dart';
import 'package:students_complaint_app/utils/constants/image_strings.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';

class ComplaintsDashboard extends StatefulWidget {
  const ComplaintsDashboard({super.key});

  @override
  State<ComplaintsDashboard> createState() => _ComplaintsDashboardState();
}

class _ComplaintsDashboardState extends State<ComplaintsDashboard> {
  String? userName;

@override
 initState() {
  fetchUserData();
  
  super.initState();
}

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
        ),
        Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.04,
          ),
          height: MediaQuery.of(context).size.height * 0.15,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: CColors.primary,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                // Drawer section using menu iconbutton
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu_outlined,
                        size: 30,
                        color: CColors.white,
                      )),
                ],
              ),
              Row(
                // appbar text
                children: [
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: CAppText(
                          text: "GPGC's CMS",
                          fontSize: CSizes.fontSizeLg,
                          color: CColors.white,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  // Notification and message buttons
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications_outlined,
                              size: 30,
                              color: CColors.white,
                            )),
                      ),
                      // message icon
                      IconButton(
                        onPressed: () {},
                        icon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.mail_outline,
                              size: 30,
                              color: CColors.white,
                            )),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.17,
          // left: MediaQuery.of(context).size.height * 0.01,
          right: MediaQuery.of(context).size.height * 0.07,
          child: Row(
            children: [
              const CAppText(
                text: "WELCOME ",
                fontSize: CSizes.fontSizeLg,
                color: CColors.primary,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
                textAlign: TextAlign.center,
              ),
            CAppText(
    text:  userName.toString(),
    fontSize: CSizes.fontSizeLg,
    color: CColors.secondary,
    fontWeight: FontWeight.w500,
    letterSpacing: 1,
    textAlign: TextAlign.center,
  )

            ],
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.23,
          left: MediaQuery.of(context).size.height * 0.03,
          right: MediaQuery.of(context).size.height * 0.0285,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                // complaint container
            DashboardContainer(
                onTap: () {
                  Get.to(()=> const ComplaintDairyScreen());
                },
                customHeight: 60,
                customWidth: 65,
                imageUrl: "assets/images/icons/complaint.png",
                title: 'Complaints'),
                // suggestions container
            DashboardContainer(
                onTap: () {},
                customHeight: 60,
                customWidth: 60,
                imageUrl: "assets/images/icons/suggestion.png",
                title: 'Suggestions'),
                // updates container
            DashboardContainer(
                onTap: () {},
                customHeight: 60,
                customWidth: 60,
                imageUrl: "assets/images/icons/updates.png",
                title: 'Updates'),
          ]),
        ),
       Positioned(
  top: MediaQuery.of(context).size.height * 0.45,
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

      ]),
    );
  }

fetchUserData() async {
  final User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (userDoc.exists) {
      final userData = userDoc.data() as Map<String, dynamic>;
      
     setState(() {
       userName = userData['full_name'];
     });
      // Do something with the user data
    }
  }
}

}
///
///
