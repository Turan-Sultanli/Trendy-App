import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendy_app/providers/cart_provider.dart';

class OrderSummary extends ConsumerWidget {
  const OrderSummary(this.isExpanded, this.onArrowPressed, {super.key});

  final bool isExpanded;
  final VoidCallback onArrowPressed;

  @override
  Widget build(BuildContext context, ref) {
    final cart = ref.watch(cartProvider);
    final subtotal =
        cart.isEmpty ? 0.0 : ref.read(cartProvider.notifier).totalPrice;
    final shipping = subtotal > 100 ? 0 : (cart.isEmpty ? 0 : 5);
    final discount =
        cart.isEmpty ? 0 : (subtotal > 100 ? subtotal * 0.2 : subtotal * 0.1);
    final total = subtotal + shipping - discount;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: MediaQuery.of(context).size.width - 40.0,
      height: isExpanded ? 220 : 120,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Stack(
        children: [
          if (isExpanded)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '${subtotal.toStringAsFixed(2)} \$',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '${shipping.toStringAsFixed(2)} \$',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discount',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '${discount.toStringAsFixed(2)} \$',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: onArrowPressed,
                  icon: Icon(
                    isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  ),
                  iconSize: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Price',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '${total.toStringAsFixed(2)} \$',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(width: 50),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      backgroundColor: const WidgetStatePropertyAll(Colors.red),
                      padding: const WidgetStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      ),
                    ),
                    child: Text(
                      'Confirm Cart',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
