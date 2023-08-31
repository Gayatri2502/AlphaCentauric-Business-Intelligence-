import 'package:abi/responsive_builder/responsive_builder.dart';
import 'package:abi/screens/responsive_home_screen/desktop_home_body.dart';
import 'package:abi/screens/responsive_home_screen/mobile_home_body.dart';
import 'package:abi/screens/responsive_home_screen/tablet_home_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilder(
        mobileBody: MobileHomeScreen(),
        tabletBody: TabletHomePage(),
        desktopBody: DesktopHomePage());
  }
}
