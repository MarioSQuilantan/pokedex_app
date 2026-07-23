part of 'pokemon_description_bloc.dart';

sealed class PokemonDescriptionState extends Equatable {
  const PokemonDescriptionState();

  @override
  List<Object?> get props => [];
}

final class PokemonDescriptionInitial extends PokemonDescriptionState {
  const PokemonDescriptionInitial();
}

final class PokemonDescriptionLoading extends PokemonDescriptionState {
  const PokemonDescriptionLoading({required this.pokemonId});

  final num pokemonId;

  @override
  List<Object> get props => [pokemonId];
}

final class PokemonDescriptionSuccess extends PokemonDescriptionState {
  const PokemonDescriptionSuccess({required this.description});

  final String description;

  @override
  List<Object> get props => [description];
}

final class PokemonDescriptionFailure extends PokemonDescriptionState {
  const PokemonDescriptionFailure({
    required this.message,
    required this.pokemonId,
  });

  final String message;
  final num pokemonId;

  @override
  List<Object> get props => [message, pokemonId];
}
