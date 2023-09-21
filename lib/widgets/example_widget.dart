import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:submit_dicoding_dictionary/shared/box_extension.dart';
import '../shared/theme.dart';

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
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
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
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: subtitle));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Teks berhasil disalin'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Icon(
                    EvaIcons.copyOutline,
                    color: shamrockGreen,
                    size: 26,
                  ),
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
