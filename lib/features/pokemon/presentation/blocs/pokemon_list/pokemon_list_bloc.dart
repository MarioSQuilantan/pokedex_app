import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/requests/requests.dart';
import '../../../domain/domain.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

@Injectable()
class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  PokemonListBloc(this._getPokemonListUseCase) : super(const PokemonListState()) {
    on<PokemonListStarted>(_onStarted);
    on<PokemonListLoadMoreRequested>(_onLoadMoreRequested);
    on<PokemonListRefreshed>(_onRefreshed);
    on<PokemonListSortChanged>(_onSortChanged);
  }

  final GetPokemonListUseCase _getPokemonListUseCase;

  static const _pageSize = 20;

  Future<void> _onStarted(
    PokemonListStarted event,
    Emitter<PokemonListState> emit,
  ) async {
    emit(
      state.copyWith(
        status: PokemonListStatus.isLoading,
        clearFailureMessage: true,
      ),
    );

    final result = await _getPokemonListUseCase(
      const GetPokemonListRequest(offset: 0, limit: _pageSize),
    ).run();

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: PokemonListStatus.onFailure,
          failureMessage: failure.message,
        ),
      ),
      (pokemonList) => emit(
        state.copyWith(
          status: PokemonListStatus.onSuccess,
          pokemonList: pokemonList,
          hasReachedMax: pokemonList.length < _pageSize,
          clearFailureMessage: true,
        ),
      ),
    );
  }

  Future<void> _onLoadMoreRequested(
    PokemonListLoadMoreRequested event,
    Emitter<PokemonListState> emit,
  ) async {
    if (state.hasReachedMax || state.status == PokemonListStatus.isLoadingMore) {
      return;
    }

    emit(state.copyWith(status: PokemonListStatus.isLoadingMore));

    final result = await _getPokemonListUseCase(
      GetPokemonListRequest(
        offset: state.pokemonList.length,
        limit: _pageSize,
      ),
    ).run();

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: PokemonListStatus.onFailureMore,
          failureMessage: failure.message,
        ),
      ),
      (newPokemonList) => emit(
        state.copyWith(
          status: PokemonListStatus.onSuccess,
          pokemonList: [...state.pokemonList, ...newPokemonList],
          hasReachedMax: newPokemonList.length < _pageSize,
          clearFailureMessage: true,
        ),
      ),
    );
  }

  Future<void> _onRefreshed(
    PokemonListRefreshed event,
    Emitter<PokemonListState> emit,
  ) async {
    emit(
      state.copyWith(
        status: PokemonListStatus.onRefreshing,
        clearFailureMessage: true,
      ),
    );

    final result = await _getPokemonListUseCase(
      const GetPokemonListRequest(offset: 0, limit: _pageSize),
    ).run();

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: PokemonListStatus.onFailure,
          failureMessage: failure.message,
        ),
      ),
      (pokemonList) => emit(
        state.copyWith(
          status: PokemonListStatus.onSuccess,
          pokemonList: pokemonList,
          hasReachedMax: pokemonList.length < _pageSize,
          clearFailureMessage: true,
        ),
      ),
    );
  }

  void _onSortChanged(
    PokemonListSortChanged event,
    Emitter<PokemonListState> emit,
  ) {
    emit(state.copyWith(sortType: event.sortType));
  }
}
