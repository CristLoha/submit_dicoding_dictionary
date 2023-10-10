import 'package:flutter/material.dart';
import 'package:submit_dicoding_dictionary/pages/tumbuhan/responsive/mobile_tumbuhan.dart';
import 'package:submit_dicoding_dictionary/pages/tumbuhan/responsive/web_tumbuhan.dart';
import '../../widgets/responsive_layout.dart';

class TumbuhanPage extends StatelessWidget {
  const TumbuhanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileTumbuhan(),
        webBody: WebTumbuhan(),
      ),
    );
  }
}
