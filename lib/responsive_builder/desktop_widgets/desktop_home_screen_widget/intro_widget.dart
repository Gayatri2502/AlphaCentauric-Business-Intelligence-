import 'package:abi/screens/service%20screen/service_screen.dart';
import 'package:flutter/material.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  'AI-powered Marketing Strategy \nTools for Success',
                  style: TextStyle(
                    fontSize: 54.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 106.0),
                const Text(
                  'Dominate the marketing sector with Alphacentauric’s AI-powered tools that \nguarantee minimum performance and provide reliable data \nfor strategic decision-making.',
                  style:
                      TextStyle(fontSize: 18.50, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 25.0),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.indigo.shade300),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            12), // Set your desired border radius
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ServiceScreen();
                    }));
                  },
                  child: const Text(
                    'View All Services',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            // const SizedBox(width: 10.0),
            Positioned(
              right: 350,
              top: 300,
              child: Image.asset(
                'asset/2.jpg',
                scale: 2,
              ),
            ),
            Positioned(
              right: 1,
              top: 50,
              child: Image.asset(
                'asset/4.jpg',
                scale: 0.2,
                height: 350,
              ),
            )
          ],
        ));
  }
}
