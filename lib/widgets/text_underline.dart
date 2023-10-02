import 'package:flutter/material.dart';
import 'package:submit_dicoding_dictionary/shared/theme.dart';

class UnderlineText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  const UnderlineText({
    Key? key,
    required this.text,
    this.fontSize = 16,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      /// Hanya menggunakan font default, karena font poppins tidak bisa diberi underline
      /// Tujuan fitur ini dibuat, agar bahasa daerah yang memiliki karakter yang unik, maka diberi underline atau garis bawah, khususnya bahasa Sahu.
      text.replaceAllMapped(
        RegExp(r'_\w'),
        (m) => '${m.group(0)![1]}̲',
      ),
      style: TextStyle(fontSize: fontSize, color: color ?? blackColor),
    );
  }
}
