import 'package:go_router/go_router.dart';

import '../../features/features.dart';
import 'route_paths.dart';
import 'route_transition_page.dart';

class AppRouter {
  AppRouter();

  late final GoRouter router = GoRouter(
    initialLocation: RoutePaths.pokemonList.path,
    routes: [
      GoRoute(
        path: RoutePaths.pokemonList.path,
        name: RoutePaths.pokemonList.name,
        pageBuilder: (context, state) =>
            buildRouteTransitionPage(state: state, transition: AppRouteTransition.slideOut, child: PokemonListPage()),
      ),
      GoRoute(
        path: RoutePaths.pokemonDetail.path,
        name: RoutePaths.pokemonDetail.name,
        pageBuilder: (context, state) {
          final id = num.parse(state.pathParameters['id']!);

          return buildRouteTransitionPage(
            state: state,
            transition: AppRouteTransition.slideIn,
            child: PokemonDetailPage(id: id),
          );
        },
      ),
    ],
  );
}
