import 'package:flutter/material.dart';
import 'package:flutterinterviewdemo/DashboardScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final username_controller = TextEditingController();
  final password_controller = TextEditingController();

  SharedPreferences loginData;
  bool newUser;
  @override
  void initState() {
    super.initState();
  }



  @override
  void dispose() {
    username_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Login Form",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: username_controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'username',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  obscureText: true,
                  controller: password_controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () async {
                  String username = username_controller.text;
                  String password = password_controller.text;
                  if (username != '' && password != '') {
                    print('Successfull');
                    loginData = await SharedPreferences.getInstance();
                    loginData.setBool('login', false);
                    loginData.setString('username', username);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashBoardScreen()));
                  }
                },
                child: Text("Log-In"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
