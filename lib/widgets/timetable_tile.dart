import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:tutility/constants.dart';
import 'package:tutility/font_scaler.dart';
import 'package:tutility/providers/timetable.dart';
import 'package:url_launcher/url_launcher.dart';

@immutable
class TimetableTile extends StatelessWidget {
  final Subject subject;

  const TimetableTile({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    final color =
        Uint8List.fromList(sha256.convert(utf8.encode(subject.id)).bytes)
                .buffer
                .asByteData()
                .getUint32(0, Endian.little) %
            palette.length;

    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(2),
        child: AspectRatio(
          aspectRatio: 0.75,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                constraints: const BoxConstraints.expand(),
                decoration: BoxDecoration(
                  color: palette[color][100],
                  border: Border.all(
                    color: palette[color][200]!,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  subject.name,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                    height: 1.2,
                    color: Colors.black87,
                    fontSize: 12.scale(context),
                  ),
                ),
              ),
              if (subject.room != null)
                Container(
                  width: double.infinity,
                  height: 22.scale(context),
                  padding: const EdgeInsets.all(2),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: palette[color][200],
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(4),
                    ),
                  ),
                  child: Text(
                    subject.room!,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11.scale(context),
                      color: Colors.black87,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => _SubjectDetailsDialog(subject: subject),
        );
      },
    );
  }
}

@immutable
class _SubjectDetailsDialog extends StatelessWidget {
  final Subject subject;

  const _SubjectDetailsDialog({required this.subject});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(subject.name),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${subject.term} ${subject.required}'),
            if (subject.units != null) Text('単位数: ${subject.units}'),
            if (subject.area != null) Text('区分: ${subject.area}'),
            if (subject.staff != null) Text('担当教員: ${subject.staff}'),
            if (subject.room != null) Text('教室: ${subject.room}'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text("シラバス"),
          onPressed: () {
            launchUrl(
              Uri.parse(subject.url),
              mode: LaunchMode.inAppBrowserView,
            );
            //context.router.push(InAppBrowserRoute(uri: Uri.parse(subject.url)));
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
