import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendy_app/model/cart_item_model.dart';

final cartProvider =
    StateNotifierProvider<CartNotifier, List<CartItemModel>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<CartItemModel>> {
  CartNotifier() : super([]);

  // add product to cart
  void addToCart(CartItemModel newItem) {
    final isExist = state.any((item) => item.product.id == newItem.product.id);

    if (isExist) {
      state = state.map((item) {
        if (item.product.id == newItem.product.id) {
          return item.copyWith(quantity: item.quantity + 1);
        } else {
          return item;
        }
      }).toList();
    } else {
      state = [...state, newItem];
    }
  }

  // remove prdocut from cart
  void removeFromCart(int productId) {
    state = state.where((item) => item.product.id != productId).toList();
  }

  //increase quantity
  void increaseQuantity(int productId) {
    state = state.map((item) {
      if (item.product.id == productId) {
        return item.copyWith(quantity: item.quantity + 1);
      } else {
        return item;
      }
    }).toList();
  }

  //decrease quantity
  void decreaseQuantity(int productId) {
    state = state
        .map((item) {
          if (item.product.id == productId) {
            if (item.quantity > 1) {
              return item.copyWith(quantity: item.quantity - 1);
            } else {
              return null;
            }
          }
          return item;
        })
        .whereType<CartItemModel>()
        .toList();
  }

  //sum of product price
  double getItemTotalPrice(int productId) {
    CartItemModel? item =
        state.firstWhereOrNull((item) => item.product.id == productId);

    if (item == null) return 0;
    return (item.product.price ?? 0) * item.quantity;
  }

  //sum of all products price
  double get totalPrice =>
      state.fold(0.0, (sum, item) => sum + item.product.price! * item.quantity);
}
