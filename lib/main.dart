import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendy_app/screen/auth/sign_up_page_screen.dart';
import 'package:trendy_app/screen/root_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trendy App',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFFFCFCFC), scrolledUnderElevation: 0)),
      // theme: ThemeData(
      //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //     useMaterial3: true,
      //     bottomNavigationBarTheme:
      //         BottomNavigationBarThemeData(backgroundColor: Colors.red)),
      home:  SignUpScreen(),
    );
  }
}
