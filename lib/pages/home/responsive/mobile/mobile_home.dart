import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:submit_dicoding_dictionary/shared/theme.dart';

class MobileHome extends StatelessWidget {
  const MobileHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile Layout Size: ${MediaQuery.of(context).size.width}'),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 6,
        color: whiteColor,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: whiteColor,
          selectedItemColor: shamrockGreen,
          unselectedItemColor: blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: greyTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          unselectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          items: const [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: FaIcon(
                    FontAwesomeIcons.house,
                  ),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: FaIcon(FontAwesomeIcons.magnifyingGlass),
                ),
                label: 'Pencarian'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: FaIcon(FontAwesomeIcons.bookBookmark),
                ),
                label: 'Arsip'),
          ],
        ),
      ),
    );
  }
}
