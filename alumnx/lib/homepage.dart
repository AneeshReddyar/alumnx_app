import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Alumnx'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 200,),
            // Replace with your actual logo widget or image
            // FlutterLogo(size: 100),
            Image.asset(
              'assets/logo.png',  // Replace with your actual icon file path
              width: 250,  // Adjust width as needed
              height: 250, // Adjust height as needed
            ),
            Spacer(), // Pushes the content to the bottom
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255,205, 228, 225),
                  foregroundColor: Color.fromARGB(255,7, 6, 6,), // Button text color
                  minimumSize: Size(200, 60), // Button size (width, height)
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(48), // Round edges
                  ),
                ),
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 18, // Font size
                    fontWeight: FontWeight.bold, // Font weight
                    // color: Colors.white, // Text color
                  ),
                ),
              ),
            SizedBox(height: 30),
            RichText(
              text: TextSpan(
                text: 'Have an account? ',
                style: TextStyle(color: Colors.black,fontSize: 18),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Login',
                    style: TextStyle(color: Colors.blue,fontSize: 18),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, '/login');
                      },
                  ),
                ],
              ),
            ),
            SizedBox(height: 100), // Add some space at the bottom if needed
          ],
        ),
      ),
    );
  }
}
