import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trendy_app/providers/products_provider.dart';
import 'package:trendy_app/providers/wishlist_provider.dart';
import 'package:trendy_app/screen/details_page_screen.dart';

class ProductItem extends ConsumerWidget {
  const ProductItem({super.key});

  final bool isSelected = true;

  @override
  Widget build(BuildContext context, ref) {
    final products = ref.watch(filteredCategoryPovider);
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        padding: EdgeInsets.only(bottom: 60),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 24,
          childAspectRatio: 0.7,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Consumer(
            builder: (context, ref, child) {
              final products = ref.watch(filteredCategoryPovider);
              final product = products[index];
              final wishlist = ref.watch(wishlistProvider);
              final isFavorite = wishlist.any((item) => item.id == product.id);

              return SizedBox(
                width: 178,
                height: 300,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Stack(children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  DetailsPageScreen(product: product),
                            ));
                          },
                          child: Image.network(
                            product.image.toString(),
                            fit: BoxFit.contain,
                            height: 202,
                            width: MediaQuery.of(context).size.width / 2,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                            child: GestureDetector(
                              //add to wishlist
                              onTap: () {
                                ref
                                    .read(wishlistProvider.notifier)
                                    .toggleWishlist(product);
                              },
                              child: isFavorite
                                  ? SvgPicture.asset(
                                      'assets/icons/heart_red.svg',
                                      width: 20,
                                      height: 20,
                                    )
                                  : SvgPicture.asset(
                                      'assets/icons/heart.svg',
                                      width: 20,
                                      height: 20,
                                    ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        product.title ?? 'No title',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Color(0xFF252525),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '\$${product.price?.toStringAsFixed(2) ?? '0.00'} USD',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color: Color(0xFFDB3022),
                                ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
