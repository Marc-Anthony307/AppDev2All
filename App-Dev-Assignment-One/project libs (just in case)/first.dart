import 'dart:html';
import 'dart:js_util';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email = '';
  String _password = '';
  String _correctEmail = 'email';
  String _correctPassword = 'password';
  bool _loggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loggedIn ? _LoggedIn(_email) : _LoginPage(),
    );
  }

  Widget _LoginPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 20),
             child: Icon(
                Icons.account_circle_rounded,
                size: 75,
               color: Colors.blue,
              )
          ),
          Container(
            width: 250,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
              border: Border.all(color: Colors.grey),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Email',
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 250,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
              border: Border.all(color: Colors.grey),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Password',
              ),
              obscureText: true,
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 250,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                if (_password == _correctPassword && _email == _correctEmail) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Login Successful'),
                        duration: Duration(seconds: 2),
                      )
                  );
                  setState(() {
                    _loggedIn = true;
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Login Failed'),
                        duration: Duration(seconds: 2),
                      )
                  );
                }
              },
              child: Text('Login'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _LoggedIn(String _email) {
  return Center(
    child: Text(
      'Welcome, $_email',
      style: TextStyle(fontSize: 24),
    ),
  );
}





