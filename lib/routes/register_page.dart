import 'package:bringle/widgets/register.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff74b9ff),
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: Offset(
                    0.0,
                    -10.0,
                  ),
                  blurRadius: 25.0,
                  spreadRadius: 5.0,
                ),
              ],
            ),
            child: Register(),
          ),
        ],
      ),
    );
  }
}
