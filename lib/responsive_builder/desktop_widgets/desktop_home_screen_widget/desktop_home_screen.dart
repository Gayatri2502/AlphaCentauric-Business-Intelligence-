import 'package:abi/helper_widgets/helper_functions.dart';
import 'package:abi/responsive_builder/desktop_widgets/desktop_home_screen_widget/app_bar_widget.dart';
import 'package:abi/responsive_builder/desktop_widgets/desktop_home_screen_widget/data_visualization/visualization_intro.dart';
import 'package:flutter/material.dart';

enum ChartType { Bar, Line, Pie }

class DesktopHomeScreen extends StatefulWidget {
  const DesktopHomeScreen({super.key});

  @override
  _DesktopHomeScreenState createState() => _DesktopHomeScreenState();
}

class _DesktopHomeScreenState extends State<DesktopHomeScreen> {
  List<Map<String, dynamic>> data = [];
  List<List<dynamic>> csvData = [];
  HelperFunctions helperFunctions = HelperFunctions();
  bool isLoaded = false;
  String fileName = '';

  ChartType selectedChartType = ChartType.Bar;

  // Declare GifController

  @override
  void initState() {
    // controller = FlutterGifController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: desktopAppBar(context),
      body: ListView(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              VisualizationIntroWidget(),
              // Container(
              //   height: 550,
              //   width: 900,
              //   decoration: BoxDecoration(
              //     color: Colors.indigo.shade50,
              //     borderRadius: BorderRadius.circular(10),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.black.withOpacity(0.2),
              //         spreadRadius: 5,
              //         blurRadius: 8,
              //         offset: Offset(2, 2),
              //       ),
              //     ],
              //   ),
              //   child: ,
              // ),
              // SizedBox(
              //     height: 600,
              //     width: 600,
              //     child: Image.network('asset/cubics.gif')),
            ],
          ),
          Container(
            height: 250,
            width: 1200,
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 8,
                  offset: Offset(2, 2),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
