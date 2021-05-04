import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../routes.dart';

const SERVER_IP = '7z7q2xjqa8.execute-api.us-east-1.amazonaws.com';

class Register extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  Future<String> attemptRegister(
      String name, String email, String password) async {
    var res = await http.post(
      Uri.https(SERVER_IP, '/dev/api/user/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'password': password,
      }),
    );
    if (res.statusCode == 200) {
      return ('Registered');
    }
    return res.body;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50.0,
        bottom: 40.0,
        left: 18.0,
        right: 18.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            controller: _nameController,
          ),
          SizedBox(
            height: 15.0,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            controller: _emailController,
          ),
          SizedBox(
            height: 15.0,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            controller: _passwordController,
          ),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: double.infinity,
            height: 80.0,
            child: ElevatedButton(
              onPressed: () async {
                var name = _nameController.text;
                var email = _emailController.text;
                var password = _passwordController.text;
                var result = await attemptRegister(name, email, password);
                if (result == 'Registered') {
                  Navigator.of(context)
                      ?.pushNamed(RouteGenerator.registerConfirmation);
                } else {
                  displayDialog(context, "An Error Occurred", result);
                }
              },
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: Text(
                'Register',
                style: TextStyle(fontSize: 25.0),
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Text(
            "Already have an account?",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          TextButton(
            onPressed: () =>
                Navigator.of(context)?.pushNamed(RouteGenerator.loginPage),
            child: Text(
              'Log in here!',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blueAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
