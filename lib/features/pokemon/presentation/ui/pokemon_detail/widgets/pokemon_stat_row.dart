import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';

class PokemonStatRow extends StatelessWidget {
  const PokemonStatRow({
    super.key,
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final num value;
  final Color color;

  static const _maxStat = 255;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Text(
              label,
              style: context.subtitle.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ).responsive(),
          ),
          Container(
            width: 1,
            height: 16,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            color: Colors.grey.shade300,
          ),
          SizedBox(
            width: 36,
            child: Text(
              value.toInt().toString().padLeft(3, '0'),
              style: context.subtitle.copyWith(fontWeight: FontWeight.w500),
            ).responsive(),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: LinearProgressIndicator(
                value: value / _maxStat,
                minHeight: 6,
                backgroundColor: color.withValues(alpha: 0.2),
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
