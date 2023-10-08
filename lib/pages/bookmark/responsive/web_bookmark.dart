import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:submit_dicoding_dictionary/pages/detail_hewan/detail_page.dart';

import '../../../shared/theme.dart';
import '../../../widgets/shimmer_loading.dart';
import '../../../widgets/text_underline.dart';

class WebBookmark extends StatefulWidget {
  const WebBookmark({super.key});

  @override
  State<WebBookmark> createState() => _WebBookmarkState();
}

class _WebBookmarkState extends State<WebBookmark> {
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

  /// Fungsi untuk memuat daftar ID favorit dari SharedPreferences
  Future<void> _loadFavoriteIds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // Baca daftar ID favorit dari SharedPreferences
      _bookmarkedIds = prefs.getStringList('favorite_ids') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: bookmarkedIds.isEmpty
          ? const Center(
              child: Text('Belum ada data yang diarsip'),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 130,
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
                          title: GestureDetector(
                            onTap: () async {
                              String documentId =
                                  bookmarkedId; // Ambil ID dari SharedPreferences

                              // Navigasikan ke halaman detail dengan data yang sesuai
                              final shouldReloadData = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DetailPage(
                                      data:
                                          documentId, // Kirim ID sebagai parameter ke halaman detail
                                    );
                                  },
                                ),
                              );

                              /// Memeriksa apakah ada perubahan data yang perlu dimuat ulang
                              if (shouldReloadData == true) {
                                /// Memuat ulang data preferensi jika terjadi perubahan
                                _loadFavoriteIds();
                              }
                            },
                            child: UnderlineText(
                              text: documentData?['kataIndo'] ?? '',
                              fontSize: 20,
                              fontWeight: medium,
                            ),
                          ),
                          subtitle: UnderlineText(
                            text: documentData?['kataSahu'] ?? '',
                            fontSize: 18,
                            color: greyColor,
                            fontWeight: medium,
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
