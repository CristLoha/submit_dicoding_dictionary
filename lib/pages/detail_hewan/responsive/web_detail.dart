import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:submit_dicoding_dictionary/shared/box_extension.dart';
import '../../../shared/theme.dart';
import '../../../widgets/button_transparant.dart';
import '../../../widgets/example_widget.dart';

class WebDetail extends StatelessWidget {
  const WebDetail({super.key});

  @override
  Widget build(BuildContext context) {
    const String textCopy1 = 'Banyo';
    const String contohkalimat = "Saya suka minum air";
    const String definisi =
        "Cairan jernih tidak berwarna, tidak berasa, dan tidak berbau yang diperlukan dalam kehidupan manusia, hewan, dan tumbuhan yang secara kimiawi mengandung hidrogen dan oksigen";
    const String arti = 'Air';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightBackgroundColor,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: blackColor),
        title: const Text('Kamus Bahasa Sahu'),
        titleTextStyle: blackTextStyle.copyWith(
          fontWeight: semiBold,
          fontSize: 20,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
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
                  padding:const  EdgeInsets.only(
                    bottom: 30,
                    left: 24,
                    right: 24,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        Text(
                          textCopy1,
                          style: whiteTextStyle.copyWith(
                            fontSize: 30,
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          arti,
                          style: whiteTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        20.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonTransparant(
                              onTap: () {
                                Clipboard.setData(
                               const      ClipboardData(text: textCopy1));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Teks berhasil disalin'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              },
                              icon: EvaIcons.copyOutline,
                            ),
                            12.widthBox,
                            ButtonTransparant(
                              onTap: () {},
                              icon: FontAwesomeIcons.bookmark,
                            ),
                            12.widthBox,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.heightBox,
                  const ExampleWidget(
                    title: 'Contoh Kalimat',
                    subtitle: contohkalimat,
                  ),
                  20.heightBox,
                  const ExampleWidget(
                    title: 'Definisi',
                    subtitle: definisi,
                  ),
                ],
              ),
              20.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
