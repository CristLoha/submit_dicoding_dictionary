import 'package:flutter/material.dart';
import 'package:submit_dicoding_dictionary/pages/angka/angka_page.dart';
import 'package:submit_dicoding_dictionary/pages/benda/benda_page.dart';
import 'package:submit_dicoding_dictionary/pages/hewan/hewan_page.dart';
import 'package:submit_dicoding_dictionary/pages/kerja/kerja_page.dart';
import 'package:submit_dicoding_dictionary/pages/tempat/tempat_page.dart';
import 'package:submit_dicoding_dictionary/pages/tumbuhan/tumbuhan_page.dart';
import 'package:submit_dicoding_dictionary/shared/box_extension.dart';
import 'package:submit_dicoding_dictionary/shared/theme.dart';
import '../../../shared/img_string.dart';

class MobileHome extends StatelessWidget {
  const MobileHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kamus Bahasa Sahu'),
      ),
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
              20.heightBox,
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    late String title;
                    late String image;
                    late VoidCallback onTap;

                    switch (index) {
                      case 0:
                        title = "Hewan";
                        image = ImgString.imgCat;
                        onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HewanPage(),
                            ),
                          );
                        };
                        break;
                      case 1:
                        title = "Benda";
                        image = ImgString.imgHammer;
                        onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BendaPage(),
                            ),
                          );
                        };
                        break;
                      case 2:
                        title = "Kerja";
                        image = ImgString.imgChat;
                        onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const KerjaPage(),
                            ),
                          );
                        };
                        break;
                      case 3:
                        title = "Tumbuhan";
                        image = ImgString.imgtree;
                        onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TumbuhanPage(),
                            ),
                          );
                        };
                        break;
                      case 4:
                        title = "Tempat";
                        image = ImgString.imgMap;
                        onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TempatPage(),
                            ),
                          );
                        };
                        break;
                      case 5:
                        title = "Angka";
                        image = ImgString.imgNumbers;
                        onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AngkaPage(),
                            ),
                          );
                        };
                        break;

                      default:
                    }
                    return Material(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(9),
                      child: InkWell(
                        onTap: onTap,
                        borderRadius: BorderRadius.circular(9),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 45,
                                height: 45,
                                child: Image.asset(image)),
                            10.heightBox,
                            Text(
                              title,
                              style: blackTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: medium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
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
    ],
  );
}
