part of 'pokemon_detail_bloc.dart';

sealed class PokemonDetailState extends Equatable {
  const PokemonDetailState();

  @override
  List<Object?> get props => [];
}

final class PokemonDetailInitial extends PokemonDetailState {
  const PokemonDetailInitial();
}

final class PokemonDetailLoading extends PokemonDetailState {
  const PokemonDetailLoading({required this.pokemonId});

  final num pokemonId;

  @override
  List<Object> get props => [pokemonId];
}

final class PokemonDetailSuccess extends PokemonDetailState {
  const PokemonDetailSuccess({required this.pokemon});

  final PokemonDetailEntity pokemon;

  @override
  List<Object> get props => [pokemon];
}

final class PokemonDetailFailure extends PokemonDetailState {
  const PokemonDetailFailure({
    required this.message,
    required this.pokemonId,
  });

  final String message;
  final num pokemonId;

  @override
  List<Object> get props => [message, pokemonId];
}
