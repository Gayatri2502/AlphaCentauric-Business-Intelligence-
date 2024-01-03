// file_picker.dart
import 'dart:typed_data';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';

class FilePickerHelper {
  static Future<List<List<dynamic>>> pickAndDecodeCSV() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (result != null) {
      final fileBytes = result.files.single.bytes!;
      final csvString = String.fromCharCodes(fileBytes);
      return const CsvToListConverter().convert(csvString);
    } else {
      return [];
    }
  }

  List<List<dynamic>> csvData = [];
  List<Map<String, dynamic>> data = [];

  bool isLoaded = false;
  String fileName = '';

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );
    // data = csvData.cast<Map<String, dynamic>>();
    if (result != null) {
      fileName = result.files.single.name;
      Uint8List fileBytes = result.files.single.bytes!;
      String csvString = String.fromCharCodes(fileBytes);

      List<List<dynamic>> csvTable = CsvToListConverter().convert(csvString);

      // Determine the number of rows and columns with filled data
      int numRows = csvTable.length;
      int numColumns = csvTable.isNotEmpty ? csvTable[0].length : 0;

      // Create a list of data for the chart
      data.clear();

      if (numRows > 0) {
        List<dynamic> headers = csvTable[0];
        int lastColumnIndex = headers.length - 1; // Index of the last column

        for (int i = 1; i < numRows; i++) {
          List<dynamic> row = csvTable[i];

          if (row.length >= numColumns) {
            Map<String, dynamic> rowData = {
              'Category': row.sublist(0, lastColumnIndex).toString(),
              'Value': double.tryParse(row[lastColumnIndex].toString()) ?? 0.0,
            };
            data.add(rowData);
          }
        }
      }
    }
  }

  void loadCSV() async {
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
    }
  }
}
