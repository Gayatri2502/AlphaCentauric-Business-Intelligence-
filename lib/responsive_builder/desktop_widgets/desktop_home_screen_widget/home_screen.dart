import 'package:abi/custom_widgets/display_chart_widget.dart';
import 'package:abi/custom_widgets/display_table.dart';
import 'package:abi/helper_widgets/helper_functions.dart';
import 'package:abi/responsive_builder/desktop_widgets/desktop_home_screen_widget/app_bar_widget.dart';
import 'package:flutter/material.dart';

enum ChartType { Bar, Line, Pie }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> data = [];
  List<List<dynamic>> csvData = [];
  HelperFunctions helperFunctions = HelperFunctions();
  bool isLoaded = false;
  String fileName = '';

  ChartType selectedChartType = ChartType.Bar;

  // Default chart type

  // Future<void> _pickFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['csv'],
  //   );
  //   if (result != null) {
  //     fileName = result.files.single.name;
  //     Uint8List fileBytes = result.files.single.bytes!;
  //     String csvString = String.fromCharCodes(fileBytes);
  //
  //     List<List<dynamic>> csvTable =
  //         const CsvToListConverter().convert(csvString);
  //
  //     int numRows = csvTable.length;
  //     int numColumns = csvTable.isNotEmpty ? csvTable[0].length : 0;
  //
  //     data.clear();
  //
  //     if (numRows > 0) {
  //       List<dynamic> headers = csvTable[0];
  //       int lastColumnIndex = headers.length - 1; // Index of the last column
  //
  //       for (int i = 1; i < numRows; i++) {
  //         List<dynamic> row = csvTable[i];
  //
  //         if (row.length >= numColumns) {
  //           Map<String, dynamic> rowData = {
  //             'Category': row.sublist(0, lastColumnIndex).toString(),
  //             'Value': double.tryParse(row[lastColumnIndex].toString()) ?? 0.0,
  //           };
  //           data.add(rowData);
  //         }
  //       }
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: desktopAppBar(context),
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // ElevatedButton(
                //     onPressed: () {
                //       Navigator.of(context)
                //           .push(MaterialPageRoute(builder: (_) {
                //         return LinearModel();
                //       }));
                //     },
                //     child: const Text('previous state')),

                ElevatedButton(
                  onPressed: () async {
                    HelperFunctions helperFunctions = HelperFunctions();
                    List<List<dynamic>> newData =
                        await helperFunctions.loadCSVHelper(csvData);
                    setState(() {
                      csvData = newData;
                    });
                  },
                  child: const Text('show Table'),
                ),
                const SizedBox(height: 20),
                //--------------------------------//DATA TABLE --------------------------------
                DisplayTable(csvData: csvData),
                //----------------------------------------------------------------
                const SizedBox(
                  height: 40,
                ),

                //------------------------------SHOW GRAPH--------------------------------------------------------
                ElevatedButton(
                  onPressed: () async {
                    String resultFileName =
                        await helperFunctions.pickCSVFileHelper(data);
                    setState(() {
                      fileName = resultFileName;
                    });
                  },
                  child: const Text('show Graphs'),
                ),
                Text('Selected File: $fileName'),
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
                DisplayChartWidget(data: data)
              ],
            )),
      ),
    );
  }
}
