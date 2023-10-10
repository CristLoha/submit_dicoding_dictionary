import 'package:flutter/material.dart';
import 'package:submit_dicoding_dictionary/pages/bookmark/responsive/mobile_bookmark.dart';
import 'package:submit_dicoding_dictionary/pages/bookmark/responsive/web_bookmark.dart';
import '../../widgets/responsive_layout.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileBookmark(),
        webBody: WebBookmark(),
      ),
    );
  }
}
