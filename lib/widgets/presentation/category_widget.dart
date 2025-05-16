import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
  });

  final String icon;
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color:
                isSelected ? const Color(0xFFDB3022) : const Color(0x40DB3022),
            borderRadius: BorderRadius.circular(50),
          ),
          child: SvgPicture.asset(icon,
              colorFilter: ColorFilter.mode(
                  isSelected ? Colors.white : Colors.black, BlendMode.srcIn)),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: const Color(0xFF252525),
              fontWeight: FontWeight.w700,
              fontSize: 13),
        )
      ],
    );
  }
}
