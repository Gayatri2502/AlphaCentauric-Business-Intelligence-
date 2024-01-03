import 'package:flutter/material.dart';

class BeautifiedContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final double opacity;
  final double borderRadius;
  final Widget child;

  BeautifiedContainer(
      {required this.height,
      required this.width,
      required this.color,
      this.opacity = 1.0,
      this.borderRadius = 8.0,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 8,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Opacity(opacity: opacity, child: child),
    );
  }
}
