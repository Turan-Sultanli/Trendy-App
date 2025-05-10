import 'package:riverpod/riverpod.dart';
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

  if (productAsync is! AsyncData) {
    return [];
  }

  final allProducts = productAsync.value!;

  if(selectedCategory == 'all') {
    return allProducts;
  }

  if (selectedCategory == 'clothes') {
    return allProducts.where((product) {
      return product.category == "men's clothing" ||
          product.category == "women's clothing";
    }).toList();
  } else {
    return allProducts
        .where((product) => product.category == selectedCategory)
        .toList();
  }
});
