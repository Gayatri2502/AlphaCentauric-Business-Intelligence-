// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_auth/auuth_screen.dart'; // Import your HomeScreen widget
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key, required this.userCredential});
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
//
//   final UserCredential userCredential;
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   bool _isLoading = false;
//
//   Future signInWithEmailAndPassword(BuildContext context) async {
//     setState(() {
//       _isLoading = true;
//     });
//
//     try {
//       final UserCredential userCredential =
//           await _auth.signInWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _passwordController.text,
//       );
//
//       final user = userCredential.user;
//       if (user != null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Signed in successfully!'),
//           ),
//         );
//         // Navigate to Home screen after showing the snack bar
//         Future.delayed(const Duration(seconds: 2), () {
//           Navigator.of(context).pushReplacement(
//             MaterialPageRoute(
//               builder: (context) => MyHomePage(
//                 user: widget.userCredential,
//               ), // Replace with your Home screen widget
//             ),
//           );
//         });
//       }
//     } catch (error) {
//       print('Error signing in: $error');
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Error signing in. Please check your credentials.'),
//         ),
//       );
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sign In'),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.5,
//                 height: MediaQuery.of(context).size.height * 0.5,
//                 padding: const EdgeInsets.all(16),
//                 margin: const EdgeInsets.only(bottom: 16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                       offset: const Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const Text(
//                       'Sign In',
//                       style:
//                           TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 16),
//                     TextFormField(
//                       controller: _emailController,
//                       decoration: const InputDecoration(labelText: 'Email'),
//                     ),
//                     const SizedBox(height: 16),
//                     TextFormField(
//                       controller: _passwordController,
//                       obscureText: true,
//                       decoration: const InputDecoration(labelText: 'Password'),
//                     ),
//                     const SizedBox(height: 24),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Check if the email exists in Firebase and then sign in
//                         // Implement loading indicator and snackbar logic
//                         signInWithEmailAndPassword(context);
//                       },
//                       child: _isLoading
//                           ? const CircularProgressIndicator() // Show loading indicator
//                           : const Text('Sign In'),
//                     ),
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   // Implement your sign-up logic here
//                   // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
//                 },
//                 child: const Text(
//                   "Don't have an account? Sign Up",
//                   style: TextStyle(fontSize: 16, color: Colors.blue),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
