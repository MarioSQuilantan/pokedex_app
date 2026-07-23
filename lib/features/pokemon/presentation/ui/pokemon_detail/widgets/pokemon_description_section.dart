import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/core.dart';
import '../../../blocs/blocs.dart';

class PokemonDescriptionSection extends StatelessWidget {
  const PokemonDescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDescriptionBloc, PokemonDescriptionState>(
      builder: (context, state) {
        return switch (state) {
          PokemonDescriptionInitial() || PokemonDescriptionLoading() => const Padding(
            padding: EdgeInsets.only(top: 24),
            child: SizedBox(
              height: 48,
              child: Center(child: SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2))),
            ),
          ),
          PokemonDescriptionFailure(:final message, :final pokemonId) => Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Column(
              children: [
                Text(
                  message,
                  textAlign: TextAlign.center,
                  maxLines: 4,
                  style: context.bodyBase.copyWith(color: Colors.black54),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () => context.read<PokemonDescriptionBloc>().add(PokemonDescriptionInit(pokemonId)),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
          PokemonDescriptionSuccess(:final description) when description.isEmpty => const SizedBox.shrink(),
          PokemonDescriptionSuccess(:final description) => Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Text(
              description,
              textAlign: TextAlign.start,
              maxLines: 3,
              style: context.bodyBase.copyWith(color: Colors.black87, height: 1.5),
            ).responsive(),
          ),
        };
      },
    );
  }
}
