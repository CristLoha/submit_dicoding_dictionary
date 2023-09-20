import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:submit_dicoding_dictionary/shared/box_extension.dart';
import 'package:submit_dicoding_dictionary/widgets/button_transparant.dart';
import '../../../shared/theme.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              color: shamrockGreen,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 30,
                  left: 24,
                  right: 24,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Text(
                        'Banyo',
                        style: whiteTextStyle.copyWith(
                          fontSize: 30,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        'Air',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ButtonTransparant(
                            onTap: () {},
                            icon: EvaIcons.copyOutline,
                          ),
                          ButtonTransparant(
                            onTap: () {},
                            icon: FontAwesomeIcons.bookmark,
                          ),
                          ButtonTransparant(
                            onTap: () {},
                            icon: EvaIcons.shareOutline,
                          ),
                          ButtonTransparant(
                            onTap: () {},
                            icon: EvaIcons.volumeUpOutline,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.heightBox,
                ExampleWidget(
                  title: 'Contoh Kalimat',
                  subtitle: 'Saya suka minum air',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExampleWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const ExampleWidget({
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: shamrockGreenTextStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
                Icon(
                  EvaIcons.copyOutline,
                  color: shamrockGreen,
                  size: 26,
                ),
              ],
            ),
            20.heightBox,
            Text(
              subtitle,
              style: blackTextStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
