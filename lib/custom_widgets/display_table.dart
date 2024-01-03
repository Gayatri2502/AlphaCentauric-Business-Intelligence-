import 'package:flutter/material.dart';

class DisplayTable extends StatelessWidget {
  List<List<dynamic>> csvData = [];

  DisplayTable({Key? key, required this.csvData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (csvData.isNotEmpty)
          SizedBox(
              height: 650,
              width: 1200,
              //  padding: EdgeInsets.all(50),
              child: Container(
                padding: const EdgeInsets.all(45),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.blue,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Expanded(
                    child: DataTable(
                      columns: _buildTableHeaders(),
                      rows: _buildTableRows(),
                    ),
                  ),
                ),
              )),
      ],
    );
  }

  List<DataColumn> _buildTableHeaders() {
    return csvData[0]
        .map((header) => DataColumn(label: Text('$header')))
        .map((header) => DataColumn(label: Text('$header')))
        .toList();
  }

  List<DataRow> _buildTableRows() {
    final dataRows = <DataRow>[];
    for (var i = 1; i < csvData.length; i++) {
      final row = csvData[i];
      final cells = row.map((cell) => DataCell(Text('$cell'))).toList();
      dataRows.add(DataRow(cells: cells));
    }
    return dataRows;
  }
}
