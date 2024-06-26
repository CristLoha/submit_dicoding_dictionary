import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:submit_dicoding_dictionary/shared/theme.dart';
import '../../bookmark/bookmark_page.dart';
import '../../home/home_page.dart';
import '../../search/search_page.dart';

class WebMain extends StatefulWidget {
  const WebMain({super.key});

  @override
  State<WebMain> createState() => _WebMainState();
}

class _WebMainState extends State<WebMain> {
  int _selectedPageIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    SearchPage(),
    BookmarkPage(),
  ];

  final List<String> _pageNames = const [
    'Beranda',
    'Pencarian',
    'Arsip',
  ];

  final List<IconData> _pageIcons = const [
    FontAwesomeIcons.house,
    FontAwesomeIcons.magnifyingGlass,
    FontAwesomeIcons.bookBookmark,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        iconTheme: IconThemeData(color: blackColor),
        backgroundColor: lightBackgroundColor,
        title: Text(
          'Kamus Bahasa Sahu',
          style: blackTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 20,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: shamrockGreen,
              ),
              child: Center(
                child: Text(
                  'Menu',
                  style: whiteTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: bold,
                  ),
                ),
              ),
            ),
            for (int i = 0; i < _pages.length; i++)
              ListTile(
                leading: FaIcon(
                  _pageIcons[i],

                  /// Menggunakan ikon sesuai dengan indeks halaman
                  size: 20,
                ),
                title: Text(
                  _pageNames[i],
                  style: blackTextStyle,
                ),

                /// Menggunakan  nama berdasarkan nama halaman
                onTap: () {
                  setState(() {
                    _selectedPageIndex = i;
                  });
                  Navigator.pop(context); // Menutup menu drawer
                },
              ),
          ],
        ),
      ),
      body: _pages[_selectedPageIndex], // Menampilkan halaman yang dipilih
    );
  }
}
