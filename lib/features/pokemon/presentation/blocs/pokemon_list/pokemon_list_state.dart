part of 'pokemon_list_bloc.dart';

enum PokemonListStatus {
  onInitial,
  isLoading,
  isLoadingMore,
  onSuccess,
  onRefreshing,
  onFailure,
  onFailureMore,
}

enum PokemonListSortType {
  number,
  name,
}

class PokemonListState extends Equatable {
  const PokemonListState({
    this.status = PokemonListStatus.onInitial,
    this.pokemonList = const [],
    this.failureMessage,
    this.hasReachedMax = false,
    this.sortType = PokemonListSortType.number,
    this.searchQuery = '',
  });

  final PokemonListStatus status;
  final List<PokemonListEntity> pokemonList;
  final String? failureMessage;
  final bool hasReachedMax;
  final PokemonListSortType sortType;
  final String searchQuery;

  bool get isSearching => searchQuery.isNotEmpty;

  List<PokemonListEntity> get sortedPokemonList {
    final sorted = List<PokemonListEntity>.from(pokemonList);

    switch (sortType) {
      case PokemonListSortType.number:
        sorted.sort((a, b) => a.id.compareTo(b.id));
      case PokemonListSortType.name:
        sorted.sort((a, b) => a.name.compareTo(b.name));
    }

    return sorted;
  }

  List<PokemonListEntity> get filteredPokemonList {
    if (searchQuery.isEmpty) {
      return sortedPokemonList;
    }

    final query = searchQuery.toLowerCase();

    return sortedPokemonList.where((pokemon) {
      return pokemon.name.toLowerCase().contains(query) ||
          pokemon.id.toString().contains(query);
    }).toList();
  }

  PokemonListState copyWith({
    PokemonListStatus? status,
    List<PokemonListEntity>? pokemonList,
    String? failureMessage,
    bool? hasReachedMax,
    PokemonListSortType? sortType,
    String? searchQuery,
    bool clearFailureMessage = false,
  }) {
    return PokemonListState(
      status: status ?? this.status,
      pokemonList: pokemonList ?? this.pokemonList,
      failureMessage: clearFailureMessage ? null : failureMessage ?? this.failureMessage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      sortType: sortType ?? this.sortType,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [status, pokemonList, failureMessage, hasReachedMax, sortType, searchQuery];
}
