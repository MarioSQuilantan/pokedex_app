import 'package:flutter/material.dart';

import 'pokemon_detail_types_entity.dart';

class PokemonDetailEntity {
  const PokemonDetailEntity({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.imageUrl,
    required this.background,
    required this.types,
    required this.abilities,
    required this.baseExperience,
    required this.stats,
  });

  final num id;
  final String name;
  final num height;
  final num weight;
  final String imageUrl;
  final Color background;
  final List<PokemonDetailTypesEntity> types;
  final List<String> abilities;
  final num baseExperience;
  final List<num> stats;
}
