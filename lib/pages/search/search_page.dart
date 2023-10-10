import 'package:flutter/material.dart';
import 'package:submit_dicoding_dictionary/pages/search/responsive/search_web.dart';
import '../../widgets/responsive_layout.dart';
import 'responsive/search_mobile.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileSearch(),
        webBody: WebSearch(),
      ),
    );
  }
}
