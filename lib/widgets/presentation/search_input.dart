import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trendy_app/providers/search_provider.dart';

class SearchInput extends ConsumerWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      children: [
        Expanded(
            child: TextFormField(
          onChanged: (value) {
            ref.read(searchProvider.notifier).state = value;
          },
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search for products',
              hintStyle: const TextStyle(
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
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.png'),
            )),
      ],
    );
  }
}
