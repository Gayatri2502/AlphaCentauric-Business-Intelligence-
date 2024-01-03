import 'package:abi/responsive_builder/desktop_widgets/Model/linear_regression_page.dart';
import 'package:flutter/material.dart';

import '../../../../custom_widgets/display_chart_widget.dart';
import '../../../../custom_widgets/display_table.dart';
import '../../../../helper_widgets/helper_functions.dart';
import '../app_bar_widget.dart';

enum ChartType { Bar, Line, Pie }

class PresentationWidget extends StatefulWidget {
  const PresentationWidget({super.key});

  @override
  State<PresentationWidget> createState() => _PresentationWidgetState();
}

class _PresentationWidgetState extends State<PresentationWidget> {
  List<Map<String, dynamic>> data = [];
  List<List<dynamic>> csvData = [];
  HelperFunctions helperFunctions = HelperFunctions();
  bool isLoaded = false;
  String fileName = '';

  ChartType selectedChartType = ChartType.Bar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: desktopAppBar(context),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    HelperFunctions helperFunctions = HelperFunctions();
                    List<List<dynamic>> newData =
                        await helperFunctions.loadCSVHelper(csvData);
                    setState(() {
                      csvData = newData;
                    });
                  },
                  child: const Text('Upload & Generate Table'),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: 1500,
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade50,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.indigo.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 8,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Expanded(child: DisplayTable(csvData: csvData)),
                  )),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    String resultFileName =
                        await helperFunctions.pickCSVFileHelper(data);
                    setState(() {
                      fileName = resultFileName;
                    });
                  },
                  child: const Text('Upload & Generate Graphs'),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: 1500,
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade50,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.indigo.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 8,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
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
                    ),
                  )),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return LinearModel();
                      }));
                    },
                    child: const Text('Linear Model')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
