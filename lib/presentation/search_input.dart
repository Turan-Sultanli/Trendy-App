import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextFormField(
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search for products',
              hintStyle: TextStyle(
                color: Color(0xFF808080),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              )),
        )),
        const SizedBox(width: 20),
        InkWell(
            onTap: () {},
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.png'),
            )),
      ],
    );
  }
}
