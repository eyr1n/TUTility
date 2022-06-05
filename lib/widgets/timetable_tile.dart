import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/palette.dart';
import '../utils/tile_data.dart';

class TimetableTile extends StatelessWidget {
  const TimetableTile({Key? key, this.tileData}) : super(key: key);

  final TileData? tileData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      child: AspectRatio(
        aspectRatio: 0.75,
        child: () {
          if (tileData == null) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            );
          } else {
            final tileData = this.tileData!;
            final color = palette[tileData.id.hashCode % palette.length];

            return GestureDetector(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: color[100],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      tileData.name,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        height: 1.2,
                      ),
                    ),
                  ),
                  if (tileData.room.isNotEmpty)
                    Container(
                      width: double.infinity,
                      height: 22,
                      padding: const EdgeInsets.all(2),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: color[200],
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(4),
                        ),
                      ),
                      child: Text(
                        tileData.room,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ),
                ],
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(tileData.name),
                      content: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${tileData.term} ${tileData.required}'),
                            if (tileData.units.isNotEmpty)
                              Text('単位数: ${tileData.units}'),
                            if (tileData.area.isNotEmpty)
                              Text('区分: ${tileData.area}'),
                            if (tileData.staff.isNotEmpty)
                              Text('担当教員: ${tileData.staff}'),
                            if (tileData.room.isNotEmpty)
                              Text('教室: ${tileData.room}'),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text("シラバス"),
                          onPressed: () {
                            launchUrl(Uri.parse(tileData.syllabus));
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
                  },
                );
              },
            );
          }
        }(),
      ),
    );
  }
}
