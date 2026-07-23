import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';

import '../../data/requests/requests.dart';
import '../entities/entities.dart';
import '../repository/repository.dart';

@Injectable()
class GetPokemonDescriptionUseCase {
  GetPokemonDescriptionUseCase(this._repository);

  final PokemonRepository _repository;

  TaskEither<Failure, PokemonDescriptionEntity> call(
    GetPokemonDescriptionRequest request,
  ) {
    return _repository.getPokemonDescription(request);
  }
}
