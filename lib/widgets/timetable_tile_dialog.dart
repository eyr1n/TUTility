import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

import '../utils/tile_data.dart';

class TimetableTileDialog extends StatelessWidget {
  const TimetableTileDialog({Key? key, required this.tileData})
      : super(key: key);

  final TileData tileData;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(tileData.name),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${tileData.term} ${tileData.required}'),
            if (tileData.units.isNotEmpty) Text('単位数: ${tileData.units}'),
            if (tileData.area.isNotEmpty) Text('区分: ${tileData.area}'),
            if (tileData.staff.isNotEmpty) Text('担当教員: ${tileData.staff}'),
            if (tileData.room.isNotEmpty) Text('教室: ${tileData.room}'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text("シラバス"),
          onPressed: () {
            launch(tileData.syllabus);
          },
        ),
        TextButton(
          child: const Text("閉じる"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
