import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendy_app/widgets/presentation/product_item.dart';
import 'package:trendy_app/providers/products_provider.dart';
import 'package:trendy_app/model/products_model.dart';

class ProductsGrid extends ConsumerWidget {
  const ProductsGrid({super.key, required this.products});

  final List<ProductsModel> products;

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
                    color: const Color(0xFF252525),
                    fontWeight: FontWeight.w600,
                  ),
            ),
            TextButton(
              onPressed: () {
                ref.read(selectedCategoryProvider.notifier).state = 'all';
              },
              child: Text('See all',
                  style: (Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: const Color(0xFFDB3022),
                      fontWeight: FontWeight.w600))),
            ),
          ],
        ),
        Expanded(
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 24,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              return ProductItem(product: products[index]);
            },
          ),
        ),
      ],
    );
  }
}
