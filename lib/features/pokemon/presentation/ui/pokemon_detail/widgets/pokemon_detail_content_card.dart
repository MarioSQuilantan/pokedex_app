import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';
import '../../../../domain/domain.dart';
import 'pokemon_about_item.dart';
import 'pokemon_description_section.dart';
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
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(24, 80, 24, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [for (final type in pokemon.types) PokemonTypeChip(type: type.name)],
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
                      icon: SvgPaths.weight,
                      label: 'Weight',
                      value: pokemon.weight.formatWeight(),
                    ),
                  ),
                  VerticalDivider(color: Colors.grey.shade300, thickness: 1),
                  Expanded(
                    child: PokemonAboutItem(
                      icon: SvgPaths.height,
                      label: 'Height',
                      value: pokemon.height.formatHeight(),
                    ),
                  ),
                  VerticalDivider(color: Colors.grey.shade300, thickness: 1),
                  Expanded(
                    child: PokemonAboutItem(
                      label: 'Moves',
                      value: pokemon.abilities.map((ability) => ability.capitalize()).join('\n'),
                      alignStart: true,
                    ),
                  ),
                ],
              ),
            ),
            const PokemonDescriptionSection(),
            const SizedBox(height: 32),
            PokemonSectionTitle(title: 'Base Stats', color: pokemon.background),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: pokemon.stats.length.clamp(0, _statLabels.length),
              itemBuilder: (context, index) {
                return PokemonStatRow(
                  label: _statLabels[index],
                  value: pokemon.stats[index],
                  color: pokemon.background,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
