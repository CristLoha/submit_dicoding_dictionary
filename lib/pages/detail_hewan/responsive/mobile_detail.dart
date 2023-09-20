import 'package:flutter/material.dart';
import '../../../shared/theme.dart';

class MobileDetail extends StatelessWidget {
  const MobileDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: whiteColor),
        title: const Text('Hewan'),
        titleTextStyle: whiteTextStyle.copyWith(
          fontWeight: semiBold,
          fontSize: 20,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              color: shamrockGreen,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 24,
                ),
                child: Column(
                  children: [
                    Text(
                      'Banyo',
                      style: whiteTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: medium,
                      ),
                    )
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
