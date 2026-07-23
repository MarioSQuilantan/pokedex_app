import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';

import '../../data/requests/requests.dart';
import '../entities/entities.dart';
import '../repository/repository.dart';

@Injectable()
class GetPokemonDetailsUseCase {
  GetPokemonDetailsUseCase(this._repository);

  final PokemonRepository _repository;

  TaskEither<Failure, PokemonDetailEntity> call(
    GetPokemonDetailsRequest request,
  ) {
    return _repository.getPokemonDetails(request);
  }
}
