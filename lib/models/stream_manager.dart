import 'package:cloud_firestore/cloud_firestore.dart';

class StreamManager {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getStream(String isEqual) {
    return _firestore
        .collection('kamus')
        .where('kategori', isEqualTo: isEqual)
        .snapshots();
  }

  /// Membuat fungsi untuk mencari data berdasarkan kata kunci dan kategori
  Stream<QuerySnapshot> searchData(String keyword, String category) {
    return _firestore
        .collection('kamus')
        .where('kataIndo', isEqualTo: keyword)

        /// Mencari dokumen yang memiliki field kataIndo sama dengan keyword
        .where('kategori', isEqualTo: category)

        /// Mencari dokumen yang memiliki field kategori sama dengan category
        .snapshots();
  }
}
