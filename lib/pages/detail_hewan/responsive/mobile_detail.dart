import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:submit_dicoding_dictionary/shared/box_extension.dart';
import 'package:submit_dicoding_dictionary/widgets/button_transparant.dart';
import '../../../shared/theme.dart';
import '../../../widgets/example_widget.dart';

class MobileDetail extends StatelessWidget {
  final dynamic data;

  const MobileDetail({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: whiteColor),
        title: const Text('Kamus Bahasa Sahu'),
        titleTextStyle: whiteTextStyle.copyWith(
          fontWeight: semiBold,
          fontSize: 20,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder<DocumentSnapshot>(
          future:
              FirebaseFirestore.instance.collection('kamus').doc(data).get(),
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

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: shamrockGreen,
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
                            Text(
                              kataSahu,
                              style: whiteTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            20.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ButtonTransparant(
                                  onTap: () {
                                    Clipboard.setData(
                                        ClipboardData(text: kataIndo));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Teks berhasil disalin'),
                                        duration: Duration(seconds: 1),
                                      ),
                                    );
                                  },
                                  icon: EvaIcons.copyOutline,
                                ),
                                ButtonTransparant(
                                  onTap: () {},
                                  icon: FontAwesomeIcons.bookmark,
                                ),
                                ButtonTransparant(
                                  onTap: () {
                                    Share.share(
                                        "Kata ${kataIndo.toUpperCase()} dalam bahasa sahu yaitu ${kataSahu.toUpperCase()} : \nContoh kalimat: \nDefinisi: ");
                                  },
                                  icon: EvaIcons.shareOutline,
                                ),
                                ButtonTransparant(
                                  onTap: () {},
                                  icon: EvaIcons.volumeUpOutline,
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
                        const ExampleWidget(
                          title: 'Contoh Kalimat [ID]',
                          subtitle: 'contohkalimat',
                        ),
                        20.heightBox,
                        ExampleWidget(
                          title: 'Contoh Kalimat [SH]',
                          subtitle: contohSahu,
                        ),
                        20.heightBox,
                        const ExampleWidget(
                          title: 'Definisi',
                          subtitle: 'definisi',
                        ),
                      ],
                    ),
                  ),
                  20.heightBox,
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
