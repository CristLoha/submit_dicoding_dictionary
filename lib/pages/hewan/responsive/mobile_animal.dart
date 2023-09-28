import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:submit_dicoding_dictionary/pages/detail_hewan/detail_page.dart';
import 'package:submit_dicoding_dictionary/shared/box_extension.dart';
import 'package:submit_dicoding_dictionary/widgets/app_input.dart';

import '../../../shared/theme.dart';

class MobileAnimal extends StatelessWidget {
  const MobileAnimal({super.key});

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
      ),
    );
  }
}
