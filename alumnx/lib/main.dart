// import 'package:flutter/material.dart';
// import 'homepage.dart';
// import 'login.dart';
// import 'signup.dart';
// import 'admin_verify.dart';
// // import 'storage_service.dart';
//
// void main() {
//   // String? jwt = await StorageService.instance.read('jwt_token');
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Alumnx',
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       routes: {
//         '/admin_verify':(context)=>AdminVerifyPage(),
//         '/': (context) => HomePage(),
//         '/login': (context) => LoginPage(),
//         '/signup': (context) => SignupPage(),
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'token_provider.dart';
import 'login.dart';
import 'landing.dart';
import 'homepage.dart';
import 'signup.dart';
import 'admin_verify.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TokenProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Consumer<TokenProvider>(
          builder: (context, tokenProvider, child) {
            if (tokenProvider.token == null) {
              return HomePage();
            } else {
              return LandingPage();
            }
          },
        ),
        '/login': (context) => LoginPage(),
        '/landing': (context) => LandingPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/admin_verify': (context) => AdminVerifyPage()
      },
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class LoginWidget extends StatelessWidget {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   Future<void> _login() async {
//     final String apiUrl = "https://www.alumnx.com/api/auth/login";
//     String email = "sardapreet@gmail.com";
//     String password ="kmit2024";
//
//     print('Email: $email, Password: $password');
//     Map<String, String> requestBody = {
//       "userName": email,
//       "password": password,
//     };
//
//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {
//           "Content-Type": "application/json",
//         },
//         body: jsonEncode(requestBody),
//       );
//
//       if (response.statusCode == 200) {
//         var responseBody = jsonDecode(response.body);
//         print(responseBody);
//         print('Login successful: $responseBody');
//       } else {
//         print('Failed to log in: ${response.statusCode}');
//       }
//     } catch (error) {
//       print('Error sending request: $error');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _login,
//           child: Text('Login'),
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: LoginWidget(),
//   ));
// }
