import 'package:flutter/material.dart';

import '../../../screens/home_screen.dart';

Drawer tabDrawer(BuildContext context) => Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            child: Center(
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const HomePage();
              }));
            },
          ),
          // Add more ListTile items for other menu options
          // You can reuse the same logic as above
        ],
      ),
    );
