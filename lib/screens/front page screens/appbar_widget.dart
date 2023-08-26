import 'package:flutter/material.dart';

import '../about_screen/about_screen.dart';
import '../auth screens/auuth_screen.dart';
import '../contact_screen/contact_screen.dart';
import '../home_screen.dart';
import '../service screen/service_screen.dart';
import 'search_bar_widget.dart';

AppBar appBar(BuildContext context) => AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Alphacentauric Business Intelligence '),
      actions: [
        SearchWidget(),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const HomePage();
              }));
            },
            child: const Text(
              'Home',
              style: TextStyle(fontSize: 17.5, color: Colors.black),
            )),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const ServiceScreen();
              }));
            },
            child: const Text(
              'Services',
              style: TextStyle(fontSize: 17.5, color: Colors.black),
            )),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const AboutScreen();
              }));
            },
            child: const Text(
              'About',
              style: TextStyle(fontSize: 17.5, color: Colors.black),
            )),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const ContactScreen();
              }));
            },
            child: const Text(
              'Contact',
              style: TextStyle(fontSize: 17.5, color: Colors.black),
            )),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
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
          itemBuilder: (context) {
            return ['Profile', 'Contact Us'].map((String option) {
              return PopupMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList();
          },
        ),
      ],
    );
