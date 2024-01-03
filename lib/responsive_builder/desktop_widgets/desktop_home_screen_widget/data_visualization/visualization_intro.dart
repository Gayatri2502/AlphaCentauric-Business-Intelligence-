import 'package:abi/responsive_builder/desktop_widgets/desktop_home_screen_widget/data_visualization/visualization_presentation.dart';
import 'package:flutter/material.dart';

class VisualizationIntroWidget extends StatelessWidget {
  const VisualizationIntroWidget({super.key});

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
                Container(
                  width: 800,
                  child: const Text(
                    '''Data Dynamo: Transforming Complexity into Captivating Visual Stories! 🚀 ''',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 60.0),
                Container(
                  width: 750,
                  child: const Text(
                    "Unleash the Power of Your Data! Transform raw information into vibrant visual stories. \nUpload your data and watch as charts and graphics paint a simplified masterpiece, bringing clarity and insight to your every detail.\nYour data has never looked this good – discover the art of visualization with us!",
                    style:
                        TextStyle(fontSize: 18.50, fontWeight: FontWeight.w500),
                  ),
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
                      return PresentationWidget();
                    }));
                  },
                  child: const Text(
                    'Lets Go !!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10.0),
            // Positioned(
            //   left: 600,
            //   top: 30,
            //   child: Image.asset(
            //     'asset/15.png',
            //     scale: 1,
            //   ),
            // ),
            Positioned(
                right: 1,
                top: 30,
                child: Image.network(
                  'asset/graphic.gif',
                  scale: 0.8,
                ))
          ],
        ));
  }
}
