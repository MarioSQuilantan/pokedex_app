import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/requests/requests.dart';
import '../../../domain/domain.dart';

part 'pokemon_description_event.dart';
part 'pokemon_description_state.dart';

@Injectable()
class PokemonDescriptionBloc extends Bloc<PokemonDescriptionEvent, PokemonDescriptionState> {
  PokemonDescriptionBloc(this._getPokemonDescriptionUseCase) : super(const PokemonDescriptionInitial()) {
    on<PokemonDescriptionInit>(onInit);
  }

  final GetPokemonDescriptionUseCase _getPokemonDescriptionUseCase;

  Future<void> onInit(
    PokemonDescriptionInit event,
    Emitter<PokemonDescriptionState> emit,
  ) async {
    emit(PokemonDescriptionLoading(pokemonId: event.id));

    final result = await _getPokemonDescriptionUseCase(
      GetPokemonDescriptionRequest(id: event.id),
    ).run();

    result.fold(
      (failure) => emit(
        PokemonDescriptionFailure(
          message: failure.message,
          pokemonId: event.id,
        ),
      ),
      (description) => emit(
        PokemonDescriptionSuccess(description: description.description),
      ),
    );
  }
}
