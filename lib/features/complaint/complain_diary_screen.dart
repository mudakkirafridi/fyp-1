import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<Map<String, int>> fetchComplaintCounts() async {
  try {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return {'total': 0, 'open': 0, 'closed': 0, 'dropped': 0};

    final snapshot = await FirebaseFirestore.instance
        .collection('complaints')
        .where('uid', isEqualTo: uid)
        .get();

    int total = snapshot.docs.length;
    int open = 0;
    int closed = 0;
    int dropped = 0;

    for (var doc in snapshot.docs) {
      final status = doc['status'].toString().toLowerCase();
      if (status == 'open') open++;
      else if (status == 'closed') closed++;
      else if (status == 'dropped') dropped++;
    }

    return {
      'total': total,
      'open': open,
      'closed': closed,
      'dropped': dropped,
    };
  } catch (e) {
    print('Error: $e');
    return {'total': 0, 'open': 0, 'closed': 0, 'dropped': 0};
  }
}
