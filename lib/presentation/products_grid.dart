import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendy_app/presentation/product_item.dart';

class ProductsGrid extends ConsumerWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Latest Products',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Color(0xFF252525),
                    fontWeight: FontWeight.w600,
                  ),
            ),
            TextButton(
              onPressed: () {},
              child: Text('See all',
                  style: (Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Color(0xFFDB3022), fontWeight: FontWeight.w600))),
            ),
          ],
        ),
        ProductItem()
      ],
    );
  }
}
