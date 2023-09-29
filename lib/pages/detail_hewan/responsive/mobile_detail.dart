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
  const MobileDetail({super.key});

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
        child: Column(
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
                        'textCopy1',
                        style: whiteTextStyle.copyWith(
                          fontSize: 30,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        '   arti',
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
                                  ClipboardData(text: "textCopy1"));
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
                                  "Kata artinya: \nContoh kalimat: \nDefinisi: ");
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
                  const ExampleWidget(
                    title: 'Contoh Kalimat [SH]',
                    subtitle: 'contohkalimat',
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
        ),
      ),
    );
  }
}
