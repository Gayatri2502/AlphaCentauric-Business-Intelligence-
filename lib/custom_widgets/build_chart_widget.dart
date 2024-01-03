// chart_widgets.dart
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

Color getColorForDataPoint(Map<String, dynamic> rowData) {
  return Color.fromARGB(
    255,
    Random().nextInt(256),
    Random().nextInt(256),
    Random().nextInt(256),
  );
}

enum ChartType { Bar, Line, Pie }

ChartType selectedChartType = ChartType.Bar;

class BuildChartWidget {
  Widget buildChart(List<Map<String, dynamic>> data) {
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
}
