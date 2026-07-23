import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../../core/services/services.dart';

import '../models/models.dart';
import '../requests/requests.dart';
import 'pokemon_datasource.dart';

@Injectable(as: PokemonDatasource)
class PokemonDatasourceImpl implements PokemonDatasource {
  PokemonDatasourceImpl(this._networkService);

  final NetworkService _networkService;

  @override
  TaskEither<Failure, GetPokemonListModel> getPokemonList(GetPokemonListRequest request) {
    return _networkService
        .get<Map<String, dynamic>>(
          UrlPaths.pokemon,
          queryParameters: {'offset': request.offset, 'limit': request.limit},
        )
        .map(GetPokemonListModel.fromJson);
  }

  @override
  TaskEither<Failure, GetPokemonDetailsModel> getPokemonDetails(
    GetPokemonDetailsRequest request,
  ) {
    return _networkService
        .get<Map<String, dynamic>>('${UrlPaths.pokemon}/${request.id}')
        .map(GetPokemonDetailsModel.fromJson);
  }
}
