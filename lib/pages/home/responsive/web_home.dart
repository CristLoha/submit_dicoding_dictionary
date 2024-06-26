import 'package:flutter/material.dart';
import 'package:submit_dicoding_dictionary/pages/benda/benda_page.dart';
import 'package:submit_dicoding_dictionary/pages/kerja/kerja_page.dart';
import 'package:submit_dicoding_dictionary/shared/box_extension.dart';
import '../../../shared/img_string.dart';
import '../../../shared/theme.dart';
import '../../angka/angka_page.dart';
import '../../hewan/hewan_page.dart';
import '../../tempat/tempat_page.dart';
import '../../tumbuhan/tumbuhan_page.dart';

class WebHome extends StatelessWidget {
  const WebHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.heightBox,
            titleKategori(),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(bottom: 40, top: 30),
                scrollDirection: Axis.vertical,
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 40,
                  crossAxisSpacing: 40,
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
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: Image.asset(image)),
                            6.heightBox,
                            Text(
                              title,
                              style: blackTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: medium,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget titleKategori() {
  return Text(
    'Kategori',
    style: blackTextStyle.copyWith(
      fontSize: 20,
      fontWeight: semiBold,
    ),
  );
}
