// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// Future<Map<String, int>> fetchComplaintCounts() async {
//   try {
//     final uid = FirebaseAuth.instance.currentUser?.uid;
//     if (uid == null) return {'total': 0, 'Pending': 0, 'In Progress': 0, 'Resolved': 0};

//     final snapshot = await FirebaseFirestore.instance
//         .collection('complaints')
//         .where('uid', isEqualTo: uid)
//         .get();

//     int total = snapshot.docs.length;
//     int open = 0;
//     int closed = 0;
//     int dropped = 0;

//     for (var doc in snapshot.docs) {
//       final status = doc['status'].toString().toLowerCase();
//       if (status == 'Pending') open++;
//       else if (status == 'In Progress') closed++;
//       else if (status == 'Resolved') dropped++;
//     }

//     return {
//       'total': total,
//       'Pending': open,
//       'In Progress': closed,
//       'Resolved': dropped,
//     };
//   } catch (e) {
//     print('Error: $e');
//     return {'total': 00, 'Pending': 00, 'In Progress': 00, 'Resolved': 00};
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<Map<String, int>> fetchComplaintCounts() async {
  try {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return {'total': 0, 'Pending': 0, 'In Progress': 0, 'Resolved': 0};

    final snapshot = await FirebaseFirestore.instance
        .collection('complaints')
        .where('uid', isEqualTo: uid)
        .get();

    int total = snapshot.docs.length;
    int pending = 0;
    int inProgress = 0;
    int resolved = 0;

    for (var doc in snapshot.docs) {
      final status = doc['status'].toString().toLowerCase();
      if (status == 'pending') pending++;
      else if (status == 'in progress') inProgress++;
      else if (status == 'resolved') resolved++;
    }

    return {
      'total': total,
      'Pending': pending,
      'In Progress': inProgress,
      'Resolved': resolved,
    };
  } catch (e) {
    print('Error: $e');
    return {'total': 0, 'Pending': 0, 'In Progress': 0, 'Resolved': 0};
  }
}


