import 'package:flutter/material.dart';
import '../../widgets/responsive_layout.dart';
import 'responsive/mobile_home.dart';
import 'responsive/web_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileHome(),
        webBody: WebHome(),
      ),
    );
  }
}
