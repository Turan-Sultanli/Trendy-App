import 'package:flutter/material.dart';
import 'package:trendy_app/presentation/categories_type.dart';
import 'package:trendy_app/presentation/custom_navigation_bar.dart';
import 'package:trendy_app/presentation/products_grid.dart';
import 'package:trendy_app/presentation/search_input.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SearchInput(),
                    SizedBox(height: 24),
                    CategoriesType(),
                    SizedBox(height: 24),
                    ProductsGrid()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
