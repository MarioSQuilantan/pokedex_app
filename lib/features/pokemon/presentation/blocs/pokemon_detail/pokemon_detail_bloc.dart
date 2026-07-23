import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/requests/requests.dart';
import '../../../domain/domain.dart';

part 'pokemon_detail_event.dart';
part 'pokemon_detail_state.dart';

@Injectable()
class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  PokemonDetailBloc(this._getPokemonDetailsUseCase) : super(const PokemonDetailInitial()) {
    on<PokemonDetailInit>(onInit);
  }

  final GetPokemonDetailsUseCase _getPokemonDetailsUseCase;

  Future<void> onInit(
    PokemonDetailInit event,
    Emitter<PokemonDetailState> emit,
  ) async {
    emit(PokemonDetailLoading(pokemonId: event.id));

    final result = await _getPokemonDetailsUseCase(
      GetPokemonDetailsRequest(id: event.id),
    ).run();

    result.fold(
      (failure) => emit(
        PokemonDetailFailure(
          message: failure.message,
          pokemonId: event.id,
        ),
      ),
      (pokemon) => emit(PokemonDetailSuccess(pokemon: pokemon)),
    );
  }
}
