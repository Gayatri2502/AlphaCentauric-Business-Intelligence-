import 'package:abi/responsive_builder/mobile_widgets/mobile_home_screen_widget/mobile_feature_widget.dart';
import 'package:abi/responsive_builder/mobile_widgets/mobile_home_screen_widget/mobile_happy_customer_widgets.dart';
import 'package:abi/responsive_builder/mobile_widgets/mobile_home_screen_widget/mobile_intro_widget.dart';
import 'package:abi/responsive_builder/mobile_widgets/mobile_home_screen_widget/mobile_services_widget.dart';
import 'package:abi/responsive_builder/mobile_widgets/mobile_home_screen_widget/mobile_team_widget.dart';
import 'package:flutter/material.dart';

import '../../responsive_builder/mobile_widgets/mobile_home_screen_widget/mobile_appbar_widget.dart';
import '../../responsive_builder/mobile_widgets/mobile_home_screen_widget/mobile_drawer_widget.dart';

class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({super.key});

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mobileAppBar(context),
      drawer: mobileDrawer(context),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.0),
              AndroidIntroWidget(),
              SizedBox(height: 24.0),
              AndroidServicesWidget(),
              SizedBox(height: 24.0),
              AndroidFeatureWidget(),
              AndroidTeamWidget(),
              AndroidHappyCustomerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
