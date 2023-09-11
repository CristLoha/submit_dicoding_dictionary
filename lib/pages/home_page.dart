import 'package:flutter/material.dart';
import 'package:submit_dicoding_dictionary/pages/home/responsive/mobile/mobile_home.dart';
import 'package:submit_dicoding_dictionary/pages/home/responsive/web/web_home.dart';
import 'package:submit_dicoding_dictionary/widgets/responsive_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileHome(),
        webBody: WebHome(),
      ),
    );
  }
}
