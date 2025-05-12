import 'package:flutter/material.dart';

class QuantityButton extends StatefulWidget {
  const QuantityButton({super.key});

  @override
  State<QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  int quantity = 1;

  void _decrement() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  void _increment() {
    setState(() {
      quantity++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(6)),
            child: IconButton(
              onPressed: _decrement,
              icon: Icon(Icons.remove),
              iconSize: 18,
              padding: EdgeInsets.zero,
              splashRadius: 20,
            )),
        const SizedBox(width: 8),
        Text(quantity.toString(), style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(width: 8),
        Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(6)),
            child: IconButton(
              onPressed: _increment,
              icon: Icon(Icons.add),
              iconSize: 18,
              padding: EdgeInsets.zero,
              splashRadius: 20,
            )),
      ],
    );
  }
}
