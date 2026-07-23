import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';

import '../../domain/entities/entities.dart';
import '../../domain/repository/repository.dart';
import '../datasource/datasource.dart';
import '../models/models.dart';
import '../requests/requests.dart';

@Injectable(as: PokemonRepository)
class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl(this._datasource);

  final PokemonDatasource _datasource;

  @override
  TaskEither<Failure, List<PokemonListEntity>> getPokemonList(
    GetPokemonListRequest request,
  ) {
    return _datasource
        .getPokemonList(request)
        .map((GetPokemonListModel model) => model.toEntity());
  }

  @override
  TaskEither<Failure, PokemonDetailEntity> getPokemonDetails(
    GetPokemonDetailsRequest request,
  ) {
    return _datasource
        .getPokemonDetails(request)
        .map((GetPokemonDetailsModel model) => model.toEntity());
  }

  @override
  TaskEither<Failure, PokemonDescriptionEntity> getPokemonDescription(
    GetPokemonDescriptionRequest request,
  ) {
    return _datasource
        .getPokemonDescription(request)
        .map((GetPokemonDescriptionModel model) => model.toEntity());
  }
}
