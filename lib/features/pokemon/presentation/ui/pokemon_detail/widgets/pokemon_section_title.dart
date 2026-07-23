import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';

class PokemonSectionTitle extends StatelessWidget {
  const PokemonSectionTitle({
    super.key,
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade300, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: context.bodyBase.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ).responsive(),
        ),
        Expanded(child: Divider(color: Colors.grey.shade300, thickness: 1)),
      ],
    );
  }
}
