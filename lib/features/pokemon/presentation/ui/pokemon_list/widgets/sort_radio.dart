import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';

class SortRadio extends StatelessWidget {
  const SortRadio({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: BaseColors.pokedexRed, width: 2),
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: BaseColors.pokedexRed,
                ),
              ),
            )
          : null,
    );
  }
}
