import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterinterviewdemo/LoginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyLoginPage(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // callHandler();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Text(
              'Hello',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  callHandler() async {
    var duration = new Duration(seconds: 4);
    return new Timer(duration, openNextScreen());
  }

  openNextScreen() async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MyLoginPage()));
  }
}
