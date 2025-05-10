import 'package:flutter/material.dart';
import 'package:trendy_app/service/products/products_model.dart';

class DetailsPageScreen extends StatelessWidget {
  const DetailsPageScreen({super.key, required this.product});

  final ProductsModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Details',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        )),
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
                  fit: BoxFit.cover,
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
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite_border_outlined))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                          '\$${product.price?.toStringAsFixed(2) ?? '0,00'}USD',
                          // '\$${product.price?.toStringAsFixed(2) ?? '0.00'} USD',
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
                        onPressed: () {},
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
              // Positioned(
              //   top: 20,
              //   left: 20,
              //   child: Container(
              //     width: 34, // IconButton-un ümumi ölçüsü
              //     height: 34,
              //     decoration: BoxDecoration(
              //       color: Color(0xFFDB3022),
              //       shape: BoxShape.circle,
              //     ),
              //     child: IconButton(
              //       onPressed: () {
              //         Navigator.pop(context);
              //       },
              //       icon: Icon(
              //         size: 20,
              //         color: Colors.white,
              //         Icons.chevron_left_outlined,
              //       ),
              //       // style: ButtonStyle(
              //       //   backgroundColor:
              //       //       WidgetStateProperty.all(Color(0x50DB3022)),
              //       // ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
