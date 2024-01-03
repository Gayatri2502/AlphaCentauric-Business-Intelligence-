import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Demo1 extends StatefulWidget {
  @override
  _Demo1State createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {
  List<List<dynamic>> csvData = [];
  bool isLoaded = false;

  void _loadCSV() async {
    FilePickerResult? result;
    isLoaded = false;
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv'],
      );
    } catch (e) {
      print('Error picking a file: $e');
      return;
    }

    if (result != null) {
      List<List<dynamic>> decodedData;

      if (result.isSinglePick) {
        final file = result.files.single.bytes;
        final csvString = String.fromCharCodes(file!);
        decodedData = const CsvToListConverter().convert(csvString);
      } else {
        print('Multiple file picks are not supported in this example.');
        return;
      }

      setState(() {
        csvData = decodedData;
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CSV Viewer'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(
              onPressed: _loadCSV,
              child: const Text('Upload CSV File'),
            ),
            const SizedBox(height: 20),
            if (csvData.isNotEmpty)
              Container(
                height: 600,
                width: 9000,
                padding: EdgeInsets.all(50),
                child: Container(
                  padding: EdgeInsets.all(45),
                  width: MediaQuery.of(context)
                      .size
                      .width, // Adjust the width as needed
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
                ),
              ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
          ],
        ),
      ),
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
