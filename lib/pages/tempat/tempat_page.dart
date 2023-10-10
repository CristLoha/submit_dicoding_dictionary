import 'package:flutter/material.dart';
import 'package:submit_dicoding_dictionary/pages/tempat/responsive/mobile_tempat.dart';
import 'package:submit_dicoding_dictionary/pages/tempat/responsive/web_tempat.dart';
import '../../widgets/responsive_layout.dart';

class TempatPage extends StatelessWidget {
  const TempatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: ResponsiveLayout(
        mobileBody: MobileTempat(),
        webBody: WebTempat(),
      ),
    );
  }
}
