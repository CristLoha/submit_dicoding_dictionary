import 'package:flutter/material.dart';
import 'package:submit_dicoding_dictionary/pages/main_page/responsive/mobile/mobile_main_page.dart';
import 'package:submit_dicoding_dictionary/widgets/responsive_layout.dart';

import 'main_page/responsive/web/web_main_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileMainPage(),
        webBody: WebHome(),
      ),
    );
  }
}
