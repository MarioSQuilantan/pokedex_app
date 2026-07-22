import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';
import '../../../blocs/blocs.dart';
import 'sort_pokemon_menu.dart';

class SortPokemonButton extends StatelessWidget {
  const SortPokemonButton({
    super.key,
    required this.selectedSort,
    required this.onSortSelected,
  });

  final PokemonListSortType selectedSort;
  final ValueChanged<PokemonListSortType> onSortSelected;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      elevation: 2,
      shadowColor: Colors.black26,
      child: InkWell(
        onTap: () => SortPokemonMenu.show(
          context,
          selectedSort: selectedSort,
          onSortSelected: onSortSelected,
        ),
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 48,
          height: 48,
          child: Center(
            child: Text(
              'A',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: BaseColors.pokedexRed,
                decoration: TextDecoration.underline,
                decorationColor: BaseColors.pokedexRed,
                decorationThickness: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
