import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../blocs/blocs.dart';
import 'widgets/widgets.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({super.key, required this.id});

  final num id;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          key: ValueKey('detail-$id'),
          create: (context) => di<PokemonDetailBloc>()..add(PokemonDetailInit(id)),
        ),
        BlocProvider(
          key: ValueKey('description-$id'),
          create: (context) => di<PokemonDescriptionBloc>()..add(PokemonDescriptionInit(id)),
        ),
      ],
      child: BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
        builder: (context, state) {
          return switch (state) {
            PokemonDetailInitial() || PokemonDetailLoading() => const Scaffold(
              body: SafeArea(child: Center(child: CircularProgressIndicator())),
            ),
            PokemonDetailFailure(:final message, :final pokemonId) => Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: FailureView(
                  message: message,
                  onRetry: () => context.read<PokemonDetailBloc>().add(PokemonDetailInit(pokemonId)),
                ),
              ),
            ),
            PokemonDetailSuccess(:final pokemon) => Scaffold(
              backgroundColor: pokemon.background,
              body: PokemonDetailView(pokemon: pokemon),
            ),
          };
        },
      ),
    );
  }
}
