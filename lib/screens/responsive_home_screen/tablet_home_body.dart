import 'package:abi/responsive_builder/tablet_widgets/tablet_home_screen_widget/tablet_appbar_widget.dart';
import 'package:flutter/material.dart';

import '../../responsive_builder/tablet_widgets/tablet_home_screen_widget/tablet_drawer_widget.dart';
import '../../responsive_builder/tablet_widgets/tablet_home_screen_widget/tablet_feature_widget.dart';
import '../../responsive_builder/tablet_widgets/tablet_home_screen_widget/tablet_happy_customer_widgets.dart';
import '../../responsive_builder/tablet_widgets/tablet_home_screen_widget/tablet_intro_widget.dart';
import '../../responsive_builder/tablet_widgets/tablet_home_screen_widget/tablet_services_widget.dart';
import '../../responsive_builder/tablet_widgets/tablet_home_screen_widget/tablet_team_widget.dart';

class TabletHomePage extends StatefulWidget {
  const TabletHomePage({super.key});

  @override
  State<TabletHomePage> createState() => _TabletHomePageState();
}

class _TabletHomePageState extends State<TabletHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tabAppBar(context),
      drawer: tabDrawer(context),
      body: const SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(150, 20, 150, 100),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.0),
              TabIntroWidget(),
              SizedBox(height: 24.0),
              TabServicesWidget(),
              SizedBox(height: 24.0),
              TabFeatureWidget(),
              TabTeamWidget(),
              TabHappyCustomerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
