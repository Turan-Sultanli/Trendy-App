import 'package:flutter/material.dart';

class ProfilePageScreen extends StatelessWidget {
  const ProfilePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                Text(
                  'John Doe',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 24, fontWeight: FontWeight.w800),
                ),
                Text(
                  'JonhDoe@gmail.com',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: const Color.fromARGB(255, 104, 101, 101),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                )
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
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20),
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
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20),
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
                        const Icon(Icons.shopping_cart, size: 24),
                        const SizedBox(width: 12),
                        Text(
                          'Adress',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20),
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
            onPressed: () {
              // cartNotifier.addToCart(newItem);
              // Navigator.pushAndRemoveUntil(
              //   context,
              //   MaterialPageRoute(
              //     builder: (_) => const RootScreen(initialIndex: 1),
              //   ),
              //   (route) => false,
              // );
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
