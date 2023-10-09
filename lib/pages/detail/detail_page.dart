import 'package:flutter/material.dart';
import '../../widgets/responsive_layout.dart';
import 'responsive/mobile_detail.dart';
import 'responsive/web_detail.dart';

class DetailPage extends StatelessWidget {
  final String? data;
  const DetailPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileDetail(
          data: data,
        ),
        webBody: WebDetail(
          data: data,
        ),
      ),
    );
  }
}
