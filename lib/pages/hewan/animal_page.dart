import 'package:flutter/material.dart';
import 'package:submit_dicoding_dictionary/pages/hewan/responsive/mobile_animal.dart';
import 'package:submit_dicoding_dictionary/pages/hewan/responsive/web_animal.dart';

import '../../widgets/responsive_layout.dart';

class AnimalPage extends StatelessWidget {
  const AnimalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileAnimal(),
        webBody: WebAnimal(),
      ),
    );
  }
}
