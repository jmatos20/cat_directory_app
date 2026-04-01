import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/breed.dart';
import '../../data/repositories/cat_repository.dart';
import '../../logic/fact/fact_bloc.dart';
import '../../logic/fact/fact_event.dart';
import '../../logic/fact/fact_state.dart';

class BreedDetailScreen extends StatelessWidget {
  final Breed breed;

  const BreedDetailScreen({
    super.key,
    required this.breed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FactBloc(
        repository: context.read<CatRepository>(),
      )..add(const LoadRandomFact()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(breed.breed),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero animated icon
              Center(
                child: Hero(
                  tag: 'breed_${breed.breed}',
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Icon(
                      Icons.pets,
                      size: 64,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Breed name
              Center(
                child: Text(
                  breed.breed,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 32),

              // Breed details
              _DetailCard(
                title: 'Origen',
                icon: Icons.flag,
                content: breed.origin,
              ),
              const SizedBox(height: 16),

              _DetailCard(
                title: 'País',
                icon: Icons.location_on,
                content: breed.country,
              ),
              const SizedBox(height: 16),

              _DetailCard(
                title: 'Pelaje',
                icon: Icons.brush,
                content: breed.coat,
              ),
              const SizedBox(height: 16),

              _DetailCard(
                title: 'Patrón',
                icon: Icons.color_lens,
                content: breed.pattern,
              ),
              const SizedBox(height: 32),

              // Cat fact section
              Text(
                '¿Sabías que...?',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),

              BlocBuilder<FactBloc, FactState>(
                builder: (context, state) {
                  if (state.status == FactStatus.loading) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Center(
                          child: Column(
                            children: [
                              const CircularProgressIndicator(),
                              const SizedBox(height: 16),
                              Text(
                                'Cargando dato curioso...',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }

                  if (state.status == FactStatus.failure) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            Icon(
                              state.isTimeout
                                  ? Icons.timer_off_outlined
                                  : Icons.error_outline,
                              size: 48,
                              color: Theme.of(context).colorScheme.error,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              state.isTimeout
                                  ? 'Tiempo de espera agotado'
                                  : 'No se pudo cargar el dato',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              state.errorMessage ?? 'No se pudo cargar el dato.',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton.icon(
                              onPressed: () {
                                context
                                    .read<FactBloc>()
                                    .add(const LoadRandomFact());
                              },
                              icon: const Icon(Icons.refresh),
                              label: const Text('Reintentar'),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  if (state.fact != null) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.lightbulb_outline,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    state.fact!.fact,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton.icon(
                                onPressed: () {
                                  context
                                      .read<FactBloc>()
                                      .add(const LoadRandomFact());
                                },
                                icon: const Icon(Icons.refresh),
                                label: const Text('Nuevo dato'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String content;

  const _DetailCard({
    required this.title,
    required this.icon,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.6),
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    content,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
