import 'dart:ui';

import 'package:attendance_app/widgets/form.dart';
import 'package:attendance_app/widgets/responsive_login.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWidget(
        smallScreen: Center(
          child: Stack(children: [
            Image.asset(
              'images/bg.jpg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffBCC2B6).withOpacity(.8),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                height: MediaQuery.of(context).size.height / 1.4,
                width: MediaQuery.of(context).size.width / 1.5,
                child: Column(
                  children: [
                    SizedBox(
                      height: 32.0,
                    ),
                    Text(
                      'Sign In',
                      style: TextStyle(fontSize: 28.0, color: Colors.teal),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    FormScreen(),
                  ],
                ),
              ),
            ),
          ]),
        ),
        mediumScreen: Center(
          child: Stack(children: [
            Image.asset(
              'images/bg.jpg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffBCC2B6).withOpacity(.8),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                height: MediaQuery.of(context).size.height / 1.4,
                width: MediaQuery.of(context).size.width / 2.8,
                child: Column(
                  children: [
                    SizedBox(
                      height: 32.0,
                    ),
                    Text(
                      'Sign In',
                      style: TextStyle(fontSize: 28.0, color: Colors.teal),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    FormScreen(),
                  ],
                ),
              ),
            ),
          ]),
        ),
        largeScreen: Center(
          child: Stack(children: [
            Image.asset(
              'images/bg.jpg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffBCC2B6).withOpacity(.8),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                height: MediaQuery.of(context).size.height / 1.4,
                width: MediaQuery.of(context).size.width / 4,
                child: Column(
                  children: [
                    SizedBox(
                      height: 32.0,
                    ),
                    Text(
                      'Sign In',
                      style: TextStyle(fontSize: 28.0, color: Colors.teal),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    FormScreen(),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
