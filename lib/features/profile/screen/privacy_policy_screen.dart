import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy & Terms of Use'),
      ),
      body: const Padding(
        padding:  EdgeInsets.all(16.0),
        child:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use the Complaint Management System (CMS) of our college. By using this application, you agree to the collection and use of information in accordance with this policy.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 15),
              Text(
                '1. Information We Collect',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
               '''- Personal Information: We may collect your name, email, phone number, and registration number to identify users.
- Complaint Details: Any grievances submitted, including descriptions and attachments.
- Device Information: Technical data such as IP address, browser type, and operating system may be collected for security purposes.''',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 15),
              Text(
                '2. How We Use Your Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '''- To process and respond to complaints.
- To improve user experience and system functionality.
- To communicate updates and notifications regarding complaints.
- To ensure compliance with institutional policies.''',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 15),
              Text(
                '3. Data Protection & Security',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'We implement appropriate security measures to protect user data. However, no method of electronic storage is 100% secure. We encourage users to report any security concerns.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Terms of Use',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'By accessing and using the Complaint Management System, you agree to the following terms:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 15),
              Text(
                '1. Usage Guidelines',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '''- The CMS is intended for legitimate student grievances only.
- Users must provide accurate information while submitting complaints.
- Harassment, misuse, or false complaints may lead to disciplinary action.''',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 15),
              Text(
                '2. User Responsibilities',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '''- Users are responsible for maintaining the confidentiality of their account.
- Users must not attempt unauthorized access to the system.
- Any misuse of the system will result in action as per institutional policies.''',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 15),
              Text(
                '3. Amendments',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'The college administration reserves the right to update this policy at any time. Users will be notified of significant changes.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 15),
              Text(
                'For any questions or concerns, contact the college administration.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
