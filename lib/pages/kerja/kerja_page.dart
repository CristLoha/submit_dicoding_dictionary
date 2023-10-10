import 'package:flutter/material.dart';
import 'package:submit_dicoding_dictionary/pages/kerja/responsive/mobile_kerja.dart';
import 'package:submit_dicoding_dictionary/pages/kerja/responsive/web_kerja.dart';
import '../../widgets/responsive_layout.dart';

class KerjaPage extends StatelessWidget {
  const KerjaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileKerja(),
        webBody: WebKerja(),
      ),
    );
  }
}
