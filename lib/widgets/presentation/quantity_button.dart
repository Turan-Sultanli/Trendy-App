import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendy_app/model/cart_item_model.dart';
import 'package:trendy_app/providers/cart_provider.dart';
import 'package:collection/collection.dart';

class QuantityButton extends ConsumerWidget {
  const QuantityButton({required this.productId, super.key});

  final int productId;

  @override
  Widget build(BuildContext context, ref) {
    final cartNotifier = ref.read(cartProvider.notifier);
    final cart = ref.watch(cartProvider);

    final CartItemModel? currentItem = cart.firstWhereOrNull(
      (item) => item.product.id == productId,
    );

    return Row(
      children: [
        Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(6)),
            child: IconButton(
              onPressed: () async {
                if (currentItem?.quantity == 1) {
                  final sholdRemove = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Remove Item'),
                      content:
                          Text('Do you want to remove this product from cart?'),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: Text('No')),
                        TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: Text('Yes')),
                      ],
                    ),
                  );
                  if (sholdRemove == true) {
                    cartNotifier.removeFromCart(productId);
                  }
                } else {
                  cartNotifier.decreaseQuantity(productId);
                }
              },
              icon: Icon(Icons.remove),
              iconSize: 18,
              padding: EdgeInsets.zero,
              splashRadius: 20,
            )),
        const SizedBox(width: 8),
        Text(currentItem?.quantity.toString() ?? '0',
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(width: 8),
        Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(6)),
            child: IconButton(
              onPressed: () {
                cartNotifier.increaseQuantity(productId);
              },
              icon: Icon(Icons.add),
              iconSize: 18,
              padding: EdgeInsets.zero,
              splashRadius: 20,
            )),
      ],
    );
  }
}
