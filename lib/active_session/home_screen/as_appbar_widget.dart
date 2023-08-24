import 'package:flutter/material.dart';

import '../../screens/about_screen/about_screen.dart';
import '../../screens/auth screens/auuth_screen.dart';
import '../../screens/contact_screen/contact_screen.dart';
import '../../screens/front page screens/search_bar_widget.dart';
import '../../screens/front_page_screen.dart';
import '../../screens/service screen/service_screen.dart';

AppBar appBarAS(BuildContext context) => AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      // leading: IconButton(onPressed: () {}, icon: Icon(Icons.dehaze_sharp)),
      title: const Text(
        'Alphacentauric Business Intelligence ',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const HomePage();
                  }));
                },
                child: const Row(
                  children: [
                    Text(
                      'Home',
                      style: TextStyle(fontSize: 14.5, color: Colors.black),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const HomePage();
                  }));
                },
                child: const Row(
                  children: [
                    Text(
                      'Businesses',
                      style: TextStyle(fontSize: 14.5, color: Colors.black),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ServiceScreen();
                  }));
                },
                child: const Row(
                  children: [
                    Text(
                      'Services',
                      style: TextStyle(fontSize: 14.5, color: Colors.black),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ServiceScreen();
                  }));
                },
                child: const Row(
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(fontSize: 14.5, color: Colors.black),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ServiceScreen();
                  }));
                },
                child: const Row(
                  children: [
                    Text(
                      'Management',
                      style: TextStyle(fontSize: 14.5, color: Colors.black),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ServiceScreen();
                  }));
                },
                child: const Row(
                  children: [
                    Text(
                      'Analyst Report',
                      style: TextStyle(fontSize: 14.5, color: Colors.black),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ServiceScreen();
                  }));
                },
                child: const Row(
                  children: [
                    Text(
                      'Implementation Guide',
                      style: TextStyle(fontSize: 14.5, color: Colors.black),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const AboutScreen();
                  }));
                },
                child: const Row(
                  children: [
                    Text(
                      'About',
                      style: TextStyle(fontSize: 14.5, color: Colors.black),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ServiceScreen();
                  }));
                },
                child: const Row(
                  children: [
                    Text(
                      'Resources',
                      style: TextStyle(fontSize: 14.5, color: Colors.black),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ServiceScreen();
                  }));
                },
                child: const Row(
                  children: [
                    Text(
                      'FAQs',
                      style: TextStyle(fontSize: 14.5, color: Colors.black),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ContactScreen();
                  }));
                },
                child: const Row(
                  children: [
                    Text(
                      'Contact Us',
                      style: TextStyle(fontSize: 14.5, color: Colors.black),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ServiceScreen();
                  }));
                },
                child: const Row(
                  children: [
                    Text(
                      'Support',
                      style: TextStyle(fontSize: 14.5, color: Colors.black),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const HomePage();
                  }));
                },
                child: const Row(
                  children: [
                    Text(
                      'Help',
                      style: TextStyle(fontSize: 14.5, color: Colors.black),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
          ],
        ),
      ),
      actions: [
        SearchWidget(),
        const SizedBox(
          width: 40,
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const HomePage();
              }));
            },
            child: const Row(
              children: [
                Icon(Icons.person),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'My Account',
                  style: TextStyle(fontSize: 14.5, color: Colors.black),
                ),
              ],
            )),
        const SizedBox(
          width: 40,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const AuthScreen();
              }));
            },
            child: const Text(
              'Logout',
              style: TextStyle(fontSize: 14.5, color: Colors.black),
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
