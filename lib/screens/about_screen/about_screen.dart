import 'package:flutter/material.dart';

import '../../responsive_builder/desktop_widgets/desktop_home_screen_widget/app_bar_widget.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: desktopAppBarOpen(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(150, 20, 150, 100),
        child: Container(
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   boxShadow: [
            //     BoxShadow(
            //       color: Colors.grey.withOpacity(0.5),
            //       spreadRadius: 5,
            //       blurRadius: 10,
            //       offset: Offset(0, 3), // changes the shadow position
            //     ),
            //   ],
            // ),
            padding: const EdgeInsets.all(16),
            height: 700,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mission statement',
                      style: TextStyle(
                        fontSize: 54.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 106.0),
                    Image.asset(
                      'asset/9.jpg',
                      scale: 0.2,
                      height: 350,
                    ),
                  ],
                ),
                const Positioned(
                  right: 0.5,
                  top: 250,
                  child: SizedBox(
                    height: 400,
                    width: 700,
                    child: Text(
                      'At Alphacentauric Business Intelligence, we are committed to helping businesses achieve their goals with the power of AI. Our AI-powered marketing strategy tools, data visualization, and sales management solutions provide our clients with the insights and predictions they need to stay ahead of the competition. We are dedicated to excellence, customer satisfaction, and innovation, and we strive to deliver the best possible service to our clients.',
                      style: TextStyle(
                          fontSize: 18.50, fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
