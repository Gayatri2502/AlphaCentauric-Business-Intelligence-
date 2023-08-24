import 'package:abi/screens/front_page_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  print("Initializing Firebase");

  WidgetsFlutterBinding.ensureInitialized();
  print("Initializing ...............");

  await Firebase.initializeApp(
      name: 'Evyan Inspires',
      options: const FirebaseOptions(
        apiKey: "AIzaSyAkF6hkmtOk7VtpMXVFXQ7vqykm7I_9Lm0",
        projectId: "evyan-inspires",
        messagingSenderId: "958813759846",
        appId: "1:958813759846:web:15453dd5dc73992c6580a7",
      ));

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    print("okkk ...............");

    return MaterialApp(
      title: 'Alphacentauric Business Intelligence',
      initialRoute: '/',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => HomePage(),
        //  '/workshops': (context) => WorkshopsPage(),
        // Define routes for other pages
      },
    );
  }
}
