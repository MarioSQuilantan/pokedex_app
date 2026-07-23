import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';

import '../models/models.dart';
import '../requests/requests.dart';

abstract class PokemonDatasource {
  TaskEither<Failure, GetPokemonListModel> getPokemonList(
    GetPokemonListRequest request,
  );

  TaskEither<Failure, GetPokemonDetailsModel> getPokemonDetails(
    GetPokemonDetailsRequest request,
  );

  TaskEither<Failure, GetPokemonDescriptionModel> getPokemonDescription(
    GetPokemonDescriptionRequest request,
  );
}
