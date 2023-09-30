import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:submit_dicoding_dictionary/models/stream_manager.dart';
import 'package:submit_dicoding_dictionary/pages/detail_hewan/detail_page.dart';
import 'package:submit_dicoding_dictionary/shared/box_extension.dart';
import 'package:submit_dicoding_dictionary/widgets/app_input.dart';
import 'package:submit_dicoding_dictionary/widgets/shimmer_loading.dart';
import '../../../shared/theme.dart';

class MobileAnimal extends StatefulWidget {
  const MobileAnimal({super.key});

  @override
  State<MobileAnimal> createState() => _MobileAnimalState();
}

class _MobileAnimalState extends State<MobileAnimal> {
  StreamManager _streamManager = StreamManager();
  final TextEditingController _searchController = TextEditingController();

  /// Variabel untuk menyimpan hasil pencarian:
  List<DocumentSnapshot> _searchResults = [];
  List<DocumentSnapshot> _allData = [];

  @override
  void initState() {
    super.initState();
    _streamManager = StreamManager();

    // Ambil semua data hewan saat inisialisasi
    _streamManager.getStream('hewan').listen((data) {
      setState(() {
        _allData = data.docs;
      });
    });
  }

  /// Fungsi _performSearch() untuk melakukan pencarian:
  void _performSearch(String keyword) {
    if (keyword.isNotEmpty) {
      String lowercaseKeyword =
          keyword.toLowerCase(); // Konversi keyword ke huruf kecil

      setState(() {
        /// Filter data yang cocok dengan keyword dalam field 'kataIndo' atau 'kataSahu'
        _searchResults = _allData.where((document) {
          String kataIndo = document['kataIndo']
              .toLowerCase(); // Konversi data 'kataIndo' ke huruf kecil
          String kataSahu = document['kataSahu']
              .toLowerCase(); // Konversi data 'kataSahu' ke huruf kecil
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hewan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              30.heightBox,
              AppInput(
                controller: _searchController,
                onChanged: (value) {
                  _performSearch(
                      value); // Memanggil fungsi pencarian saat teks berubah
                },
                prefixIcon: const Icon(Icons.search, size: 28),
              ),
              30.heightBox,

              /// Tampilan semua data
              if (_searchController.text.isEmpty)
                StreamBuilder<List<DocumentSnapshot>>(
                  stream: Stream.value(_allData),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      /// Menampilkan shimmer saat masih memproses data
                      return const ShimmerLoadingList();
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
                                        return const DetailPage();
                                      },
                                    ),
                                  );
                                },
                                child: Text(
                                  title,
                                  style: blackTextStyle.copyWith(
                                      fontSize: 20, fontWeight: medium),
                                ),
                              ),
                              subtitle: Text(
                                subtitle,
                                style: greyTextStyle.copyWith(fontSize: 18),
                              ),
                              trailing: FaIcon(
                                FontAwesomeIcons.solidBookmark,
                                color: shamrockGreen,
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
                      /// Menampilkan shimmer saat masih memproses data
                      return const ShimmerLoadingList();
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
                                        return const DetailPage();
                                      },
                                    ),
                                  );
                                },
                                child: Text(
                                  title,
                                  style: blackTextStyle.copyWith(
                                      fontSize: 20, fontWeight: medium),
                                ),
                              ),
                              subtitle: Text(
                                subtitle,
                                style: greyTextStyle.copyWith(fontSize: 18),
                              ),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: FaIcon(
                                  FontAwesomeIcons.solidBookmark,
                                  color: shamrockGreen,
                                ),
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
