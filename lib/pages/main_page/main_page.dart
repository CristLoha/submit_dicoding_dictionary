import 'package:flutter/material.dart';
import 'package:submit_dicoding_dictionary/widgets/responsive_layout.dart';
import 'mobile_main.dart';
import 'web_main.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileMain(),
        webBody: WebMain(),
      ),
    );
  }
}
