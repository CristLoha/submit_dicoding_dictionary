import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:submit_dicoding_dictionary/shared/box_extension.dart';
import 'package:submit_dicoding_dictionary/shared/theme.dart';

import '../../detail_hewan/detail_page.dart';

class MobileBookmark extends StatelessWidget {
  const MobileBookmark({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: ListView(
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
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const DetailPage();
                  },
                ));
              },
              title: Text(
                'Sedap',
                style:
                    blackTextStyle.copyWith(fontSize: 20, fontWeight: medium),
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
        ],
      ),
    );
  }
}
