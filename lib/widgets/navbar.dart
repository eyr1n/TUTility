import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class TUTilityNavBar extends StatefulWidget {
  const TUTilityNavBar({Key? key, required this.items}) : super(key: key);

  final List<Tuple2<BottomNavigationBarItem, Widget>> items;

  @override
  State<TUTilityNavBar> createState() => _TUTilityNavBarState();
}

class _TUTilityNavBarState extends State<TUTilityNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.items[_selectedIndex].item2,
      bottomNavigationBar: BottomNavigationBar(
        items: widget.items.map((item) => item.item1).toList(),
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
