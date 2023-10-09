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
import '../../detail_hewan/detail_page.dart';

class WebSearch extends StatefulWidget {
  const WebSearch({super.key});

  @override
  State<WebSearch> createState() => _WebSearchState();
}

class _WebSearchState extends State<WebSearch> {
  StreamManager _streamManager = StreamManager();
  final TextEditingController _searchController = TextEditingController();

  List<String> _favoriteIds = [];

  List<DocumentSnapshot> _searchResults = [];
  List<DocumentSnapshot> _allData = [];

  @override
  void initState() {
    super.initState();
    _streamManager = StreamManager();
    _loadFavoriteIds();

    _streamManager.getStreamAllWords().listen((data) {
      setState(() {
        _allData = data.docs;
      });
    });
  }

  void _performSearch(String keyword) {
    if (keyword.isNotEmpty) {
      String lowercaseKeyword = keyword.toLowerCase();

      setState(() {
        _searchResults = _allData.where((document) {
          String kataIndo = document['kataIndo'].toLowerCase();
          String kataSahu = document['kataSahu'].toLowerCase();
          return kataIndo.contains(lowercaseKeyword) ||
              kataSahu.contains(lowercaseKeyword);
        }).toList();
      });
    } else {
      setState(() {
        _searchResults = [];
      });
    }
  }

  Future<void> _loadFavoriteIds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _favoriteIds = prefs.getStringList('favorite_ids') ?? [];
    });
  }

  void _toggleFavoriteStatus(String documentId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      if (_favoriteIds.contains(documentId)) {
        _favoriteIds.remove(documentId);
      } else {
        _favoriteIds.add(documentId);
      }

      prefs.setStringList('favorite_ids', _favoriteIds);
    });
  }

  bool _isFavorite(String documentId) {
    return _favoriteIds.contains(documentId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                controller: _searchController,
                onChanged: (value) {
                  _performSearch(value);
                },
                prefixIcon: const Icon(Icons.search, size: 28),
              ),
              30.heightBox,
              if (_searchController.text.isEmpty)
                StreamBuilder<List<DocumentSnapshot>>(
                  stream: Stream.value(_allData),
                  builder: (
                    context,
                    snapshot,
                  ) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      List<DocumentSnapshot> docs = snapshot.data ?? [];

                      return ShimmerLoadingList(
                        itemCount: docs.length,
                      );
                    } else if (snapshot.hasData) {
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

                                  if (shouldReloadData == true) {
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
              if (_searchController.text.isNotEmpty)
                StreamBuilder<List<DocumentSnapshot>>(
                  stream: Stream.value(_searchResults),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      List<DocumentSnapshot> docs = snapshot.data!;

                      return ShimmerLoadingList(
                        itemCount: docs.length,
                      );
                    } else if (snapshot.hasData) {
                      List<DocumentSnapshot> docs = snapshot.data!;

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
