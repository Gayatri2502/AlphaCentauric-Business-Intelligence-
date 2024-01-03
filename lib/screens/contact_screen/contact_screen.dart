import 'package:flutter/material.dart';

import '../../responsive_builder/desktop_widgets/desktop_home_screen_widget/app_bar_widget.dart';
import 'contact_widget.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
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
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  height: 700,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Have Questions?',
                        style: TextStyle(
                          fontSize: 54.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Please feel free to call or email us, or use our contact form to get in touch with us. We look forward to hearing from you!',
                        style: TextStyle(
                          fontSize: 18.0,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Emergency? Call Us: \n 8956784586',
                        style: TextStyle(
                          fontSize: 15.0,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        ' Send Us Mail \n Ozaryan25@gmail.com',
                        style: TextStyle(
                          fontSize: 15.0,
                          //fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 0.5,
                  top: 50,
                  child: ContactForm(),
                )
              ],
            )),
      ),
    );
  }
}
