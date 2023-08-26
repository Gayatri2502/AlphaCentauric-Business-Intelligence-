import 'package:abi/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  print("Initializing Firebase");

  WidgetsFlutterBinding.ensureInitialized();
  print("Initializing ...............");

  await Firebase.initializeApp(
      //name: 'Evyan Inspires',
      //name: 'AlphaCentauric-ABI',
      options: const FirebaseOptions(
          apiKey: "AIzaSyATmRSNClLHisA5jPVE8DQNudm0qEBnjXI",
          authDomain: "alphacentauric-abi-7d22f.firebaseapp.com",
          projectId: "alphacentauric-abi-7d22f",
          storageBucket: "alphacentauric-abi-7d22f.appspot.com",
          messagingSenderId: "635108666809",
          appId: "1:635108666809:web:d8c3c087978d18c376da68",
          measurementId: "G-ELL8R7Q4YQ"));

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
