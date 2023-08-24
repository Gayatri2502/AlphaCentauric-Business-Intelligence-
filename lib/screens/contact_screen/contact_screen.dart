import 'package:abi/screens/front_page_screen.dart';
import 'package:flutter/material.dart';

import '../about_screen/about_screen.dart';
import '../auth screens/auuth_screen.dart';
import '../service screen/service_screen.dart';
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Alphacentauric Business Intelligence '),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const HomePage();
                }));
              },
              child: const Text(
                'Home',
                style: TextStyle(fontSize: 17.5, color: Colors.black),
              )),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ServiceScreen();
                }));
              },
              child: const Text(
                'Services',
                style: TextStyle(fontSize: 17.5, color: Colors.black),
              )),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const AboutScreen();
                }));
              },
              child: const Text(
                'About',
                style: TextStyle(fontSize: 17.5, color: Colors.black),
              )),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ContactScreen();
                }));
              },
              child: const Text(
                'Contact',
                style: TextStyle(fontSize: 17.5, color: Colors.black),
              )),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const AuthScreen();
                }));
              },
              child: const Text(
                'SignUp',
                style: TextStyle(fontSize: 15.5, color: Colors.black),
              )),
          IconButton(
            onPressed: () {
              // Show search bar
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle popup menu selection
            },
            itemBuilder: (BuildContext context) {
              return ['Profile', 'Contact Us'].map((String option) {
                return PopupMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList();
            },
          ),
        ],
      ),
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
