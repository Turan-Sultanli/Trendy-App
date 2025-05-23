import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trendy_app/constants/const_url.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

class AuthState {
  const AuthState({
    this.isLoading = false,
    this.error,
    this.isSucces = false,
  });

  final bool isLoading;
  final String? error;
  final bool isSucces;

  AuthState copyWith({bool? isLoading, String? error, bool? isSucces}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      isSucces: isSucces ?? this.isSucces,
    );
  }
}

enum LoginState { initial, authorized, unAuthorized }

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState());

  //SIGN IN USER

  Future<void> signInUser(String email, String password) async {
    final url =
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$firebaseApiKey";

    final body = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    state = state.copyWith(isLoading: true, error: null);
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // final userId = data['localId'];
      final token = data['idToken'];

      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      prefs.setString('email', email);
      state = state.copyWith(isLoading: false, error: null, isSucces: true);
    } else {
      final errorData = jsonDecode(response.body);
      final errorMessages = errorData['error']['message'];
      state = state.copyWith(error: errorMessages, isSucces: false, isLoading: false);
    }
  }

  //SIGN UP USER

  void signUpUser(String email, String password) async {
    final url =
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$firebaseApiKey";

    final body = {
      "email": email,
      'password': password,
      'returnSecureToken': true
    };

    state = state.copyWith(isLoading: true, error: null);
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: {'Content-type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['idToken'];
      // final userEmail = data['email'];
      // final userId = data['localId'];
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      prefs.setString('email', email);
      state = state.copyWith(isLoading: false, error: null, isSucces: true);
    } else {
      final errorData = jsonDecode(response.body);
      final errorMessages = errorData['error']['message'];
      state = state.copyWith(error: errorMessages, isSucces: false, isLoading: false);
    }
  }

  //LOG OUT USER

  Future<void> logOutUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    state = state.copyWith(isLoading: false, error: null, isSucces: false);
  }

// CHECK USER STATUS

  Future<bool> checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  void resetState() {
  state = const AuthState();
}
}
