import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendy_app/screen/home_page_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trendy App',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFFFCFCFC),
      )),
      // theme: ThemeData(
      //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //     useMaterial3: true,
      //     bottomNavigationBarTheme:
      //         BottomNavigationBarThemeData(backgroundColor: Colors.red)),
      home: HomePageScreen(),
    );
  }
}
