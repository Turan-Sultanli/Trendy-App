// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:trendy_app/constants/const_url.dart';
// import 'package:http/http.dart' as http;


// //Sign Up


// void signUpUser(String email, String password) async {
//   final url =
//       "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$firebaseApiKey";

//   final body = {
//     "email": email,
//     'password': password,
//     'returnSecureToken': true
//   };

//   final response = await http.post(
//     Uri.parse(url),
//     body: jsonEncode(body),
//     headers: {'Content-type': 'application/json'},
//   );

//   if (response.statusCode == 200) {
//     final data = jsonDecode(response.body);
//     final token = data['idToken'];
//     final userEmail = data['email'];
//     final userId = data['localId'];
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setString('token', token);
//   } else {
//     final errorData = jsonDecode(response.body);
//     final errorMessages = errorData['error']['message'];
//     print('Error : $errorMessages');
//   }
// }  

// //Sign In

// void signInUser(String email, String password) async {
//   final url =
//       "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$firebaseApiKey";

//   final body = {
//     'email': email,
//     'password': password,
//     'returnSecureToken': true
//   };

//   final response = await http.post(
//     Uri.parse(url),
//     body: jsonEncode(body),
//     headers: {'Content-Type': 'application/json'},
//   );

//   if (response.statusCode == 200) {
//     final data = jsonDecode(response.body);

//     final userId = data['localId'];
//     final token = data['idToken'];

//     final prefs = await SharedPreferences.getInstance();
//     prefs.setString('token', token);
//   } else {
//     final errorData = jsonDecode(response.body);
//     final errorMessages = errorData['error']['message'];
//     print('Error : $errorMessages');
//   }
// }



// //Check User' Status

// Future<bool> checkAuthStatus() async {
//   final prefs = await SharedPreferences.getInstance();
//   final token = prefs.getString('token');

//   if (token != null) {
//     return true;
//   } else {
//     return false;
//   }
// }



// // Logout User
// Future<void> logOutUser() async {
//   final prefs = await SharedPreferences.getInstance();
//   prefs.remove('token');
// }
