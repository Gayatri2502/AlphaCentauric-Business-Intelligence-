import 'package:abi/custom_widgets/build_chart_widget.dart';
import 'package:flutter/material.dart';

class DisplayChartWidget extends StatelessWidget {
  List<Map<String, dynamic>> data = [];
  DisplayChartWidget({super.key, required this.data});

  BuildChartWidget buildChartWidget = BuildChartWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const SizedBox(height: 20),
        if (data.isNotEmpty) ...[
          SizedBox(
            height: 500,
            width: 700,
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
              child: Expanded(child: buildChartWidget.buildChart(data)),
            ),
          ),
        ]
      ],
    );
  }
}
