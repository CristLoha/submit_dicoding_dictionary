import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:submit_dicoding_dictionary/shared/box_extension.dart';

import '../../../models/stream_manager.dart';
import '../../../shared/theme.dart';
import '../../../widgets/app_input.dart';
import '../../../widgets/shimmer_loading.dart';
import '../../../widgets/text_underline.dart';
import '../../detail/detail_page.dart';

class WebTumbuhan extends StatefulWidget {
  const WebTumbuhan({super.key});

  @override
  State<WebTumbuhan> createState() => _WebTumbuhanState();
}

class _WebTumbuhanState extends State<WebTumbuhan> {
  StreamManager _streamManager = StreamManager();
  final TextEditingController _searchController = TextEditingController();

  List<String> _favoriteIds = [];

  /// Daftar ID dokumen favorit
  /// Variabel untuk menyimpan hasil pencarian:
  List<DocumentSnapshot> _searchResults = [];
  List<DocumentSnapshot> _allData = [];

  @override
  void initState() {
    super.initState();
    _streamManager = StreamManager();
    _loadFavoriteIds();

    /// Muat daftar ID favorit saat aplikasi dimuat
    /// Ambil semua data hewan saat inisialisasi
    _streamManager.getStreamKategori('tumbuhan').listen((data) {
      setState(() {
        _allData = data.docs;
      });
    });
  }

  /// Fungsi _performSearch() untuk melakukan pencarian:
  void _performSearch(String keyword) {
    if (keyword.isNotEmpty) {
      String lowercaseKeyword = keyword.toLowerCase();

      /// Konversi keyword ke huruf kecil

      setState(() {
        /// Filter data yang cocok dengan keyword dalam field 'kataIndo' atau 'kataSahu'
        _searchResults = _allData.where((document) {
          /// Konversi ke huruf kecil
          String kataIndo = document['kataIndo'].toLowerCase();
          String kataSahu = document['kataSahu'].toLowerCase();
          return kataIndo.contains(lowercaseKeyword) ||
              kataSahu.contains(lowercaseKeyword);
        }).toList();
      });
    } else {
      /// Kosongkan hasil pencarian jika keyword kosong
      setState(() {
        _searchResults = [];
      });
    }
  }

  /// Fungsi untuk memuat daftar ID favorit dari SharedPreferences
  Future<void> _loadFavoriteIds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // Baca daftar ID favorit dari SharedPreferences
      _favoriteIds = prefs.getStringList('favorite_ids') ?? [];
    });
  }

  /// Fungsi untuk menambah atau menghapus ID favorit dari daftar
  void _toggleFavoriteStatus(String documentId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      if (_favoriteIds.contains(documentId)) {
        /// Hapus ID dari daftar favorit jika sudah ada
        _favoriteIds.remove(documentId);
      } else {
        /// Tambahkan ID ke daftar favorit jika belum ada
        _favoriteIds.add(documentId);
      }

      /// Simpan daftar ID favorit yang baru ke SharedPreferences
      prefs.setStringList('favorite_ids', _favoriteIds);
    });
  }

  /// Fungsi untuk mengecek apakah dokumen dengan ID tertentu adalah favorit
  bool _isFavorite(String documentId) {
    return _favoriteIds.contains(documentId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        iconTheme: IconThemeData(color: blackColor),
        backgroundColor: lightBackgroundColor,
        title: const Text('Kata Hewan'),
        titleTextStyle: blackTextStyle.copyWith(
          fontWeight: semiBold,
          fontSize: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 130,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              30.heightBox,
              AppInput(
                hintText: "Cari kata tumbuhan...",
                controller: _searchController,
                onChanged: (value) {
                  _performSearch(
                      value); // Memanggil fungsi pencarian saat teks berubah
                },
                prefixIcon: const Icon(Icons.search, size: 28),
              ),
              30.heightBox,

              /// Tampilkan semua data
              if (_searchController.text.isEmpty)
                StreamBuilder<List<DocumentSnapshot>>(
                  stream: Stream.value(_allData),
                  builder: (
                    context,
                    snapshot,
                  ) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      List<DocumentSnapshot> docs = snapshot.data ?? [];

                      /// Menampilkan shimmer saat masih memproses data
                      return ShimmerLoadingList(
                        itemCount: docs.length,
                      );
                    } else if (snapshot.hasData) {
                      /// Setelah data diterima, maka data akan ditampilkan
                      List<DocumentSnapshot> docs = snapshot.data!;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          String title = docs[index]['kataIndo'];
                          String subtitle = docs[index]['kataSahu'];
                          String documentId = docs[index].id;
                          bool isFavorite = _isFavorite(documentId);
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
                                  final shouldReloadData = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return DetailPage(
                                          data: documentId,
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
                                  text: title,
                                  fontSize: 20,
                                  fontWeight: medium,
                                ),
                              ),
                              subtitle: UnderlineText(
                                text: subtitle,
                                color: greyColor,
                                fontSize: 18,
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  _toggleFavoriteStatus(documentId);
                                },
                                icon: FaIcon(
                                    isFavorite
                                        ? FontAwesomeIcons.solidBookmark
                                        : FontAwesomeIcons.bookmark,
                                    color:
                                        isFavorite ? shamrockGreen : greyColor),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),

              /// Tampilan hasil pencarian
              if (_searchController.text.isNotEmpty)
                StreamBuilder<List<DocumentSnapshot>>(
                  stream: Stream.value(_searchResults),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      List<DocumentSnapshot> docs = snapshot.data!;

                      /// Menampilkan shimmer saat masih memproses data
                      return ShimmerLoadingList(
                        itemCount: docs.length,
                      );
                    } else if (snapshot.hasData) {
                      /// Setelah data diterima, maka data akan ditampilkan
                      List<DocumentSnapshot> docs = snapshot.data!;

                      ///jika tidak ada kata cocok
                      if (docs.isEmpty) {
                        return const Center(
                          child: Text('Tidak ada data yang ditemukan.'),
                        );
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          String title = docs[index]['kataIndo'];
                          String subtitle = docs[index]['kataSahu'];
                          String documentId = docs[index].id;
                          bool isFavorite = _isFavorite(documentId);

                          return Container(
                            padding: const EdgeInsets.all(6),
                            margin: const EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: whiteColor,
                            ),
                            child: ListTile(
                              title: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return DetailPage(
                                          data: documentId,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: UnderlineText(
                                  text: title,
                                  fontSize: 20,
                                  fontWeight: medium,
                                ),
                              ),
                              subtitle: UnderlineText(
                                text: subtitle,
                                fontSize: 18,
                                color: greyColor,
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  _toggleFavoriteStatus(documentId);
                                },
                                icon: FaIcon(
                                    isFavorite
                                        ? FontAwesomeIcons.solidBookmark
                                        : FontAwesomeIcons.bookmark,
                                    color:
                                        isFavorite ? shamrockGreen : greyColor),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
