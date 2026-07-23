import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../blocs/blocs.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({super.key, required this.id});

  final num id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<PokemonDetailBloc>()..add(PokemonDetailInit(id)),
      child: BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
        builder: (context, pokemonDetailState) {
          return Scaffold(body: SafeArea(child: Center()));
        },
      ),
    );
  }
}
