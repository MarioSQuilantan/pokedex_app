import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/core.dart';
import '../../../../domain/domain.dart';
import '../../../blocs/blocs.dart';
import 'pokemon_card.dart';

class PokemonListView extends StatelessWidget {
  const PokemonListView({
    super.key,
    required this.pokemonList,
    required this.status,
    this.isSearching = false,
    this.onRefresh,
    this.onLoadMore,
  });

  final List<PokemonListEntity> pokemonList;
  final PokemonListStatus status;
  final bool isSearching;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoadMore;

  @override
  Widget build(BuildContext context) {
    if (pokemonList.isEmpty) {
      return RefreshIndicator(
        onRefresh: () async => onRefresh?.call(),
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.4,
              child: Center(
                child: Text(
                  isSearching ? 'No Pokémon found' : 'Pokémon list not available',
                  style: context.bodyBase.copyWith(color: Colors.black54),
                ).responsive(),
              ),
            ),
          ],
        ),
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels >= notification.metrics.maxScrollExtent - 200) {
          onLoadMore?.call();
        }
        return false;
      },
      child: RefreshIndicator(
        onRefresh: () async => onRefresh?.call(),
        child: GridView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.72,
          ),
          itemCount: pokemonList.length + (status == PokemonListStatus.isLoadingMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index >= pokemonList.length) {
              return const Center(
                child: Padding(padding: EdgeInsets.all(8), child: CircularProgressIndicator(strokeWidth: 2)),
              );
            }

            final pokemon = pokemonList[index];

            return PokemonCard(
              name: pokemon.name.capitalize(),
              image: pokemon.imagePath,
              id: pokemon.id.toString(),
              onTap: () => context.pushNamed(RoutePaths.pokemonDetail.name, pathParameters: {'id': '${pokemon.id}'}),
            );
          },
        ),
      ),
    );
  }
}
