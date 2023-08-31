import 'package:flutter/material.dart';

AppBar mobileAppBar(BuildContext context) => AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      // leading: IconButton(onPressed: () {}, icon: Icon(Icons.dehaze_sharp)),
      title: Expanded(
        child: const Text(
          'Alphacentauric Business Intelligence ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.person)),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
      ],
    );
