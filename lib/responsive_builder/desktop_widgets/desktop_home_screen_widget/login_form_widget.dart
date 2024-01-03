import 'package:abi/responsive_builder/desktop_widgets/desktop_home_screen_widget/desktop_home_screen.dart';
import 'package:abi/responsive_builder/desktop_widgets/desktop_home_screen_widget/detail_form.dart';
import 'package:flutter/material.dart';

import '../../../auth_services/auth_services.dart';
import '../../../custom_widgets/loading_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String businessType = '';
  String servicesProvided = '';
  String ownerName = '';
  String location = '';
  String id = '';
  bool isHovered = false;
  AuthServices authServices = AuthServices();
  final _formKey = GlobalKey<FormState>();

  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
          ),
          Container(
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
            alignment: Alignment.centerRight,
            width: MediaQuery.of(context).size.width * 0.35,
            child: Opacity(
              opacity: 0.9, // Adjust the opacity as needed
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 30.0),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Admin Id',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter owner name.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          ownerName = value!;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'password',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter an ID.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          id = value!;
                        },
                      ),
                      const SizedBox(height: 35.0),
                      ElevatedButton(
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.all(
                                16.0), // Adjust the padding as needed
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            isHovered
                                ? Colors.indigo.shade900
                                : Colors
                                    .indigo.shade100, // Change colors as needed
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  0.0), // Make it rectangular
                            ),
                          ),
                        ),
                        onPressed: () {
                          LoadAndNavigateWidget.showLoadingAndNavigate(
                              context, DesktopHomeScreen());
                        },
                        child: const Text(
                          'Log In ',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isLogin = true;
                              });
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return BusinessOwnerForm(isLogin: isLogin);
                              }));
                            },
                            child: Text(
                              'SIGNUP',
                              style: TextStyle(
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        "--------------------OR-------------------",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      ElevatedButton.icon(
                        onPressed: () {
                          authServices.signInWithGoogle(context);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.indigo
                                  .shade100), // Customize the color as needed
                        ),
                        icon: const Icon(
                            Icons.g_mobiledata), // Change the icon as needed
                        label: const Text(
                          'SignIn with Google',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
