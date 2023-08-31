import 'package:abi/screens/service%20screen/service_screen.dart';
import 'package:flutter/material.dart';

class AndroidIntroWidget extends StatelessWidget {
  const AndroidIntroWidget({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'AI-powered Marketing Strategy \nTools for Success',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Image.asset(
            //   'asset/2.jpg',
            //   scale: 5,
            // ),
            Image.asset(
              'asset/4.jpg',
              scale: 3,
              height: 200,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Dominate the marketing sector with Alphacentauric’s AI-powered tools that \nguarantee minimum performance and provide reliable data \nfor strategic decision-making.',
              style: TextStyle(fontSize: 15.50, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 25.0),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.indigo.shade300),
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
        ));
  }
}
