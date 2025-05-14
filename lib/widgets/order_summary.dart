import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderSummary extends ConsumerWidget {
  const OrderSummary(this.isExpanded, this.onArrowPressed, {super.key});

  final bool isExpanded;
  final VoidCallback onArrowPressed;

  @override
  Widget build(BuildContext context, ref) {
    return AnimatedContainer(
      height: isExpanded ? 150 : 300,
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width - 40.0,
      decoration: BoxDecoration(
        // color: const Color.fromARGB(255, 173, 202, 226),
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Summary',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 20),
              ),
              IconButton(
                  onPressed: onArrowPressed,
                  icon: Icon(Icons.keyboard_arrow_down))
            ],
          ),
          Divider(
            color: Colors.grey.shade300,
            thickness: 1,
            height: 24,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Price',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    '0 Usd',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(width: 50),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      )),
                  child: Text(
                    'Confirm Cart',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
