import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:students_complaint_app/features/authentication/screens/onboarding/main_landing_page.dart';
import 'package:students_complaint_app/features/complaint/screen/complaints_screens/complaint_diary/complaint_diary.dart';
import 'package:students_complaint_app/utils/constants/colors.dart';
import 'package:students_complaint_app/utils/constants/image_strings.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize Animation Controller
    _animationController = AnimationController(
      duration: const Duration(seconds: 2), // Animation duration
      vsync: this,
    )..repeat(reverse: true); // Repeat animation with reverse

    // Scale Animation (Zoom in and out)
    _scaleAnimation =
        Tween<double>(begin: 0.8, end: 1.2).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut, // Smooth easing
    ));

    // Timer for 5 seconds
    Timer(const Duration(seconds: 5), () {
      // Check if the user is logged in
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        // Navigate to ComplaintDashboard if user is logged in
        Get.off(() => const ComplaintDairyScreen());
      } else {
        // Navigate to MainLandingPage if user is not logged in
        Get.off(() => const MainLandingScreen());
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo
          const CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage(CImages.collegeAppLogo),
          ),
          const SizedBox(height: 20),
          // Animated Text Content
          ScaleTransition(
            scale: _scaleAnimation,
            child: const Center(
              child: Text(
                'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: CColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: CSizes.defaultSpace),
          ScaleTransition(
            scale: _scaleAnimation,
            child: const Text(
              'السَّلَامُ عَلَيْكُمْ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: CColors.primary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: CSizes.defaultSpace),
          ScaleTransition(
            scale: _scaleAnimation,
            child: const Text(
              '''حضرت مُحَمَّد ﷺ
خَاتَمُ النَّبِیِّیْن صَلَّی اللّٰہُ عَلَیْہِ
وَعَلٰی آلِہٖ وَاصْحَابِہٖ وَسَلَّمَ
پَر کروڑوں دُرُود و سَلام''',
              style: TextStyle(
                fontSize: 16,
                color: CColors.primary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:students_complaint_app/features/authentication/screens/onboarding/main_landing_page.dart';
// import 'package:students_complaint_app/features/complaint/screen/complaints_screens/complaint_dashboard/complaint_dashboard.dart';
// import 'package:students_complaint_app/utils/constants/colors.dart';
// import 'package:students_complaint_app/utils/constants/image_strings.dart';
// import 'package:students_complaint_app/utils/constants/sizes.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Timer for 5 seconds
//     Timer(const Duration(seconds: 5), () {
//       // Check if the user is logged in
//       User? currentUser = FirebaseAuth.instance.currentUser;

//       if (currentUser != null) {
//         // Navigate to ComplaintDashboard if user is logged in
//         Get.off(() => const ComplaintsDashboard());
//       } else {
//         // Navigate to MainLandingPage if user is not logged in
//         Get.off(() => const MainLandingScreen());
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Logo
//           CircleAvatar(
//             radius: 80,
//             backgroundImage: AssetImage(CImages.collegeAppLogo),
//           ),
//           SizedBox(height: 20),
//           // Text content
//           Center(
//             child: Text(
//               'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ',
//               style: TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//                 color: CColors.primary,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           SizedBox(height: CSizes.defaultSpace),
//           Text(
//             'السَّلَامُ عَلَيْكُمْ',
//             style: TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//               color: CColors.primary,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(height: CSizes.defaultSpace),
//           Text(
//             '''حضرت مُحَمَّد ﷺ
// خَاتَمُ النَّبِیِّیْن صَلَّی اللّٰہُ عَلَیْہِ
// وَعَلٰی آلِہٖ وَاصْحَابِہٖ وَسَلَّمَ
// پَر کروڑوں دُرُود و سَلام''',
//             style: TextStyle(
//               fontSize: 20,
//               color: CColors.primary,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }


