import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width - 40.0,
      height: 220,
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Summary',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.keyboard_arrow_down))
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
                children: [
                  Text('Subtotal'),
                  Text('1 item'),
                ],
              ),
              Text('22 USD')
            ],
          ),
          ElevatedButton(onPressed: () {}, child: Text('Checkout'))
        ],
      ),
    );
  }
}
