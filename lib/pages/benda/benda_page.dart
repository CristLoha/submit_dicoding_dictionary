import 'package:flutter/material.dart';
import 'package:submit_dicoding_dictionary/pages/benda/responsive/mobile_benda.dart';
import 'package:submit_dicoding_dictionary/pages/benda/responsive/web_mobile.dart';
import '../../widgets/responsive_layout.dart';

class BendaPage extends StatelessWidget {
  const BendaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileBenda(),
        webBody: WebBenda(),
      ),
    );
  }
}
