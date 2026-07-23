import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';
import '../../../../domain/domain.dart';
import '../../../extensions/extensions.dart';
import 'pokemon_about_item.dart';
import 'pokemon_section_title.dart';
import 'pokemon_stat_row.dart';
import 'pokemon_type_chip.dart';

class PokemonDetailContentCard extends StatelessWidget {
  const PokemonDetailContentCard({super.key, required this.pokemon});

  final PokemonDetailEntity pokemon;

  static const _statLabels = ['HP', 'ATK', 'DEF', 'SATK', 'SDEF', 'SPD'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 112, 24, 32),
        child: Column(
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                for (final type in pokemon.types)
                  PokemonTypeChip(type: type.name),
              ],
            ),
            const SizedBox(height: 32),
            PokemonSectionTitle(title: 'About', color: pokemon.background),
            const SizedBox(height: 24),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: PokemonAboutItem(
                      icon: Icons.scale_outlined,
                      label: 'Weight',
                      value: pokemon.weight.formatWeight(),
                    ),
                  ),
                  VerticalDivider(color: Colors.grey.shade300, thickness: 1),
                  Expanded(
                    child: PokemonAboutItem(
                      icon: Icons.height_outlined,
                      label: 'Height',
                      value: pokemon.height.formatHeight(),
                    ),
                  ),
                  VerticalDivider(color: Colors.grey.shade300, thickness: 1),
                  Expanded(
                    child: PokemonAboutItem(
                      label: 'Moves',
                      value: pokemon.abilities
                          .map((ability) => ability.capitalize())
                          .join('\n'),
                      alignStart: true,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            PokemonSectionTitle(title: 'Base Stats', color: pokemon.background),
            const SizedBox(height: 16),
            for (var index = 0; index < _statLabels.length; index++)
              if (index < pokemon.stats.length)
                PokemonStatRow(
                  label: _statLabels[index],
                  value: pokemon.stats[index],
                  color: pokemon.background,
                ),
          ],
        ),
      ),
    );
  }
}
