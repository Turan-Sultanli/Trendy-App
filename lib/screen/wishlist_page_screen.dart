import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendy_app/providers/wishlist_provider.dart';

class WishlistPageScreen extends ConsumerWidget {
  const WishlistPageScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final wishlist = ref.watch(wishlistProvider);

    if (wishlist.isEmpty) {
      return Center(
        child: Text('Wishlist is empty'),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Center(
              child: Text(
            'Watchlist',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          )),
        ),
        body: Container(
          height: 300,
          color: Colors.amber,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset('assets/images/product.png'),
                  ),
                  Column(
                    children: [
                      Text('Title'),
                      Text('100 USD'),
                      Text('About'),
                    ],
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border_outlined),
              ),
            ],
          ),
        ),
      );
    }
  }
}
