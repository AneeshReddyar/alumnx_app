import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TokenProvider with ChangeNotifier {
  String? _token;

  String? get token => _token;

  TokenProvider() {
    _loadToken();
  }

  Future<void> _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    notifyListeners();
  }

  Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    _token = token;
    notifyListeners();
  }

  Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    _token = null;
    notifyListeners();
  }
  Future<void> logout() async {
    if (_token == null) {
      throw Exception('Token not available');
    }

    final url = 'https://www.alumnx.com/api/auth/logout'; // Replace with your logout endpoint
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Cookie': 'jwt=$_token', // Assuming your JWT token is stored in a cookie named 'jwt'
      },
    );

    // if (response.statusCode == 200) {
    //   deleteToken(); // Clear token locally if logout was successful
    // } else {
    //   throw Exception('Failed to logout');
    // }
  }
}
