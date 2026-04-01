import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants.dart';
import '../../logic/breeds/breeds_bloc.dart';
import '../../logic/breeds/breeds_event.dart';
import '../../logic/breeds/breeds_state.dart';
import '../../logic/theme/theme_bloc.dart';
import '../../logic/theme/theme_event.dart';
import '../widgets/breed_card.dart';
import '../widgets/breed_skeleton_loader.dart';
import '../widgets/error_widget.dart';
import 'breed_detail_screen.dart';

class BreedListScreen extends StatefulWidget {
  const BreedListScreen({super.key});

  @override
  State<BreedListScreen> createState() => _BreedListScreenState();
}

class _BreedListScreenState extends State<BreedListScreen> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    // Load initial breeds
    context.read<BreedsBloc>().add(const LoadInitialBreeds());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<BreedsBloc>().add(const LoadMoreBreeds());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * UIConstants.scrollThreshold);
  }

  void _onSearchChanged(String query) {
    context.read<BreedsBloc>().add(FilterBreeds(query));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Razas de Gatos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              context.read<ThemeBloc>().add(const ToggleTheme());
            },
            tooltip: 'Cambiar tema',
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Buscar razas...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: _onSearchChanged,
            ),
          ),
          // Breeds list
          Expanded(
            child: BlocConsumer<BreedsBloc, BreedsState>(
              listener: (context, state) {
                // Show snackbar for errors during load more
                if (state.status == BreedsStatus.failure &&
                    state.breeds.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.errorMessage ?? 'Ocurrió un error',
                      ),
                      action: SnackBarAction(
                        label: 'Reintentar',
                        onPressed: () {
                          context.read<BreedsBloc>().add(const LoadMoreBreeds());
                        },
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                // Initial loading with skeleton
                if (state.status == BreedsStatus.loading) {
                  return const BreedSkeletonLoader();
                }

                // Error on initial load
                if (state.status == BreedsStatus.failure &&
                    state.breeds.isEmpty) {
                  return ErrorDisplay(
                    message: state.errorMessage ?? 'No se pudieron cargar las razas',
                    onRetry: () {
                      context.read<BreedsBloc>().add(const LoadInitialBreeds());
                    },
                  );
                }

                // Success - show list with pull to refresh
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<BreedsBloc>().add(const RefreshBreeds());
                    // Wait for the refresh to complete
                    await context
                        .read<BreedsBloc>()
                        .stream
                        .firstWhere((state) =>
                            state.status == BreedsStatus.success ||
                            state.status == BreedsStatus.failure);
                  },
                  child: _buildBreedsList(state),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreedsList(BreedsState state) {
    final breeds = state.filteredBreeds;

    if (breeds.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
            ),
            const SizedBox(height: 16),
            Text(
              state.searchQuery.isEmpty
                  ? 'No hay razas disponibles'
                  : 'No se encontraron razas para "${state.searchQuery}"',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      itemCount: breeds.length + 1, // +1 for loading indicator
      itemBuilder: (context, index) {
        // Loading indicator or error at the bottom
        if (index >= breeds.length) {
          if (state.status == BreedsStatus.loadingMore) {
            return const LoadMoreIndicator();
          } else if (state.status == BreedsStatus.failure &&
              !state.hasReachedMax) {
            return LoadMoreErrorWidget(
              message: state.errorMessage ?? 'No se pudo cargar más',
              onRetry: () {
                context.read<BreedsBloc>().add(const LoadMoreBreeds());
              },
            );
          } else if (state.hasReachedMax) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  '¡Has llegado al final!',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.5),
                      ),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        }

        // Breed card
        final breed = breeds[index];
        return BreedCard(
          breed: breed,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BreedDetailScreen(breed: breed),
              ),
            );
          },
        );
      },
    );
  }
}
