import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';

import '../../data/requests/requests.dart';
import '../entities/entities.dart';
import '../repository/repository.dart';

@Injectable()
class GetPokemonListUseCase {
  GetPokemonListUseCase(this._repository);

  final PokemonRepository _repository;

  TaskEither<Failure, List<PokemonListEntity>> call(
    GetPokemonListRequest request,
  ) {
    return _repository.getPokemonList(request);
  }
}
