// import 'dart:math';
//
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:csv/csv.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
//
// class Demo extends StatefulWidget {
//   @override
//   _DemoState createState() => _DemoState();
// }
//
// class _DemoState extends State<Demo> {
//   List<List<dynamic>> csvData = [];
//   bool isLoaded = false;
//
//   void _loadCSV() async {
//     FilePickerResult? result;
//     isLoaded = false;
//     try {
//       result = await FilePicker.platform.pickFiles(
//         type: FileType.custom,
//         allowedExtensions: ['csv'],
//       );
//     } catch (e) {
//       print('Error picking a file: $e');
//       return;
//     }
//
//     if (result != null) {
//       List<List<dynamic>> decodedData;
//
//       if (result.isSinglePick) {
//         final file = result.files.single.bytes;
//         final csvString = String.fromCharCodes(file!);
//         decodedData = const CsvToListConverter().convert(csvString);
//       } else {
//         print('Multiple file picks are not supported in this example.');
//         return;
//       }
//
//       setState(() {
//         csvData = decodedData;
//         isLoaded = true;
//       });
//     }
//   }
//
//   List<PieChartSectionData> _buildPieChartSections() {
//     final List<PieChartSectionData> sections = [];
//     for (var i = 1; i < csvData.length; i++) {
//       final row = csvData[i];
//       if (row.length >= 2) {
//         final double value = double.tryParse(row[1].toString()) ?? 0.0;
//         final String title =
//             row[0].toString(); // Assuming the first column contains labels
//         sections.add(
//           PieChartSectionData(
//             value: value,
//             title: title,
//             color: _generateRandomColor(),
//           ),
//         );
//       }
//     }
//     return sections;
//   }
//
//   Color _generateRandomColor() {
//     final Random random = Random();
//     return Color.fromRGBO(
//       random.nextInt(256),
//       random.nextInt(256),
//       random.nextInt(256),
//       1,
//     );
//   }
//
//   List<BarChartGroupData> _buildBarChartGroups() {
//     final List<BarChartGroupData> groups = [];
//     for (var i = 1; i < csvData.length; i++) {
//       final row = csvData[i];
//       if (row.length >= 2) {
//         final double value = double.tryParse(row[1].toString()) ?? 0.0;
//         final String category = row[0]
//             .toString(); // Assuming the first column contains category labels
//         groups.add(
//           BarChartGroupData(
//             x: i,
//             barRods: [
//               BarChartRodData(
//                 toY: value,
//                 color: _generateRandomColor(),
//               ),
//             ],
//             showingTooltipIndicators: [0],
//           ),
//         );
//       }
//     }
//     return groups;
//   }
//
//   List<FlSpot> _buildLineChartSpots() {
//     final List<FlSpot> spots = [];
//     for (var i = 1; i < csvData.length; i++) {
//       final row = csvData[i];
//       if (row.length >= 2) {
//         final double value = double.tryParse(row[1].toString()) ?? 0.0;
//         spots.add(FlSpot(i.toDouble(), value));
//       }
//     }
//     return spots;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('CSV Viewer'),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               ElevatedButton(
//                 onPressed: _loadCSV,
//                 child: const Text('Upload CSV File'),
//               ),
//               const SizedBox(height: 20),
//               if (csvData.isNotEmpty)
//                 Container(
//                   width: 800, // Adjust the width as needed
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 5,
//                         blurRadius: 7,
//                         offset: const Offset(0, 3),
//                       ),
//                     ],
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.white,
//                     border: Border.all(
//                       color: Colors.blue,
//                     ),
//                   ),
//                   child: SingleChildScrollView(
//                     child: DataTable(
//                       columns: _buildTableHeaders(),
//                       rows: _buildTableRows(),
//                     ),
//                   ),
//                 ),
//               const SizedBox(height: 20),
//               const SizedBox(height: 20),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   // Display Pie Chart
//                   ElevatedButton(
//                       onPressed: () {
//                         Container(
//                           height: 300,
//                           child: PieChart(
//                             PieChartData(
//                               sections: _buildPieChartSections(),
//                             ),
//                           ),
//                         );
//                       },
//                       child: Text('Pie Chart')),
//                   const SizedBox(height: 20),
//                   // Display Bar Chart
//                   ElevatedButton(
//                       onPressed: () {
//                         Container(
//                           height: 300,
//                           child: charts.BarChart(
//                             _buildBarChartGroups()
//                                 .cast<charts.Series<dynamic, String>>(),
//                             animate: true,
//                           ),
//                         );
//                       },
//                       child: Text('Bar Chart')),
//                   const SizedBox(height: 20),
//
//                   // Display Line Chart
//                   ElevatedButton(
//                       onPressed: () {
//                         Container(
//                           height: 300,
//                           child: charts.LineChart(
//                             _buildLineChartSpots()
//                                 .cast<charts.Series<dynamic, num>>(),
//                             animate: true,
//                           ),
//                         );
//                       },
//                       child: Text('Line Chart')),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<DataColumn> _buildTableHeaders() {
//     return csvData[0]
//         .map((header) => DataColumn(label: Text('$header')))
//         .toList();
//   }
//
//   List<DataRow> _buildTableRows() {
//     final dataRows = <DataRow>[];
//     for (var i = 1; i < csvData.length; i++) {
//       final row = csvData[i];
//       final cells = row.map((cell) => DataCell(Text('$cell'))).toList();
//       dataRows.add(DataRow(cells: cells));
//     }
//     return dataRows;
//   }
// }

import 'dart:math';
import 'dart:typed_data';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

enum ChartType { Bar, Line, Pie } // Define ChartType enum here

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  List<Map<String, dynamic>> data = [];
  String fileName = '';

  ChartType selectedChartType = ChartType.Bar; // Default chart type

  // Future<void> _pickFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['csv'],
  //   );
  //
  //   if (result != null) {
  //     fileName = result.files.single.name;
  //     Uint8List fileBytes = result.files.single.bytes!;
  //     String csvString = String.fromCharCodes(fileBytes);
  //
  //     List<List<dynamic>> csvTable = CsvToListConverter().convert(csvString);
  //
  //     // Determine the number of rows and columns with filled data
  //     int numRows = csvTable.length;
  //     int numColumns = csvTable.isNotEmpty ? csvTable[0].length : 0;
  //
  //     // Capture the header row as categories
  //     List<String> headers = [];
  //
  //     if (numRows > 0) {
  //       headers = csvTable[0].map((cell) => cell.toString()).toList();
  //     }
  //
  //     // Create a list of data for the chart
  //     data.clear();
  //
  //     for (int i = 1; i < numRows; i++) {
  //       List<dynamic> row = csvTable[i];
  //
  //       if (row.length >= numColumns) {
  //         for (int j = 0; j < numColumns; j++) {
  //           Map<String, dynamic> rowData = {
  //             'Category': headers[
  //                 j % headers.length], // Reuse headers in a circular manner
  //             'Value': double.tryParse(row[j].toString()) ??
  //                 0.0, // Use 0.0 as the default value
  //           };
  //           data.add(rowData);
  //         }
  //       }
  //     }
  //
  //     setState(() {});
  //   }
  // }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

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

      setState(() {});
    }
  }

  Widget _buildChart() {
    switch (selectedChartType) {
      case ChartType.Bar:
        return SfCartesianChart(
          primaryXAxis: CategoryAxis(
              title: AxisTitle(text: 'Categories')), // X-axis label
          primaryYAxis:
              NumericAxis(title: AxisTitle(text: 'Values')), // Y-axis label
          title: ChartTitle(text: 'CSV Data as Bar Chart'),
          legend: Legend(isVisible: true),
          series: <ChartSeries>[
            BarSeries<Map<String, dynamic>, String>(
              dataSource: data,
              xValueMapper: (Map<String, dynamic> rowData, _) =>
                  rowData['Category'].toString(),
              yValueMapper: (Map<String, dynamic> rowData, _) =>
                  rowData['Value'] ?? 0.0, // Use 0.0 as the default value
              name: 'Value',
              // Assign different colors to each data point
              pointColorMapper: (Map<String, dynamic> rowData, _) =>
                  getColorForDataPoint(rowData),
              dataLabelSettings:
                  DataLabelSettings(isVisible: true), // Show data labels
              enableTooltip: true, // Enable tooltips
            ),
          ],
        );

      case ChartType.Line:
        return SfCartesianChart(
          primaryXAxis:
              CategoryAxis(title: AxisTitle(text: 'X-Axis')), // X-axis label
          primaryYAxis:
              NumericAxis(title: AxisTitle(text: 'Y-Axis')), // Y-axis label
          title: ChartTitle(text: 'CSV Data as Line Chart'),
          legend: Legend(isVisible: true),
          series: <ChartSeries>[
            LineSeries<Map<String, dynamic>, String>(
              dataSource: data,
              xValueMapper: (Map<String, dynamic> rowData, _) =>
                  rowData['Category'].toString(),
              yValueMapper: (Map<String, dynamic> rowData, _) =>
                  rowData['Value'] ?? 0.0, // Use 0.0 as the default value
              name: 'Value',
              // Assign different colors to each data point
              pointColorMapper: (Map<String, dynamic> rowData, _) =>
                  getColorForDataPoint(rowData),
              dataLabelSettings:
                  DataLabelSettings(isVisible: true), // Show data labels
              enableTooltip: true, // Enable tooltips
            ),
          ],
        );

      case ChartType.Pie:
        return SfCircularChart(
          title: ChartTitle(text: 'CSV Data as Pie Chart'),
          legend: Legend(isVisible: true),
          series: <CircularSeries>[
            PieSeries<Map<String, dynamic>, String>(
              dataSource: data,
              xValueMapper: (Map<String, dynamic> rowData, _) =>
                  rowData['Category'].toString(),
              yValueMapper: (Map<String, dynamic> rowData, _) =>
                  rowData['Value'] ?? 0.0, // Use 0.0 as the default value
              name: 'Value',
              // Assign different colors to each data point
              pointColorMapper: (Map<String, dynamic> rowData, _) =>
                  getColorForDataPoint(rowData),
              dataLabelSettings:
                  DataLabelSettings(isVisible: true), // Show data labels
              enableTooltip: true, // Enable tooltips
            ),
          ],
        );

      // ... (other chart types)
    }
  }

  Color getColorForDataPoint(Map<String, dynamic> rowData) {
    // You can define a list of colors and assign them based on the data point
    // For example, you can use different colors for each data point.
    // You may also generate random colors or use a color palette.
    // Here, we are generating random colors for each data point.
    return Color.fromARGB(
      255,
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CSV to Charts'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _pickFile,
              child: Text('Upload CSV File'),
            ),
            SizedBox(height: 20),
            Text('Selected File: $fileName'),
            SizedBox(height: 20),
            DropdownButton<ChartType>(
              value: selectedChartType,
              onChanged: (newValue) {
                setState(() {
                  selectedChartType = newValue!;
                });
              },
              items: ChartType.values.map((chartType) {
                return DropdownMenuItem<ChartType>(
                  value: chartType,
                  child: Text(chartType.toString().split('.').last),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            if (data.isNotEmpty) ...[
              Expanded(
                child: _buildChart(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
