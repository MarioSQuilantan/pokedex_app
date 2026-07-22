import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';
import '../../../blocs/blocs.dart';
import 'sort_option_tile.dart';

class SortPokemonMenu extends StatelessWidget {
  const SortPokemonMenu({super.key, required this.selectedSort, required this.onSortSelected});

  final PokemonListSortType selectedSort;
  final ValueChanged<PokemonListSortType> onSortSelected;

  static Future<void> show(
    BuildContext context, {
    required PokemonListSortType selectedSort,
    required ValueChanged<PokemonListSortType> onSortSelected,
  }) async {
    final renderBox = context.findRenderObject()! as RenderBox;
    final overlay = Overlay.of(context).context.findRenderObject()! as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero, ancestor: overlay);

    await showDialog<void>(
      context: context,
      barrierColor: Colors.transparent,
      builder: (dialogContext) {
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: () => Navigator.pop(dialogContext),
                behavior: HitTestBehavior.opaque,
                child: const SizedBox.expand(),
              ),
            ),
            Positioned(
              top: position.dy + renderBox.size.height + 8,
              right: overlay.size.width - position.dx - renderBox.size.width,
              child: SortPokemonMenu(
                selectedSort: selectedSort,
                onSortSelected: (sort) {
                  onSortSelected(sort);
                  Navigator.pop(dialogContext);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 220,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: BaseColors.pokedexRed, borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Sort by:',
              textAlign: TextAlign.center,
              style: context.h5.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
            ).responsive(),
            const SizedBox(height: 12),
            Material(
              elevation: 4,
              shadowColor: Colors.black26,
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    SortOptionTile(
                      label: 'Number',
                      isSelected: selectedSort == PokemonListSortType.number,
                      onTap: () => onSortSelected(PokemonListSortType.number),
                    ),
                    SortOptionTile(
                      label: 'Name',
                      isSelected: selectedSort == PokemonListSortType.name,
                      onTap: () => onSortSelected(PokemonListSortType.name),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
