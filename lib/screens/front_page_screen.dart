import 'package:flutter/material.dart';

import '../active_session/home_screen/as_appbar_widget.dart';
import 'front page screens/feature_widget.dart';
import 'front page screens/happy_customer_widgets.dart';
import 'front page screens/intro_widget.dart';
import 'front page screens/services_widget.dart';
import 'front page screens/team_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarAS(context),
      body: const SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(150, 20, 150, 100),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.0),
              IntroWidget(),
              SizedBox(height: 24.0),
              ServicesWidget(),
              SizedBox(height: 24.0),
              FeatureWidget(),
              TeamWidget(),
              HappyCustomerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
