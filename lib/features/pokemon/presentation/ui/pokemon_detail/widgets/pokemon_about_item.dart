import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';

class PokemonAboutItem extends StatelessWidget {
  const PokemonAboutItem({
    super.key,
    required this.label,
    required this.value,
    this.icon,
    this.alignStart = false,
  });

  final String label;
  final String value;
  final IconData? icon;
  final bool alignStart;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
          alignStart ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 18, color: Colors.black87),
          const SizedBox(height: 4),
        ],
        Text(
          value,
          textAlign: TextAlign.center,
          style: context.subtitle.copyWith(fontWeight: FontWeight.w600),
        ).responsive(),
        const SizedBox(height: 4),
        Text(
          label,
          style: context.caption.copyWith(color: Colors.black45),
        ).responsive(),
      ],
    );
  }
}
