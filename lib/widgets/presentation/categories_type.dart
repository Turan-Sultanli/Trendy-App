import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendy_app/widgets/presentation/category_widget.dart';
import 'package:trendy_app/providers/products_provider.dart';

class CategoriesType extends ConsumerWidget {
  const CategoriesType({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        SizedBox(height: 16),
        SizedBox(
          height: 74,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              GestureDetector(
                  onTap: () {
                    ref.read(selectedCategoryProvider.notifier).state =
                        'clothes';
                  },
                  child: CategoryWidget(
                    icon: 'assets/icons/clothes.svg',
                    title: 'Clothes',
                    isSelected: selectedCategory == 'clothes',
                  )),
              SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  ref.read(selectedCategoryProvider.notifier).state =
                      'jewelery';
                },
                child: CategoryWidget(
                  icon: 'assets/icons/shoes.svg',
                  title: 'Jewelry',
                  isSelected: selectedCategory == 'jewelery',
                ),
              ),
              SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  ref.read(selectedCategoryProvider.notifier).state =
                      'electronics';
                },
                child: CategoryWidget(
                  icon: 'assets/icons/shoes.svg',
                  title: 'Electronics',
                  isSelected: selectedCategory == 'electronics',
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
