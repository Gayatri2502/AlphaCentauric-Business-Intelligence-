import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/auth screens/auuth_screen.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool isLoading = false;

  Future<void> signUpWithGoogle(BuildContext context) async {
    isLoading = true;

    //await Firebase.initializeApp();

    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final UserCredential authResult =
            await _auth.signInWithCredential(credential);
        final User? user = authResult.user;

        if (user != null) {
          // Show a success snack bar
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Sign up successful!'),
            ),
          );

          // Navigate to home screen after a delay
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) =>
                    const AuthScreen(), // Replace with your home screen widget
              ),
            );
          });
        }
      }
    } catch (error) {
      print('Error signing up with Google: $error');
    } finally {
      isLoading = false;
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    isLoading = true;

    // await Firebase.initializeApp();
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential authResult =
            await _auth.signInWithCredential(credential);
        final User? user = authResult.user;

        if (user != null) {
          // Check if the user's email exists in Firebase
          final userSnapshot =
              await _auth.fetchSignInMethodsForEmail(user.email!);
          if (userSnapshot.length > 0) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Signed in successfully!'),
              ),
            );

            // Navigate to Home screen after showing the snack bar
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) =>
                      AuthScreen(), // Replace with your Home screen widget
                ),
              );
            });
          } else {
            // User's email does not exist in Firebase
            await _auth.signOut(); // Sign out from Google
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('User does not exist in our system.'),
              ),
            );
          }
        }
      }
    } catch (error) {
      print('Error signing in with Google: $error');
    } finally {
      isLoading = false;
    }
  }
}
