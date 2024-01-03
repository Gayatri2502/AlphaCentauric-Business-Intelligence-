import 'package:abi/responsive_builder/desktop_widgets/desktop_home_screen_widget/app_bar_widget.dart';
import 'package:abi/responsive_builder/desktop_widgets/desktop_home_screen_widget/login_form_widget.dart';
import 'package:abi/responsive_builder/desktop_widgets/desktop_home_screen_widget/signup_form_widget.dart';
import 'package:flutter/material.dart';

class BusinessOwnerForm extends StatefulWidget {
  BusinessOwnerForm({super.key, required this.isLogin});
  bool isLogin;

  @override
  _BusinessOwnerFormState createState() => _BusinessOwnerFormState();
}

class _BusinessOwnerFormState extends State<BusinessOwnerForm> {
  @override
  void initState() {
    widget.isLogin = !widget.isLogin;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: desktopAppBarOpen(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(50),
                    width: 850,
                    child: const Text(
                      '''Unlock the Future of your Business: Join Alphacentauric Business Intelligence Today!''',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      // Image.asset(
                      //   'asset/24.png',
                      //   scale: 1,
                      // ),
                      Image.asset(
                        'asset/17.png',
                        scale: 1.5,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 200,
                        width: 450,
                        child: const Text(
                          '''Empowering Your Business with Data-Driven Insights and Success Strategies!!!''',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                  // Image.asset('asset/35 (3).jpeg')
                ],
              ),
              widget.isLogin ? const LoginForm() : const SignupForm()
            ],
          ),
        ),
      ),
    );
  }
}
