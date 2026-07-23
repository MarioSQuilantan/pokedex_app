import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/core.dart';
import '../../blocs/blocs.dart';
import 'widgets/widgets.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => di<PokemonListBloc>()..add(const PokemonListInit()),
      child: BlocBuilder<PokemonListBloc, PokemonListState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: BaseColors.pokedexRed,
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              SvgPaths.pokeBall,
                              width: 24,
                              height: 24,
                              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Pokédex',
                              style: context.h3.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                            ).responsive(),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: SearchPokemonInput(
                                onChanged: (query) =>
                                    context.read<PokemonListBloc>().add(PokemonListSearchChanged(query)),
                              ),
                            ),
                            const SizedBox(width: 12),
                            SortPokemonButton(
                              selectedSort: state.sortType,
                              onSortSelected: (sort) =>
                                  context.read<PokemonListBloc>().add(PokemonListSortChanged(sort)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                      child: ColoredBox(
                        color: Colors.white,
                        child: switch (state.status) {
                          PokemonListStatus.onInitial || PokemonListStatus.isLoading => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          PokemonListStatus.onFailure => FailureView(
                            message: state.failureMessage ?? 'Something went wrong',
                            onRetry: () => context.read<PokemonListBloc>().add(const PokemonListInit()),
                          ),
                          PokemonListStatus.onSuccess ||
                          PokemonListStatus.isLoadingMore ||
                          PokemonListStatus.onRefreshing ||
                          PokemonListStatus.onFailureMore =>
                            PokemonListView(
                              pokemonList: state.filteredPokemonList,
                              status: state.status,
                              isSearching: state.isSearching,
                              onRefresh: () => context.read<PokemonListBloc>().add(const PokemonListRefreshed()),
                              onLoadMore: state.isSearching
                                  ? null
                                  : () => context.read<PokemonListBloc>().add(const PokemonListLoadMoreRequested()),
                            ),
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
