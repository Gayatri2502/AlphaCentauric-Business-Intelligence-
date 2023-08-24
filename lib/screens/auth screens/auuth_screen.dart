import 'package:abi/screens/auth%20screens/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../auth_services/auth_services.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Alphacentauric Business Intelligence'),
        ),
        body: Center(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          authServices.signInWithGoogle(context);
                          // Implement your sign-in logic here
                          // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                        },
                        child: const Text('Sign In'),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          authServices.signUpWithGoogle(context);

                          // Implement your sign-up logic here
                          // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                        },
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return SignUpScreen();
                    }));
                  },
                  child: const Text('LOGIN SCREEN'),
                )
              ],
            ),
          ),
        ));
  }
}
