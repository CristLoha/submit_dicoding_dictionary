import 'package:cloud_firestore/cloud_firestore.dart';

class StreamManager {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getStream(String isEqual) {
    return _firestore
        .collection('kamus')
        .where('kategori', isEqualTo: isEqual)
        .snapshots();
  }

  Stream<QuerySnapshot> searchData(String keyword, String category) {
    return _firestore
        .collection('kamus')
        .where('kategori', isEqualTo: category)
        .snapshots();
  }
}
