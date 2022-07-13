import 'package:csv/csv.dart';
import 'package:csv/csv_settings_autodetection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:tutility/utils/palette.dart';

class CafeMenu extends StatefulWidget {
  const CafeMenu({Key? key}) : super(key: key);

  @override
  State<CafeMenu> createState() => _CafeMenuState();
}

class _CafeMenuState extends State<CafeMenu> {
  List<List<dynamic>>? csv;

  void fn() async {
    var d = FirstOccurrenceSettingsDetector(eols: ['\r\n', '\n']);
    String txt = await rootBundle.loadString('assets/cafe_menu.csv');
    setState(() {
      csv = CsvToListConverter(csvSettingsDetector: d).convert(txt);
      //print(csv);
    });
  }

  @override
  Widget build(BuildContext context) {
    fn();
    return Scaffold(
        appBar: AppBar(
          title: Text('${DateFormat('M月d日').format(DateTime.now())}のメニュー'),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
            //width: double.infinity,
            child:
                DataTable(headingRowHeight: 0, dividerThickness: 0, columns: [
          DataColumn(
            label: Text(''),
          ),
          DataColumn(
            label: Text(''),
          ),
        ], rows: [
          for (int i = 1; csv != null && i < csv![0].length; i++)
            DataRow(
              cells: <DataCell>[
                DataCell(Container(
                  constraints: BoxConstraints.expand(),
                  margin: EdgeInsets.all(2),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: palette[csv![0][i].hashCode % palette.length][100],
                  ),
                  child: Text(
                    csv![0][i],
                    style: TextStyle(color: Colors.black87),
                  ),
                )),
                DataCell(Text(csv![1][i])),
              ],
            ),
        ])

            //Text('${csv![0][i]}: ${csv![1][i]}')
            ));
  }
}
