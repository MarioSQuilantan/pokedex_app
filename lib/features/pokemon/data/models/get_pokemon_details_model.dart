import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';

class GetPokemonDetailsModel {
  const GetPokemonDetailsModel({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.imageUrl,
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
  final List<GetPokemonDetailsTypeModel> types;
  final List<String> abilities;
  final num baseExperience;
  final List<num> stats;

  factory GetPokemonDetailsModel.fromJson(Map<String, dynamic> json) {
    final sprites = json['sprites'] as Map<String, dynamic>?;
    final other = sprites?['other'] as Map<String, dynamic>?;
    final officialArtwork = other?['official-artwork'] as Map<String, dynamic>?;
    final imageUrl = (officialArtwork?['front_default'] ??
            sprites?['front_default'] ??
            '') as String;

    return GetPokemonDetailsModel(
      id: json['id'] as num,
      name: json['name'] as String,
      height: json['height'] as num,
      weight: json['weight'] as num,
      imageUrl: imageUrl,
      types: (json['types'] as List<dynamic>)
          .map(
            (type) => GetPokemonDetailsTypeModel.fromJson(
              type as Map<String, dynamic>,
            ),
          )
          .toList(),
      abilities: (json['abilities'] as List<dynamic>)
          .map(
            (ability) =>
                ((ability as Map<String, dynamic>)['ability']
                    as Map<String, dynamic>)['name'] as String,
          )
          .toList(),
      baseExperience: json['base_experience'] as num,
      stats: (json['stats'] as List<dynamic>)
          .map(
            (stat) => (stat as Map<String, dynamic>)['base_stat'] as num,
          )
          .toList(),
    );
  }
}

class GetPokemonDetailsTypeModel {
  const GetPokemonDetailsTypeModel({
    required this.name,
    required this.slot,
  });

  final String name;
  final num slot;

  factory GetPokemonDetailsTypeModel.fromJson(Map<String, dynamic> json) {
    final type = json['type'] as Map<String, dynamic>;

    return GetPokemonDetailsTypeModel(
      name: type['name'] as String,
      slot: json['slot'] as num,
    );
  }
}

extension GetPokemonDetailsModelX on GetPokemonDetailsModel {
  PokemonDetailEntity toEntity() {
    final sortedTypes = [...types]..sort((a, b) => a.slot.compareTo(b.slot));
    final primaryType = sortedTypes.isNotEmpty ? sortedTypes.first.name : '';

    return PokemonDetailEntity(
      id: id,
      name: name,
      height: height,
      weight: weight,
      imageUrl: imageUrl,
      background: _typeBackgroundColor(primaryType),
      types: types.map((type) => type.toEntity()).toList(),
      abilities: abilities,
      baseExperience: baseExperience,
      stats: stats,
    );
  }
}

extension GetPokemonDetailsTypeModelX on GetPokemonDetailsTypeModel {
  PokemonDetailTypesEntity toEntity() {
    return PokemonDetailTypesEntity(name: name, slot: slot);
  }
}

Color _typeBackgroundColor(String typeName) {
  const typeColors = <String, Color>{
    'normal': Color(0xFFA8A878),
    'fire': Color(0xFFF08030),
    'water': Color(0xFF6890F0),
    'electric': Color(0xFFF8D030),
    'grass': Color(0xFF78C850),
    'ice': Color(0xFF98D8D8),
    'fighting': Color(0xFFC03028),
    'poison': Color(0xFFA040A0),
    'ground': Color(0xFFE0C068),
    'flying': Color(0xFFA890F0),
    'psychic': Color(0xFFF85888),
    'bug': Color(0xFFA8B820),
    'rock': Color(0xFFB8A038),
    'ghost': Color(0xFF705898),
    'dragon': Color(0xFF7038F8),
    'dark': Color(0xFF705848),
    'steel': Color(0xFFB8B8D0),
    'fairy': Color(0xFFEE99AC),
  };

  return typeColors[typeName] ?? const Color(0xFF68A090);
}
