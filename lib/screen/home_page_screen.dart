import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendy_app/presentation/categories_type.dart';
import 'package:trendy_app/presentation/custom_navigation_bar.dart';
import 'package:trendy_app/presentation/products_grid.dart';
import 'package:trendy_app/presentation/search_input.dart';
import 'package:trendy_app/providers/products_provider.dart';

class HomePageScreen extends ConsumerWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final products = ref.watch(filteredCategoryPovider);

    return Scaffold(
      // backgroundColor: Color(0xFFFCFCFC),
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
            SearchInput(),
            SizedBox(height: 24),
            CategoriesType(),
            SizedBox(height: 24),
            Expanded(
                child: ProductsGrid(
                  products: products,
                ))
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
