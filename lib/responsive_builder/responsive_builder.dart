import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screen_constants/size.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget desktopBody;

  const ResponsiveBuilder({
    super.key,
    required this.mobileBody,
    required this.tabletBody,
    required this.desktopBody,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < mobileScreenWidth) {
      return mobileBody;
    } else if (screenWidth < tabletScreenWidth) {
      return tabletBody;
    } else {
      return desktopBody;
    }
  }
}
