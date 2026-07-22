part of 'pokemon_list_bloc.dart';

sealed class PokemonListEvent extends Equatable {
  const PokemonListEvent();

  @override
  List<Object> get props => [];
}

final class PokemonListStarted extends PokemonListEvent {
  const PokemonListStarted();
}

final class PokemonListLoadMoreRequested extends PokemonListEvent {
  const PokemonListLoadMoreRequested();
}

final class PokemonListRefreshed extends PokemonListEvent {
  const PokemonListRefreshed();
}
