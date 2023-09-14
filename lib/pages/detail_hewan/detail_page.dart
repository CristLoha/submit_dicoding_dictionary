import 'package:flutter/material.dart';
import '../../widgets/responsive_layout.dart';
import 'responsive/mobile_detail.dart';
import 'responsive/web_detail.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileDetail(),
        webBody: WebDetail(),
      ),
    );
  }
}
