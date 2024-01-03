import 'dart:typed_data';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';

class HelperFunctions {
  String fileName = '';

  Future loadCSVHelper(List<List<dynamic>> csvData) async {
    FilePickerResult? result;
    List<List<dynamic>> decodedData = [];

    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv'],
      );
    } catch (e) {
      print('Error picking a file: $e');
    }

    if (result != null) {
      if (result.isSinglePick) {
        final file = result.files.single.bytes;
        final csvString = String.fromCharCodes(file!);
        decodedData = const CsvToListConverter().convert(csvString);
      } else {
        print('Multiple file picks are not supported in this example.');
      }

      // Instead of returning csvData, you can return decodedData directly
      return decodedData;
    }

    // If there's no result, return an empty list or null based on your use case
    return [];
  }

  Future pickCSVFileHelper(List<Map<String, dynamic>> data) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );
    if (result != null) {
      fileName = result.files.single.name;
      Uint8List fileBytes = result.files.single.bytes!;
      String csvString = String.fromCharCodes(fileBytes);

      List<List<dynamic>> csvTable =
          const CsvToListConverter().convert(csvString);

      int numRows = csvTable.length;
      int numColumns = csvTable.isNotEmpty ? csvTable[0].length : 0;

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

      return fileName;
    }
  }
}
