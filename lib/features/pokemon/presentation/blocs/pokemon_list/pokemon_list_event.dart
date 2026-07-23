part of 'pokemon_list_bloc.dart';

sealed class PokemonListEvent extends Equatable {
  const PokemonListEvent();

  @override
  List<Object> get props => [];
}

final class PokemonListInit extends PokemonListEvent {
  const PokemonListInit();
}

final class PokemonListLoadMoreRequested extends PokemonListEvent {
  const PokemonListLoadMoreRequested();
}

final class PokemonListRefreshed extends PokemonListEvent {
  const PokemonListRefreshed();
}

final class PokemonListSortChanged extends PokemonListEvent {
  const PokemonListSortChanged(this.sortType);

  final PokemonListSortType sortType;

  @override
  List<Object> get props => [sortType];
}

final class PokemonListSearchChanged extends PokemonListEvent {
  const PokemonListSearchChanged(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}
