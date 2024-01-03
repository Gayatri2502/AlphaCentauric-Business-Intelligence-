import 'package:flutter/material.dart';

import '../../responsive_builder/desktop_widgets/desktop_home_screen_widget/app_bar_widget.dart';
import '../../responsive_builder/desktop_widgets/desktop_home_screen_widget/feature_widget.dart';
import '../../responsive_builder/desktop_widgets/desktop_home_screen_widget/happy_customer_widgets.dart';
import '../../responsive_builder/desktop_widgets/desktop_home_screen_widget/intro_widget.dart';
import '../../responsive_builder/desktop_widgets/desktop_home_screen_widget/services_widget.dart';
import '../../responsive_builder/desktop_widgets/desktop_home_screen_widget/team_widget.dart';

class DesktopHomePage extends StatefulWidget {
  const DesktopHomePage({super.key});

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: desktopAppBarOpen(context),
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
