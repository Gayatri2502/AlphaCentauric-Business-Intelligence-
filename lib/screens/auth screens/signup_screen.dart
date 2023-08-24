import 'package:abi/screens/auth%20screens/auuth_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  bool isAccountCreated = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        isAccountCreated = false;
      });

      try {
        // Simulating user creation delay with Future.delayed
        await Future.delayed(Duration(seconds: 2));

        // Replace this with your actual authentication code
        // await _auth.createUserWithEmailAndPassword(...)
        // await FirebaseFirestore.instance.collection('users').doc(...).set(...);

        await _auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        // Assuming you have a Firestore instance set up
        // You can store additional user data like username and phone number here
        await FirebaseFirestore.instance
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .set({
          'uid': _auth.currentUser!.uid,
          'email': _emailController.text,
          'userName': _userNameController.text,
          'phoneNumber': int.parse(_phoneNumberController.text),
        });

        // Simulating successful account creation

        if (isAccountCreated) {
          setState(() {
            _isLoading = false;
            isAccountCreated = true;
          });
          showPopUpContainer('Account created successfully', true);
        }
      } catch (e) {
        showPopUpContainer('Error: $e', false);
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  // void _submitForm() async {
  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       await _auth.createUserWithEmailAndPassword(
  //         email: _emailController.text,
  //         password: _passwordController.text,
  //       );
  //
  //       // Assuming you have a Firestore instance set up
  //       // You can store additional user data like username and phone number here
  //       await FirebaseFirestore.instance
  //           .collection('users')
  //           .doc(_auth.currentUser!.uid)
  //           .set({
  //         'uid': _auth.currentUser!.uid,
  //         'email': _emailController.text,
  //         'userName': _userNameController.text,
  //         'phoneNumber': int.parse(_phoneNumberController.text),
  //       }).then((value) =>
  //               Navigator.of(context).push(MaterialPageRoute(builder: (_) {
  //                 return MyHomePage();
  //               })));
  //
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Account created successfully')),
  //       );
  //
  //       // Navigate to the next screen or perform other actions
  //       // after successful signup and data storage
  //     } catch (e) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //
  //       // Handle errors here
  //       print('Error: $e');
  //       // Display a snackbar or dialog to show the error message
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('$e')),
  //       );
  //     }
  //   }
  // }
  void showPopUpContainer(String message, bool isSuccess) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isSuccess ? 'Success' : 'Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (isSuccess) {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (_) {
                    return AuthScreen();
                  }));
                }
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print('im heree..........');
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _userNameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _phoneNumberController,
                    decoration:
                        const InputDecoration(labelText: 'Phone Number'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      return _submitForm();
                    },
                    child: _isLoading
                        ? CircularProgressIndicator()
                        : Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
