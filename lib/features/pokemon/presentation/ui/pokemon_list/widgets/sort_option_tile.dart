import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';
import 'sort_radio.dart';

class SortOptionTile extends StatelessWidget {
  const SortOptionTile({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            SortRadio(isSelected: isSelected),
            const SizedBox(width: 12),
            Text(
              label,
              style: context.bodyBase.copyWith(fontWeight: FontWeight.w500),
            ).responsive(),
          ],
        ),
      ),
    );
  }
}
