import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:students_complaint_app/commons/widgets/custom_text/custom_text.dart';
import 'package:students_complaint_app/utils/constants/colors.dart';

class FilteredComplaintsScreen extends StatelessWidget {
  final String status;

  const FilteredComplaintsScreen({super.key, required this.status});

  Future<List<Map<String, dynamic>>> fetchComplaintsByStatus() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return [];

    final snapshot = await FirebaseFirestore.instance
        .collection('complaints')
        .where('uid', isEqualTo: uid)
        .where('status', isEqualTo: status)
        .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$status Complaints'),
        backgroundColor: CColors.primary,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchComplaintsByStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return const Center(child: CircularProgressIndicator());
          if (!snapshot.hasData || snapshot.data!.isEmpty)
            return const Center(child: Text('No complaints found'));

          final complaints = snapshot.data!;
          return ListView.builder(
            itemCount: complaints.length,
            itemBuilder: (context, index) {
              final complaint = complaints[index];
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(complaint['title'] ?? 'No Title'),
                  subtitle: Text(complaint['description'] ?? ''),
                  trailing: Text(
                    complaint['status'],
                    style: TextStyle(color: CColors.primary),
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
