import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trendy_app/providers/wishlist_provider.dart';
import 'package:trendy_app/screen/details_page_screen.dart';
import 'package:trendy_app/service/products/products_model.dart';

class ProductItem extends ConsumerWidget {
  const ProductItem({super.key, required this.product});

  final ProductsModel product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlist = ref.watch(wishlistProvider);
    final isFavorite = wishlist.any((item) => item.id == product.id);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailsPageScreen(product: product),
        ));
      },
      child: SizedBox(
        height: 340,
        width: 178,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  product.image ?? '',
                  fit: BoxFit.contain,
                  height: 160,
                  width: MediaQuery.of(context).size.width / 2,
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: InkWell(
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
                ),
              ],
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                product.title ?? 'No title',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color(0xFF252525),
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '\$${product.price?.toStringAsFixed(2) ?? '0.00'} USD',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: const Color(0xFFDB3022),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
