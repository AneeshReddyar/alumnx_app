import 'package:flutter/material.dart';
import 'homepage.dart'; // Import your homepage.dart file
import 'package:alumnx/admin_verify.dart';

class AdminVerifyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Admin Verification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 150,),
            Image.asset(
              'assets/adminpage.png',  // Replace with your actual image file path
              width: 180,  // Adjust width as needed
              height: 180, // Adjust height as needed
            ),
            SizedBox(height: 30),
            RichText(
              text: TextSpan(
                text: 'Thank you for submitting',
                style: TextStyle(color: Colors.green,fontSize: 20),

              ),
            ),
            RichText(
              text: TextSpan(
                text: 'your details',
                style: TextStyle(color: Colors.green,fontSize: 20),

              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Center(
                child: Image.asset(
                  'assets/logo.png',  // Replace with your actual icon file path
                  width: 120,  // Adjust width as needed
                  height: 120, // Adjust height as needed
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
