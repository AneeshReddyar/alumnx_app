// import 'package:flutter/material.dart';
// import 'forgot.dart'; // Import the forgot password page (forgot.dart)
// import 'signup.dart'; // Import the signup page (signup.dart)
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//
//   void _login() {
//     // Implement your login logic here
//     String email = _emailController.text;
//     String password = _passwordController.text;
//
//     // Example: Sending data to backend
//     print('Email: $email, Password: $password');
//
//     // Navigate to next page after successful login (replace with your route)
//     Navigator.pushNamed(context, '/next_page');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // title: Text('Login'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               SizedBox(height: 20),
//               Text(
//                 'Welcome Back',
//                 style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'Sign in to your account',
//                 style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 136, 136, 136)),
//               ),
//               SizedBox(height: 30),
//               _buildTextField('Email', _emailController, false),
//               SizedBox(height: 10),
//               _buildTextField('Password', _passwordController, true),
//               SizedBox(height: 20),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
//                   );
//                 },
//                 child: Text(
//                   'Forgot password?',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     // decoration: TextDecoration.underline,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 80),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: _login,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color.fromARGB(255, 205, 228, 225),
//                     foregroundColor: Color.fromARGB(255, 7, 6, 6), // Button text color
//                     minimumSize: Size(200, 60), // Button size (width, height)
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30), // Round edges
//                     ),
//                   ),
//                   child: Text(
//                     'Login',
//                     style: TextStyle(
//                       fontSize: 18, // Font size
//                       fontWeight: FontWeight.bold, // Font weight
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     "Don't have an account? ",
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => SignupPage()),
//                       );
//                     },
//                     child: Text(
//                       'Sign Up',
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.blue,
//                         // decoration: TextDecoration.underline,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 40),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 20.0),
//                 child: Center(
//                   child: Image.asset(
//                     'assets/logo.png',  // Replace with your actual icon file path
//                     width: 120,  // Adjust width as needed
//                     height: 120, // Adjust height as needed
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(String label, TextEditingController controller, bool obscureText) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           label,
//           style: TextStyle(color: Color.fromARGB(255, 136, 136, 136)),
//         ),
//         SizedBox(height: 5),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey[200], // Grey background color
//             borderRadius: BorderRadius.circular(10), // Rounded corners
//           ),
//           child: TextField(
//             controller: controller,
//             obscureText: obscureText,
//             onChanged: (value) {
//               setState(() {}); // Update state on change
//             },
//             decoration: InputDecoration(
//               border: InputBorder.none, // Hide the default border
//               contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Padding inside the text field
//             ),
//           ),
//         ),
//
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'forgot.dart'; // Import the forgot password page (forgot.dart)
import 'signup.dart'; // Import the signup page (signup.dart)
import 'package:http/http.dart' as http;
import 'dart:convert'; // For encoding/decoding JSON
import 'landing.dart';
import 'package:provider/provider.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'token_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _tokenController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _login(Function(String) setToken) async {
    final String apiUrl = "https://www.alumnx.com/api/auth/login";
    // String email = "sardapreet@gmail.com";
    // String password = "kmit2024";
    String email = _emailController.text;
    String password = _passwordController.text;

    Map<String, String> requestBody = {
      "userName": email,
      "password": password,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        // Extract the token from the response headers
        String? token = response.headers['set-cookie'];

        if (token != null) {
          // Call the setToken function with the extracted token
          setToken(token);
          print('Login successful');
          // Navigate to the landing screen
          Navigator.pushNamed(context, '/landing');
        } else {
          print('Token not found in the response headers');
        }
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Login Failed',
              style: TextStyle( fontSize: 20.0),
            ),
            content: Text(
              'Incorrect email or password.',
              style: TextStyle(fontSize: 16.0),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: Colors.white,
            elevation: 5,
          ),
        );
        print('Failed to log in: ${response.statusCode}');
      }
    } catch (error) {
      print('Error sending request: $error');
    }
  }

  Future<void> _login1  () async {
    // Implement your login logic here
    final String apiUrl = "https://www.alumnx.com/api/auth/login";
    String email = _emailController.text;
    String password = _passwordController.text;

    // Example: Sending data to backend

    print('Email: $email, Password: $password');
    Map<String, String> requestBody = {
      "userName": email,
      "password": password,
    };

    try {
      // Sending a POST request
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON.
        var responseBody = jsonDecode(response.body);
        print(responseBody);
        // Do something with the response, e.g., navigate to a new page
        print('Login successful: $responseBody');
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        print('Failed to log in: ${response.statusCode}');
      }
    } catch (error) {
      print('Error sending request: $error');
    }

    // Navigate to next page after successful login (replace with your route)
    // Navigator.pushNamed(context, '/landing');
  }

  @override
  Widget build(BuildContext context) {
    final tokenProvider = Provider.of<TokenProvider>(context);
    return Scaffold(
      // appBar: AppBar(
      //   // title: Text('Login'),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50),
              Text(
                'Welcome Back',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Sign in to your account',
                style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 136, 136, 136)),
              ),
              SizedBox(height: 30),
              _buildTextField('Email', _emailController, false),
              SizedBox(height: 10),
              _buildTextField('Password', _passwordController, true),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                  );
                },
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Colors.blue,
                    // decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 80),
              Center(
                child: ElevatedButton(
                  // onPressed: _login,
                  onPressed: (){
                    _login(tokenProvider.setToken);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 205, 228, 225),
                    foregroundColor: Color.fromARGB(255, 7, 6, 6), // Button text color
                    minimumSize: Size(200, 60), // Button size (width, height)
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Round edges
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18, // Font size
                      fontWeight: FontWeight.bold, // Font weight
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
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
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, bool obscureText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(color: Color.fromARGB(255, 136, 136, 136)),
        ),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200], // Grey background color
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            onChanged: (value) {
              setState(() {}); // Update state on change
            },
            decoration: InputDecoration(
              border: InputBorder.none, // Hide the default border
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Padding inside the text field
            ),
          ),
        ),
      ],
    );
  }
}



