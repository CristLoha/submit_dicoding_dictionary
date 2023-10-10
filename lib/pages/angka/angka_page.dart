import 'package:flutter/material.dart';
import 'package:submit_dicoding_dictionary/pages/angka/responsive/mobile_angka.dart';
import 'package:submit_dicoding_dictionary/pages/angka/responsive/web_angka.dart';
import '../../widgets/responsive_layout.dart';

class AngkaPage extends StatelessWidget {
  const AngkaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileAngka(),
        webBody: WebAngka(),
      ),
    );
  }
}
