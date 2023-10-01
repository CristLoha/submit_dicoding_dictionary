import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:submit_dicoding_dictionary/shared/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:submit_dicoding_dictionary/widgets/shimmer_loading.dart';

class MobileBookmark extends StatefulWidget {
  const MobileBookmark({super.key});

  @override
  State<MobileBookmark> createState() => _MobileBookmarkState();
}

class _MobileBookmarkState extends State<MobileBookmark> {
  List<String> _bookmarkedIds = [];

  List<String> get bookmarkedIds => _bookmarkedIds;

  void setBookmarkedIds(List<String> newBookmarkedIds) {
    _bookmarkedIds = newBookmarkedIds;
  }

  @override
  void initState() {
    super.initState();

    /// Load data bookmarkedIds dari SharedPreferences
    loadBookmarkedIds();
  }

  /// Fungsi untuk mengambil data dari SharedPreferences
  void loadBookmarkedIds() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _bookmarkedIds = prefs.getStringList('favorite_ids') ?? [];
    });
  }

  /// Fungsi untuk menambah atau menghapus ID favorit dari daftar
  void _toggleFavoriteStatus(String documentId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      if (bookmarkedIds.contains(documentId)) {
        /// Menghapus ID dari daftar favorit jika data sudah ada
        bookmarkedIds.remove(documentId);
      } else {
        /// Menambahkan ID ke daftar favorit jika belum ada
        bookmarkedIds.add(documentId);
      }

      /// Menyimpan daftar ID favorit yang baru ke SharedPreferences
      prefs.setStringList('favorite_ids', bookmarkedIds);
    });
  }

  void _deleteAllBookmarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      bookmarkedIds.clear(); // Menghapus semua ID favorit
    });

    /// Menyimpan daftar ID favorit yang baru ke SharedPreferences (kosong)
    prefs.remove('favorite_ids');

    // Menampilkan notifikasi
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Semua arsip telah dihapus',
          style: TextStyle(
            color: Colors.white, // Warna teks notifikasi
            fontSize: 16, // Ukuran teks notifikasi
          ),
        ),
        backgroundColor: Colors.green, // Warna latar belakang notifikasi
        duration: Duration(seconds: 2), // Durasi tampil notifikasi
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arsip'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              _deleteAllBookmarks(); // Memanggil fungsi untuk menghapus semua arsip
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      backgroundColor: lightBackgroundColor,
      body: bookmarkedIds.isEmpty
          ? const Center(
              child: Text('Belum ada data yang diarsip'),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 30,
              ),
              itemCount: bookmarkedIds.length,
              itemBuilder: (context, index) {
                String bookmarkedId = bookmarkedIds[index];

                /// Menampilkan dokumen yang sesuai berdasarkan ID yang ditempatkan di bookmarkedIds
                return FutureBuilder<DocumentSnapshot>(
                  future: FirebaseFirestore.instance
                      .collection('kamus')
                      .doc(bookmarkedId)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return ShimmerLoadingList(
                        itemCount: bookmarkedId.length,
                      );
                    }
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (snapshot.hasData) {
                      final documentData = snapshot.data;

                      return Container(
                        padding: const EdgeInsets.all(6),
                        margin: const EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: whiteColor,
                        ),
                        child: ListTile(
                          title: Text(
                            documentData?['kataIndo'] ?? '',
                            style: blackTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: medium,
                            ),
                          ),
                          subtitle: Text(
                            documentData?['kataSahu'] ?? '',
                            style: greyTextStyle.copyWith(fontSize: 18),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              _toggleFavoriteStatus(bookmarkedId);
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.solidBookmark,
                              color: shamrockGreen,
                            ),
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                );
              },
            ),
    );
  }
}
