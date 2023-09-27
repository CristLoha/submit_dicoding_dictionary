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
  final List<List<dynamic>> _pageData = [
    // Data halaman 1 (Beranda)
    ['Kamus Bahasa Sahu', false, null],

    // Data halaman 2 (Pencarian)
    ['Pencarian', false, null],

    // Data halaman 3 (Arsip)
    ['Arsip', true, Icons.delete],
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
        title: Text(
          _pageData[_selectedPageIndex]
              [0], // Menampilkan nama halaman berdasarkan indeks
          style: whiteTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 20,
          ),
        ),
        actions: _pageData[_selectedPageIndex][2] != null
            ? [
                IconButton(
                  onPressed: () {
                    if (_pageData[_selectedPageIndex][2] ==
                        Icons.local_convenience_store_sharp) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Ini halaman Pencarian'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    } else if (_pageData[_selectedPageIndex][2] ==
                        Icons.delete) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Ini halaman Arsip'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                  icon: Icon(
                    _pageData[_selectedPageIndex]
                        [2], // Menampilkan ikon berdasarkan indeks
                    color: whiteColor,
                  ),
                ),
              ]
            : null,
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
