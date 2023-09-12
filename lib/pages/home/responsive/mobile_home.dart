import 'package:flutter/material.dart';
import 'package:submit_dicoding_dictionary/shared/box_extension.dart';
import 'package:submit_dicoding_dictionary/shared/theme.dart';

class MobileHome extends StatelessWidget {
  const MobileHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.heightBox,
              titleKategori(),
              14.heightBox,
              Expanded(
                  child: GridView.builder(
                itemCount: 8,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18,
                ),
                itemBuilder: (BuildContext context, int index) {},
              ))
            ],
          ),
        ),
      ),
    );
  }
}

Widget titleKategori() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Kategori',
        style: blackTextStyle.copyWith(
          fontSize: 20,
          fontWeight: semiBold,
        ),
      ),
      Text(
        'Semua',
        style: shamrockGreenTekxtStyle.copyWith(
          fontSize: 18,
          fontWeight: medium,
        ),
      ),
    ],
  );
}
