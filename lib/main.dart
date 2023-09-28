import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:submit_dicoding_dictionary/shared/theme.dart';
import 'package:device_preview/device_preview.dart';
import 'pages/main_page/main_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}
// void main() {
// runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: lightBackgroundColor,
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: shamrockGreen,
          iconTheme: IconThemeData(
            color: whiteColor,
          ),
          titleTextStyle: whiteTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      ),
      home: const MainPage(),
    );
  }
}
