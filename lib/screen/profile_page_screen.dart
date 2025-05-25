import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trendy_app/providers/auth_provider.dart';
import 'package:trendy_app/screen/auth/sign_in_page_screen.dart';

class ProfilePageScreen extends ConsumerWidget {
  const ProfilePageScreen({super.key});

  Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    return email;
  }

  @override
  Widget build(BuildContext context, ref) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20, top: 100, bottom: 60),
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/images/profile.png'),
                const SizedBox(height: 16),
                FutureBuilder(
                  future: SharedPreferences.getInstance(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const CircularProgressIndicator();
                    }

                    final prefs = snapshot.data!;
                    final firstName = prefs.getString('firstName') ?? '';
                    final lastName = prefs.getString('lastName') ?? '';

                    return Text(
                      '$firstName $lastName',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 24, fontWeight: FontWeight.w800),
                    );
                  },
                ),
                FutureBuilder(
                    future: getUserEmail(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Text(
                          snapshot.data ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                color: const Color.fromARGB(255, 104, 101, 101),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    })
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.shopping_cart, size: 24),
                        const SizedBox(width: 12),
                        Text(
                          'Cart',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_right_outlined))
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.favorite_border, size: 24),
                        const SizedBox(width: 12),
                        Text(
                          'Favorites',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_right_outlined))
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.location_pin, size: 24),
                        const SizedBox(width: 12),
                        Text(
                          'Adress',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_right_outlined))
                  ],
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          child: ElevatedButton(
            onPressed: () async {
              await ref.read(authProvider.notifier).logOutUser();

              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const SignInScreen()),
                );
              });
            },
            style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(const Color(0xFFDB3022)),
                padding: WidgetStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 128))),
            child: Text(
              'Logout',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
