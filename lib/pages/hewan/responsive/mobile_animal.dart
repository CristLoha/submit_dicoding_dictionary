import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> getStream(String collection) {
    return _firestore.collection(collection).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hewan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            30.heightBox,
            const AppInput(
              prefixIcon: Icon(Icons.search, size: 28),
            ),
            30.heightBox,
            Container(
              padding: const EdgeInsets.all(6),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteColor,
              ),
              child: StreamBuilder<QuerySnapshot>(
                stream: getStream('kamus'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Tampilkan tampilan shimmer saat masih loading
                    return ShimmerLoadingList();
                  } else if (snapshot.hasData) {
                    // Setelah data diterima, tampilkan data aktual
                    List<DocumentSnapshot> docs = snapshot.data!.docs;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        String title = docs[index]['kataIndo'];
                        String subtitle = docs[index]['kataSahu'];
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DetailPage();
                                },
                              ),
                            );
                          },
                          title: Text(
                            title,
                            style: blackTextStyle.copyWith(
                                fontSize: 20, fontWeight: medium),
                          ),
                          subtitle: Text(
                            subtitle,
                            style: greyTextStyle.copyWith(fontSize: 18),
                          ),
                          trailing: FaIcon(
                            FontAwesomeIcons.solidBookmark,
                            color: shamrockGreen,
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    return const Center(
                      child: Text('Masukkan kata kunci untuk mencari.'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
