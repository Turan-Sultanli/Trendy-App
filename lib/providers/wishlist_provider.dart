import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendy_app/model/products_model.dart';

final wishlistProvider =
    StateNotifierProvider<WishlistNotifier, List<ProductsModel>>(
  (ref) => WishlistNotifier(),
);

class WishlistNotifier extends StateNotifier<List<ProductsModel>> {
  WishlistNotifier() : super([]);

  void toggleWishlist(ProductsModel product) {
    final isExist = state.any((item) => item.id == product.id);

    if (isExist) {
      state = state.where((item) => item.id != product.id).toList();
    } else {
      state = [...state, product];
    }
  }

  bool isInWishlist(ProductsModel product) {
    return state.any((item) => item.id == product.id);
  }
}
