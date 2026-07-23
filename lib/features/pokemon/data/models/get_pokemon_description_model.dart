import '../../domain/entities/entities.dart';

class GetPokemonDescriptionModel {
  const GetPokemonDescriptionModel({required this.description});

  final String description;

  factory GetPokemonDescriptionModel.fromJson(Map<String, dynamic> json) {
    final entries = json['flavor_text_entries'] as List<dynamic>;
    final englishEntries = entries.where((entry) {
      final language = (entry as Map<String, dynamic>)['language'] as Map<String, dynamic>;
      return language['name'] == 'en';
    });

    if (englishEntries.isEmpty) {
      return const GetPokemonDescriptionModel(description: '');
    }

    final flavorText = (englishEntries.last as Map<String, dynamic>)['flavor_text'] as String;

    return GetPokemonDescriptionModel(description: _cleanFlavorText(flavorText));
  }
}

String _cleanFlavorText(String flavorText) {
  return flavorText.replaceAll('\n', ' ').replaceAll('\f', ' ').replaceAll(RegExp(r'\s+'), ' ').trim();
}

extension GetPokemonDescriptionModelX on GetPokemonDescriptionModel {
  PokemonDescriptionEntity toEntity() {
    return PokemonDescriptionEntity(description: description);
  }
}
