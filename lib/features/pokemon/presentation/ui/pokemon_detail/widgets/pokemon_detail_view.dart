import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/core.dart';
import '../../../../domain/domain.dart';
import 'pokemon_detail_content_card.dart';
import 'pokemon_detail_header.dart';

class PokemonDetailView extends StatelessWidget {
  const PokemonDetailView({super.key, required this.pokemon});

  final PokemonDetailEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: pokemon.background,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              PokemonDetailHeader(pokemon: pokemon),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: PokemonDetailContentCard(pokemon: pokemon),
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.paddingOf(context).top + 72,
            left: 24,
            right: 24,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (pokemon.id != 1)
                    ? IconButton(
                        onPressed: (pokemon.id > 1)
                            ? () => context.replaceNamed(
                                RoutePaths.pokemonDetail.name,
                                pathParameters: {'id': '${pokemon.id - 1}'},
                              )
                            : null,
                        icon: const Icon(Icons.chevron_left_rounded, color: Colors.white, size: 28),
                      )
                    : SizedBox(width: 24),
                Expanded(
                  child: Center(
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: CachedNetworkImage(
                        imageUrl: pokemon.imageUrl,
                        fit: BoxFit.contain,
                        placeholder: (context, url) => const Center(
                          child: SizedBox(
                            width: 32,
                            height: 32,
                            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.image_not_supported_outlined, size: 64, color: Colors.white70),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () =>
                      context.replaceNamed(RoutePaths.pokemonDetail.name, pathParameters: {'id': '${pokemon.id + 1}'}),
                  icon: const Icon(Icons.chevron_right_rounded, color: Colors.white, size: 28),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
