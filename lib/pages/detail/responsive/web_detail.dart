import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:submit_dicoding_dictionary/shared/box_extension.dart';
import '../../../shared/theme.dart';
import '../../../widgets/button_transparant.dart';
import '../../../widgets/example_widget.dart';
import '../../../widgets/text_underline.dart';

class WebDetail extends StatefulWidget {
  final dynamic data;

  const WebDetail({
    super.key,
    required this.data,
  });

  @override
  State<WebDetail> createState() => _WebDetailState();
}

class _WebDetailState extends State<WebDetail> {
  List<String> _favoriteIds = [];

  /// Fungsi untuk memuat daftar ID favorit dari SharedPreferences
  Future<void> _loadFavoriteIds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _favoriteIds = prefs.getStringList('favorite_ids') ?? [];
    });
  }

  @override
  void initState() {
    super.initState();
    _loadFavoriteIds();
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
        elevation: 0,
        backgroundColor: lightBackgroundColor,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            /// Kembali ke halaman sebelumnya dengan status perubahan
            Navigator.pop(context, true);
          },
        ),
        iconTheme: IconThemeData(color: blackColor),
        title: const Text('Kamus Bahasa Sahu'),
        titleTextStyle: blackTextStyle.copyWith(
          fontWeight: semiBold,
          fontSize: 20,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('kamus')
              .doc(widget.data)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Padding(
                padding: const EdgeInsets.only(top: 300),
                child: Center(
                  child: CircularProgressIndicator(
                    color: shamrockGreen,
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || !snapshot.data!.exists) {
              return const Text('Dokumen tidak ditemukan');
            } else {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              String kataIndo = data['kataIndo'] as String;
              String kataSahu = data['kataSahu'] as String;
              String contohSahu = data['contohSahu'] as String;
              String contohIndo = data['contohIndo'] as String;
              String definisi = data['definisi'] as String;
              bool isFavorite = _isFavorite(widget.data);
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: shamrockGreen,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 30,
                          left: 24,
                          right: 24,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Column(
                            children: [
                              Text(
                                kataIndo,
                                style: whiteTextStyle.copyWith(
                                  fontSize: 30,
                                  fontWeight: semiBold,
                                ),
                              ),
                              UnderlineText(
                                text: kataSahu,
                                color: whiteColor,
                                fontSize: 20,
                              ),
                              20.heightBox,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ButtonTransparant(
                                    onTap: () {
                                      Clipboard.setData(
                                          ClipboardData(text: kataIndo));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Teks berhasil disalin'),
                                          duration: Duration(seconds: 1),
                                        ),
                                      );
                                    },
                                    icon: EvaIcons.copyOutline,
                                  ),
                                  12.widthBox,
                                  ButtonTransparant(
                                    onTap: () {
                                      _toggleFavoriteStatus(widget.data);
                                    },
                                    icon: isFavorite
                                        ? FontAwesomeIcons.solidBookmark
                                        : FontAwesomeIcons.bookmark,
                                  ),
                                  12.widthBox,
                                  ButtonTransparant(
                                    onTap: () {
                                      Share.share(
                                          "Kata ${kataIndo.toUpperCase()} dalam bahasa sahu yaitu ${kataSahu.toUpperCase()} : \nContoh kalimat: ${contohSahu.toUpperCase()} yang artinya ${contohIndo.toUpperCase()}"
                                          " \nDefinisi dari ${kataIndo.toUpperCase()}, yaitu: ${definisi.toUpperCase()}");
                                    },
                                    icon: EvaIcons.shareOutline,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.heightBox,
                          ExampleWidget(
                            title: 'Contoh Kalimat [ID]',
                            subtitle: contohIndo,
                          ),
                          20.heightBox,
                          ExampleWidget(
                            title: 'Contoh Kalimat [SH]',
                            subtitle: contohSahu,
                          ),
                          20.heightBox,
                          ExampleWidget(
                            title: 'Definisi',
                            subtitle: definisi,
                          ),
                        ],
                      ),
                    ),
                    20.heightBox,
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
