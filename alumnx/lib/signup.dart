// import 'package:flutter/material.dart';
//
// class SignupPage extends StatelessWidget {
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   final TextEditingController _phoneNumberController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//
//   // Dummy data for dropdowns
//   final List<String> colleges = ['College A', 'College B', 'College C'];
//   final List<String> degrees = ['Degree X', 'Degree Y', 'Degree Z'];
//   final List<String> batches = ['Batch 2020', 'Batch 2021', 'Batch 2022'];
//   final List<String> branches = ['Branch 1', 'Branch 2', 'Branch 3'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign Up'),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               _buildTextField('Enter First Name', _firstNameController, false),
//               SizedBox(height: 10),
//               _buildTextField('Enter Last Name', _lastNameController, false),
//               SizedBox(height: 10),
//               _buildTextField('Phone Number', _phoneNumberController, false),
//               SizedBox(height: 10),
//               _buildTextField('Create Password', _passwordController, true),
//               SizedBox(height: 10),
//               _buildTextField('Re-enter Password', _confirmPasswordController, true),
//               SizedBox(height: 10),
//               _buildDropdown('Select College', colleges),
//               SizedBox(height: 10),
//               _buildDropdown('Select Degree', degrees),
//               SizedBox(height: 10),
//               _buildDropdown('Select Batch', batches),
//               SizedBox(height: 10),
//               _buildDropdown('Select Branch', branches),
//               SizedBox(height: 20),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Implement sign-up logic
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color.fromARGB(255, 205, 228, 225),
//                     foregroundColor: Color.fromARGB(255, 7, 6, 6), // Button text color
//                     minimumSize: Size(200, 60), // Button size (width, height)
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30), // Round edges
//                     ),
//                   ),
//                   child: Text(
//                     'Sign Up',
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
//                     "Already have an account? ",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context); // Navigate back to previous page
//                     },
//                     child: Text(
//                       'Login',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.blue,
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               // SizedBox(height: 20),
//               SizedBox(height:20), // Adjust height as needed for logo spacing
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 20.0),
//                 child: Center(
//                   child: Image.asset(
//                     'assets/logo.png',  // Replace with your actual icon file path
//                     width: 150,  // Adjust width as needed
//                     height: 150, // Adjust height as needed
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
//         TextField(
//           controller: controller,
//           obscureText: obscureText,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDropdown(String label, List<String> items) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           label,
//           style: TextStyle(color: Color.fromARGB(255, 136, 136, 136)),
//         ),
//         SizedBox(height: 5),
//         DropdownButtonFormField<String>(
//           items: items.map((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//           onChanged: (String? value) {
//             // Implement dropdown value change
//           },
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'dart:convert'; // For encoding/decoding JSON
import 'package:http/http.dart' as http;

import 'admin_verify.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  // Dummy data for dropdowns
  final List<String> colleges = ['College A', 'College B', 'College C'];
  final List<String> degrees = ['Degree X', 'Degree Y', 'Degree Z'];
  final List<String> batches = ['Batch 2020', 'Batch 2021', 'Batch 2022'];
  final List<String> branches = ['Branch 1', 'Branch 2', 'Branch 3'];
  Future<void> _signup() async {
    final String apiUrl = "https://www.alumnx.com/api/auth/signup";

    String firstName = "_firstNameController.text.trim()";
    String lastName = "hello";
    String collegeId = "6667f1054650461bc47afd64";
    String degreeId = "666c0a23090884cb673fa9c4";
    String branchId = "6686a64573d8b07433a1f9c0";
    String batchId = "667c6235a1904a00bd4e0d60";
    String email = "naejrrrme@gmail.com";
    String phone = "9999998333";

    Map<String, String> requestBody = {
      "firstName": firstName,
      "lastName": lastName,
      "collegeId": collegeId,
      "degreeId": degreeId,
      "branchId": branchId,
      "batchId": batchId,
      "email": email,
      "phone": phone,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 201) {
        var responseBody = jsonDecode(response.body);
        print('Signup successful: $responseBody');
        // Navigate to home page or next screen upon successful signup
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminVerifyPage()),
        );
      } else {
        // Show styled alert dialog for signup failure
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Signup Failed',
              style: TextStyle(fontSize: 20.0),
            ),
            content: Text(
              'Failed to sign up. Please try again later.',
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
        print('Failed to sign up: ${response.statusCode}');
      }
    } catch (error) {
      print('Error sending request: $error');
      // Handle other types of errors (network, server, etc.) here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // title: Text('Sign Up'),
      // ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                'Sign Up',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              _buildTextField('Enter First Name', _firstNameController, false),
              SizedBox(height: 10),
              _buildTextField('Enter Last Name', _lastNameController, false),
              SizedBox(height: 10),
              _buildTextField('Enter Email', _emailController, false),
              SizedBox(height: 10),
              _buildTextField('Phone Number', _phoneNumberController, false),
              SizedBox(height: 10),
              _buildTextField('Create Password', _passwordController, true),
              SizedBox(height: 10),
              _buildTextField('Re-enter Password', _confirmPasswordController, true),
              SizedBox(height: 10),
              _buildDropdown('Select College', colleges),
              SizedBox(height: 10),
              _buildDropdown('Select Degree', degrees),
              SizedBox(height: 10),
              _buildDropdown('Select Batch', batches),
              SizedBox(height: 10),
              _buildDropdown('Select Branch', branches),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Implement sign-up logic
                    _signup();
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
                    'Sign Up',
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
                    "Already have an account? ",
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Navigate back to previous page
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Center(
                  child: Image.asset(
                    'assets/logo.png',  // Replace with your actual icon file path
                    width: 150,  // Adjust width as needed
                    height: 150, // Adjust height as needed
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
            color: Colors.grey[300], // Light grey background color
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

  Widget _buildDropdown(String label, List<String> items) {
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
            color: Colors.grey[300], // Light grey background color
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
          child: DropdownButtonFormField<String>(
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {
              // Implement dropdown value change
            },
            decoration: InputDecoration(
              border: InputBorder.none, // Hide the default border
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Padding inside the dropdown
            ),
          ),
        ),
      ],
    );
  }


}
