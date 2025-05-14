import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trendy_app/model/cart_item_model.dart';
import 'package:trendy_app/providers/cart_provider.dart';
import 'package:trendy_app/providers/wishlist_provider.dart';
import 'package:trendy_app/model/products_model.dart';
import 'package:trendy_app/screen/cart_page_screen.dart';

class DetailsPageScreen extends ConsumerWidget {
  const DetailsPageScreen({
    super.key,
    required this.product,
  });

  final ProductsModel product;

  @override
  Widget build(BuildContext context, ref) {
    final wishlist = ref.watch(wishlistProvider);
    final isFavorite = wishlist.any((item) => item.id == product.id);
    final cartNotifier = ref.read(cartProvider.notifier);
    final newItem = CartItemModel(product: product, quantity: 1);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Details',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 34.0),
        child: SizedBox.expand(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.network(
                  product.image.toString(),
                  height: MediaQuery.of(context).size.height * 0.4,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.38,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 100,
                              child: Text(
                                product.title.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                ref
                                    .read(wishlistProvider.notifier)
                                    .toggleWishlist(product);
                              },
                              child: SvgPicture.asset(
                                isFavorite
                                    ? 'assets/icons/heart_red.svg'
                                    : 'assets/icons/heart.svg',
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                          '\$${product.price?.toStringAsFixed(2) ?? '0,00'}USD',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: Color(0xFFDB3022),
                                  )),
                      const SizedBox(height: 20),
                      Text(
                        'Description:',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        product.description.toString(),
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF505050)),
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          cartNotifier.addToCart(newItem);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartPageScreen(),
                              ));
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(Color(0xFFDB3022)),
                            padding: WidgetStateProperty.all(
                                EdgeInsets.symmetric(
                                    vertical: 18, horizontal: 128))),
                        child: Text(
                          'Add To Cart',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
