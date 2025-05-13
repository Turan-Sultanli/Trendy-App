import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendy_app/presentation/order_summary.dart';
import 'package:trendy_app/presentation/quantity_button.dart';
import 'package:trendy_app/providers/cart_provider.dart';
import 'package:trendy_app/screen/home_page_screen.dart';

class CartPageScreen extends ConsumerWidget {
  const CartPageScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final cart = ref.watch(cartProvider);
    final cartNotifier = ref.read(cartProvider.notifier);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (!didPop) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomePageScreen()),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Cart'),
          ),
        ),
        body: cart.isEmpty
            ? Center(
                child: Text('Your cart is empty'),
              )
            : ListView.builder(
                itemCount: cart.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  final item = cart[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          item.product.image.toString(),
                          width: 140,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.product.title.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              Text(
                                '\$${item.product.price?.toStringAsFixed(2) ?? '0,00'}USD',
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text('Rating'),
                                  const SizedBox(width: 8),
                                  Text('(500)'),
                                ],
                              ),
                              const SizedBox(height: 16),
                              QuantityButton(productId: item.product.id!)
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            final shouldRemove = await showDialog<bool>(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                    'Do you want remove this product from cart ?'),
                                actions: [
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, false),
                                      child: Text('No')),
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, true),
                                      child: Text('Yes')),
                                ],
                              ),
                            );
                            if (shouldRemove == true) {
                              cartNotifier.removeFromCart(item.product.id!);
                            }
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  );
                },
              ),
              bottomNavigationBar: OrderSummary(),
      ),
    );
  }
}
