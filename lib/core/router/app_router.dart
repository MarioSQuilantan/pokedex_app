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
          final transition = state.extra is AppRouteTransition
              ? state.extra! as AppRouteTransition
              : AppRouteTransition.slideIn;

          return buildRouteTransitionPage(
            state: state,
            transition: transition,
            slideOutAsUnderlay: transition != AppRouteTransition.slideOut,
            child: PokemonDetailPage(id: id),
          );
        },
      ),
    ],
  );
}
