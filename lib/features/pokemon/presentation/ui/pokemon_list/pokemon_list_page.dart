import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../blocs/blocs.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<PokemonListBloc>()..add(const PokemonListStarted()),
      child: BlocBuilder<PokemonListBloc, PokemonListState>(
        builder: (context, pokemonListState) {
          return Scaffold(body: SafeArea(child: Center()));
        },
      ),
    );
  }
}
