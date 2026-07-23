enum RoutePaths {
  pokemonList('/pokemon-list', 'pokemon-list'),
  pokemonDetail('/pokemon-detail/:id', 'pokemon-detail');

  final String path;
  final String name;

  const RoutePaths(this.path, this.name);
}
