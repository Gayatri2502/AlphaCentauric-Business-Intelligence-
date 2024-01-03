import 'package:flutter/material.dart';

class AnimatedPageTransition extends PageRouteBuilder {
  final Widget destinationPage;

  AnimatedPageTransition({
    required this.destinationPage,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return destinationPage;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget destinationPage,
          ) {
            // Check if the current route is the same as the destination route
            if (ModalRoute.of(context)!.settings.runtimeType ==
                destinationPage.runtimeType) {
              return destinationPage;
            }

            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOutQuart;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: destinationPage,
            );
          },
        );
}
