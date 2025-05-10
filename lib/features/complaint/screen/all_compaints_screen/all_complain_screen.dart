import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:students_complaint_app/commons/widgets/custom_text/custom_text.dart';
import 'package:students_complaint_app/utils/constants/colors.dart';
import 'package:students_complaint_app/utils/constants/sizes.dart';

class AllComplaintsScreen extends StatelessWidget {
  const AllComplaintsScreen({super.key});

  Future<List<Map<String, dynamic>>> fetchAllUserComplaints() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return [];

    final snapshot = await FirebaseFirestore.instance
        .collection('complaints')
        .where('uid', isEqualTo: uid)
        .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Complaints"),
        backgroundColor: CColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchAllUserComplaints(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final complaints = snapshot.data!;
          if (complaints.isEmpty) {
            return const Center(
              child: CAppText(
                text: "No complaints found.",
                color: CColors.grey,
                fontSize: CSizes.fontSizeMd,
              ),
            );
          }

          return ListView.builder(
            itemCount: complaints.length,
            itemBuilder: (context, index) {
              final complaint = complaints[index];
              final title = complaint['title'] ?? 'No Title';
              final status = (complaint['status'] ?? 'Unknown').toString();
              final description = complaint['description'] ?? '';

              Color statusColor;
              switch (status.toLowerCase()) {
                case 'open':
                  statusColor = Colors.orange;
                  break;
                case 'closed':
                  statusColor = Colors.green;
                  break;
                case 'dropped':
                  statusColor = Colors.red;
                  break;
                default:
                  statusColor = Colors.grey;
              }

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: CAppText(
                    text: title,
                    fontSize: CSizes.fontSizeMd,
                    fontWeight: FontWeight.w600,
                  ),
                  subtitle: CAppText(
                    text: description,
                    fontSize: CSizes.fontSizeSm,
                    color: CColors.darkerGrey,
                  ),
                  trailing: CAppText(
                    text: status.toUpperCase(),
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
