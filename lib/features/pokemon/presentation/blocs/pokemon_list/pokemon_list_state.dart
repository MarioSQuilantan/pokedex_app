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

class PokemonListState extends Equatable {
  const PokemonListState({
    this.status = PokemonListStatus.onInitial,
    this.pokemonList = const [],
    this.failureMessage,
    this.hasReachedMax = false,
  });

  final PokemonListStatus status;
  final List<PokemonListEntity> pokemonList;
  final String? failureMessage;
  final bool hasReachedMax;

  PokemonListState copyWith({
    PokemonListStatus? status,
    List<PokemonListEntity>? pokemonList,
    String? failureMessage,
    bool? hasReachedMax,
    bool clearFailureMessage = false,
  }) {
    return PokemonListState(
      status: status ?? this.status,
      pokemonList: pokemonList ?? this.pokemonList,
      failureMessage: clearFailureMessage ? null : failureMessage ?? this.failureMessage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [status, pokemonList, failureMessage, hasReachedMax];
}
