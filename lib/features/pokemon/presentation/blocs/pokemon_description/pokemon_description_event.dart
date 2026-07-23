part of 'pokemon_description_bloc.dart';

sealed class PokemonDescriptionEvent extends Equatable {
  const PokemonDescriptionEvent();

  @override
  List<Object> get props => [];
}

final class PokemonDescriptionInit extends PokemonDescriptionEvent {
  const PokemonDescriptionInit(this.id);

  final num id;

  @override
  List<Object> get props => [id];
}
