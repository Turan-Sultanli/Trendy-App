import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendy_app/widgets/presentation/categories_type.dart';
import 'package:trendy_app/widgets/presentation/products_grid.dart';
import 'package:trendy_app/widgets/presentation/search_input.dart';
import 'package:trendy_app/providers/products_provider.dart';

class HomePageScreen extends ConsumerWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final products = ref.watch(filteredCategoryPovider);

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Trendy',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchInput(),
            const SizedBox(height: 24),
            const CategoriesType(),
            const SizedBox(height: 24),
            Expanded(
                child: ProductsGrid(
                  products: products,
                ))
          ],
        ),
      ),
      // bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
