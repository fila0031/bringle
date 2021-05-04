import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../routes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show ascii, base64, json, jsonEncode;

final storage = FlutterSecureStorage();

const SERVER_IP = '7z7q2xjqa8.execute-api.us-east-1.amazonaws.com';

class Login extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  Future<String> attemptLogIn(String email, String password) async {
    var res = await http.post(
      Uri.https(SERVER_IP, '/dev/api/user/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    return res.headers['auth-token'];
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
                var email = _emailController.text;
                var password = _passwordController.text;
                var jwt = await attemptLogIn(email, password);
                if (jwt != null) {
                  Navigator.of(context)
                      ?.pushNamed(RouteGenerator.dashboardPage);
                } else
                  displayDialog(
                      context, "An Error Occurred", "Wrong email or password!");

                // if (jwt != null) {
                //   storage.write(key: "jwt", value: jwt);
                //   Navigator.of(context)
                //       ?.pushNamed(RouteGenerator.dashboardPage);
                // } else {
                //   displayDialog(
                //       context, "An Error Occurred", "Wrong email or password!");
                // }
              },
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: Text(
                'Log in',
                style: TextStyle(fontSize: 25.0),
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Text(
            "Don't have an account?",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          TextButton(
            onPressed: () =>
                Navigator.of(context)?.pushNamed(RouteGenerator.registerPage),
            child: Text(
              'Sign up here!',
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
