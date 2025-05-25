import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendy_app/providers/auth_provider.dart';
import 'package:trendy_app/screen/auth/sign_in_page_screen.dart';
import 'package:trendy_app/screen/root_screen.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return FutureBuilder<bool>(
      future: ref.read(authProvider.notifier).checkAuthStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.data == true) {
          return const RootScreen();
        } else {
          return const SignInScreen();
        }
      },
    );
  }
}
