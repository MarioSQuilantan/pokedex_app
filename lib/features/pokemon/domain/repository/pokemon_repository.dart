import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';

import '../../data/requests/requests.dart';
import '../entities/entities.dart';

abstract class PokemonRepository {
  TaskEither<Failure, List<PokemonListEntity>> getPokemonList(
    GetPokemonListRequest request,
  );

  TaskEither<Failure, PokemonDetailEntity> getPokemonDetails(
    GetPokemonDetailsRequest request,
  );
}
