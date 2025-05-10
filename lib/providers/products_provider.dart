import 'package:riverpod/riverpod.dart';
import 'package:trendy_app/providers/search_provider.dart';
import 'package:trendy_app/service/products/get_products.dart';
import 'package:trendy_app/service/products/products_model.dart';

//all products
final productsProvider = FutureProvider<List<ProductsModel>>((ref) async {
  return await getProducts();
});

//selected category
final selectedCategoryProvider = StateProvider<String>((ref) => 'all');

final filteredCategoryPovider = Provider<List<ProductsModel>>((ref) {
  final productAsync = ref.watch(productsProvider);
  final selectedCategory = ref.watch(selectedCategoryProvider);
  final searchText = ref.watch(searchProvider).toLowerCase();

  List<ProductsModel> filteredProducts = [];

  if (productAsync is! AsyncData) {
    return [];
  }

  final allProducts = productAsync.value!;

  if (selectedCategory == 'all') {
    return allProducts;
  }

  if (selectedCategory == 'clothes') {
    return allProducts.where((product) {
      return product.category == "men's clothing" ||
          product.category == "women's clothing";
    }).toList();
  } else {
    filteredProducts = allProducts
        .where((product) => product.category == selectedCategory)
        .toList();
  }
  if (searchText.isNotEmpty) {
    filteredProducts = filteredProducts
        .where((product) =>
            (product.title ?? '').toLowerCase().contains(searchText))
        .toList();
  }
  return filteredProducts;
});
