import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 45.0,
                  color: Colors.black.withOpacity(0.8),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  width: double.infinity,
                  height: 135.0,
                  child: Center(
                    child: Text(
                      'Button 1',
                      style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  width: double.infinity,
                  height: 135.0,
                  child: Center(
                    child: Text(
                      'Button 2',
                      style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
