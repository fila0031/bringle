import 'package:flutter/material.dart';

import '../routes.dart';

class RegisterConfirmation extends StatelessWidget {
  const RegisterConfirmation();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Happy to have you onboard!',
                  style: TextStyle(color: Colors.white, fontSize: 35.0),
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: () => Navigator.of(context)
                      ?.pushNamed(RouteGenerator.loginPage),
                  child: Text(
                    'Log in here!',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
