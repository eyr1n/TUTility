import 'package:flutter/material.dart';

import '../pages/timetable.dart';
import '../pages/links.dart';
import '../pages/misc.dart';

final List<Widget> _pages = <Widget>[
  const TimetablePage(),
  const LinksPage(),
  const MiscPage(),
];

class TUTilityAppBar extends StatefulWidget {
  const TUTilityAppBar({Key? key}) : super(key: key);

  @override
  State<TUTilityAppBar> createState() => _TUTilityAppBarState();
}

class _TUTilityAppBarState extends State<TUTilityAppBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: '時間割',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'リンク',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'その他',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[800],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
