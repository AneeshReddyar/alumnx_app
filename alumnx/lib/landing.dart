// import 'package:flutter/material.dart';
//
// class LandingPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Landing Page'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Welcome to the Landing Page!',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Replace with logic to navigate back to login or other pages
//                 Navigator.pop(context);
//               },
//               child: Text('Logout'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'token_provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tokenProvider = Provider.of<TokenProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Landing Screen'),
        actions: [
          ElevatedButton(
            onPressed: () {
              tokenProvider.logout();
              tokenProvider.deleteToken();
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false); // Navigate to home screen and remove all other routes
            },
            child: Text('Logout'),
          ),
        ],
      ),
      body: Center(
        child: Text('Token: ${tokenProvider.token ?? "No token"}'),
      ),
    );
  }
}

