import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendy_app/model/cart_item_model.dart';
import 'package:trendy_app/providers/cart_provider.dart';

import 'package:trendy_app/providers/wishlist_provider.dart';
import 'package:trendy_app/screen/root_screen.dart';

class WishlistPageScreen extends ConsumerWidget {
  const WishlistPageScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final wishlist = ref.watch(wishlistProvider);
    final cartNotifier = ref.read(cartProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Center(
            child: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        )),
      ),
      body: wishlist.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.favorite_border,
                      size: 80, color: Colors.grey),
                  const SizedBox(height: 12),
                  const Text(
                    'Your wishlist is empty',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tap the heart icon on products to add them here.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: wishlist.length,
              itemBuilder: (context, index) {
                final product = wishlist[index];
                return Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 160,
                            width: 100,
                            child: Image.network(product.image ?? '',
                                fit: BoxFit.contain),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                                '${product.price?.toStringAsFixed(2) ?? '0.00'} USD',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      color: const Color(0xFFDB3022),
                                    )),
                            const SizedBox(height: 8),
                            Text(
                              product.description ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                final newItem = CartItemModel(
                                    product: product, quantity: 1);
                                cartNotifier.addToCart(newItem);
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const RootScreen(
                                              initialIndex: 1,
                                            )),
                                    (route) => false);
                              },
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                    const Color(0xFFDB3022)),
                              ),
                              child: Text(
                                'Add To Cart',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                  'Do you want remove this product from wishlist ?'),
                              actions: [
                                TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, false),
                                    child: const Text('No')),
                                TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, true),
                                    child: const Text('Yes'))
                              ],
                            ),
                          );
                          if (confirm == true) {
                            ref
                                .read(wishlistProvider.notifier)
                                .toggleWishlist(product);
                          }
                        },
                        icon: const Icon(Icons.favorite, color: Colors.red),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
