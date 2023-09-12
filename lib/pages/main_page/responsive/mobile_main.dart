import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:submit_dicoding_dictionary/shared/theme.dart';

import '../../bookmark/bookmark_page.dart';
import '../../home/home_page.dart';
import '../../search/search_page.dart';

class MobileMain extends StatefulWidget {
  const MobileMain({super.key});

  @override
  State<MobileMain> createState() => _MobileMainState();
}

class _MobileMainState extends State<MobileMain> {
  int _selectedIndex = 0;

  // Daftar halaman yang akan ditampilkan sesuai dengan indeks item yang dipilih.
  final List<Widget> _pages = const [
    HomePage(),
    SearchPage(),
    BookmarkPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          selectedLabelStyle: shamrockGreenTekxtStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          unselectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
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
      body: _pages[_selectedIndex],
    );
  }
}
