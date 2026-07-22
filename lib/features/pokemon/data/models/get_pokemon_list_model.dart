import '../../domain/entities/entities.dart';

class GetPokemonListModel {
  const GetPokemonListModel({required this.count, required this.next, required this.previous, required this.results});

  final int count;
  final String? next;
  final String? previous;
  final List<GetPokemonListResultModel> results;

  factory GetPokemonListModel.fromJson(Map<String, dynamic> json) {
    return GetPokemonListModel(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((result) => GetPokemonListResultModel.fromJson(result as Map<String, dynamic>))
          .toList(),
    );
  }
}

class GetPokemonListResultModel {
  const GetPokemonListResultModel({required this.name, required this.url});

  final String name;
  final String url;

  factory GetPokemonListResultModel.fromJson(Map<String, dynamic> json) {
    return GetPokemonListResultModel(name: json['name'] as String, url: json['url'] as String);
  }
}

extension GetPokemonListModelX on GetPokemonListModel {
  List<PokemonListEntity> toEntity() {
    return results.map((result) => result.toEntity()).toList();
  }
}

extension GetPokemonListResultModelX on GetPokemonListResultModel {
  PokemonListEntity toEntity() {
    final uri = Uri.parse(url);
    final id = int.tryParse(uri.pathSegments[uri.pathSegments.length - 2]) ?? 0;
    final imagePath =
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
    return PokemonListEntity(name: name, imagePath: imagePath, id: id);
  }
}
