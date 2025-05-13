import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendy_app/model/cart_item_model.dart';

final cartProvider =
    StateNotifierProvider<CartNotifier, List<CartItemModel>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<CartItemModel>> {
  CartNotifier() : super([]);
}
