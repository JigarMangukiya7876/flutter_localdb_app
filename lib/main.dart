import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterinterviewdemo/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DashboardScreen.dart';
import 'Model/UserData.dart';
import 'http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SharedPreferences loginData;

  bool newUser;

  @override
  void initState() {
    super.initState();
     callHandler();
     getUser();
  }

  getUser() async {
    List<UserData> u = await fetchUsers();
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
    return new Timer(duration, goToNextScreen());
  }

   goToNextScreen() async {
    loginData = await SharedPreferences.getInstance();
    newUser = (loginData.getBool('login') ?? true);
    print(newUser);
    if (newUser == false) {
      Navigator.pushReplacement(context,
          new MaterialPageRoute(builder: (context) => DashBoardScreen()));
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => MyLoginPage()));
    }
  }
}
