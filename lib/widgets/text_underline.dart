import 'package:flutter/material.dart';

class UnderlineText extends StatelessWidget {
  final String text;

  const UnderlineText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      /// Hanya menggunakan font default, karena font poppins tidak mendukung fitur ini
      text.replaceAllMapped(
        RegExp(r'_\w'),
        (m) => '${m.group(0)![1]}̲',
      ),
      style: const TextStyle(fontSize: 16),
    );
  }
}
