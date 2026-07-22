import 'package:go_router/go_router.dart';

import '../../ui/ui.dart';
import 'route_paths.dart';

class AppRouter {
  AppRouter();

  late final GoRouter router = GoRouter(
    initialLocation: RoutePaths.pokemonList.path,
    routes: [
      GoRoute(
        path: RoutePaths.pokemonList.path,
        name: RoutePaths.pokemonList.name,
        builder: (context, state) => PokemonListPage(),
      ),
      GoRoute(
        path: RoutePaths.pokemonDetail.path,
        name: RoutePaths.pokemonDetail.name,
        builder: (context, state) => PokemonDetailPage(),
      ),
    ],
  );
}
