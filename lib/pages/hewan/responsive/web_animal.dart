import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:submit_dicoding_dictionary/shared/box_extension.dart';
import 'package:submit_dicoding_dictionary/shared/theme.dart';

import '../../../widgets/app_input.dart';
import '../../detail_hewan/detail_page.dart';

class WebAnimal extends StatelessWidget {
  const WebAnimal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        iconTheme: IconThemeData(color: blackColor),
        backgroundColor: lightBackgroundColor,
        title: const Text('Hewan'),
        titleTextStyle: blackTextStyle.copyWith(
          fontWeight: semiBold,
          fontSize: 20,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 130,
        ),
        children: [
          30.heightBox,
          const SizedBox(
            width: 50,
            child: AppInput(
              prefixIcon: Icon(Icons.search, size: 28),
            ),
          ),
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
                // Navigator.push(context, MaterialPageRoute(
                //   builder: (context) {
                //     return const DetailPage();
                //   },
                // ));
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
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: ListTile(
              title: Text(
                'Enak',
                style:
                    blackTextStyle.copyWith(fontSize: 20, fontWeight: medium),
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
    );
  }
}
