import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:submit_dicoding_dictionary/shared/box_extension.dart';
import 'package:submit_dicoding_dictionary/shared/theme.dart';

import '../../../widgets/app_input.dart';

class WebAnimal extends StatelessWidget {
  const WebAnimal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: whiteColor),
        title: const Text('Hewan'),
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
            child: const Padding(
              padding: EdgeInsets.only(
                bottom: 25,
                left: 40,
                right: 40,
              ),
              child: AppInput(
                prefixIcon: Icon(Icons.search, size: 28),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                30.heightBox,
                Container(
                  padding: const EdgeInsets.all(6),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: whiteColor,
                  ),
                  child: ListTile(
                    title: Text(
                      'Sedap',
                      style: blackTextStyle.copyWith(
                          fontSize: 20, fontWeight: medium),
                    ),
                    subtitle: Text(
                      'Indonesia',
                      style: greyTextStyle.copyWith(fontSize: 18),
                    ),
                    trailing: FaIcon(
                      FontAwesomeIcons.solidBookmark,
                      color: shamrockGreen,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: whiteColor,
                  ),
                  child: ListTile(
                    title: Text(
                      'Enak',
                      style: blackTextStyle.copyWith(
                          fontSize: 20, fontWeight: medium),
                    ),
                    subtitle: Text(
                      'Indonesia',
                      style: greyTextStyle.copyWith(fontSize: 18),
                    ),
                    trailing: FaIcon(
                      FontAwesomeIcons.bookmark,
                      color: shamrockGreen,
                    ),
                  ),
                ),
                20.heightBox,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
