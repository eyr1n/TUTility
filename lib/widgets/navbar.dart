import 'package:flutter/material.dart';

import '../pages/timetable.dart';
import '../pages/links.dart';
import '../pages/misc.dart';

final List<Widget> _pages = <Widget>[
  const TimetablePage(),
  const LinksPage(),
  const MiscPage(),
];

class TUTilityNavBar extends StatefulWidget {
  const TUTilityNavBar({Key? key}) : super(key: key);

  @override
  State<TUTilityNavBar> createState() => _TUTilityNavBarState();
}

class _TUTilityNavBarState extends State<TUTilityNavBar> {
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
        onTap: (int idx) {
          setState(() {
            _selectedIndex = idx;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
