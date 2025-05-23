import 'package:trendy_app/model/products_model.dart';

class CartItemModel {
  final ProductsModel product;
  final int quantity;

  const CartItemModel({required this.product, this.quantity = 1});

  CartItemModel copyWith({
    ProductsModel? product,
    int? quantity,
  }) {
    return CartItemModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}
