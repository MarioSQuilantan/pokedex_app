import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/core.dart';
import '../../../../domain/domain.dart';

class PokemonDetailHeader extends StatelessWidget {
  const PokemonDetailHeader({super.key, required this.pokemon});

  final PokemonDetailEntity pokemon;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;

    return SizedBox(
      height: topPadding + 220,
      child: Stack(
        children: [
          Positioned(
            right: -20,
            top: topPadding + 16,
            child: Opacity(
              opacity: 0.15,
              child: SvgPicture.asset(
                SvgPaths.pokeBall,
                width: 180,
                height: 180,
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, topPadding + 8, 8, 0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                ),
                Expanded(
                  child: Text(
                    pokemon.name.capitalize(),
                    style: context.h4.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ).responsive(),
                ),
                Text(
                  '#${pokemon.id.toInt().toString().padLeft(3, '0')}',
                  style: context.subtitle.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ).responsive(),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
