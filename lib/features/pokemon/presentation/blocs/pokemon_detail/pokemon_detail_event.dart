part of 'pokemon_detail_bloc.dart';

sealed class PokemonDetailEvent extends Equatable {
  const PokemonDetailEvent();

  @override
  List<Object> get props => [];
}

final class PokemonDetailInit extends PokemonDetailEvent {
  const PokemonDetailInit(this.id);

  final num id;

  @override
  List<Object> get props => [id];
}
