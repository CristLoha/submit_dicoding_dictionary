import 'package:flutter/material.dart';
import 'package:submit_dicoding_dictionary/pages/hewan/responsive/mobile_hewan.dart';
import 'package:submit_dicoding_dictionary/pages/hewan/responsive/web_hewan.dart';
import '../../widgets/responsive_layout.dart';

class HewanPage extends StatelessWidget {
  const HewanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileHewan(),
        webBody: WebHewan(),
      ),
    );
  }
}
