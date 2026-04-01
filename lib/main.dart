import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme.dart';
import 'data/repositories/cat_repository.dart';
import 'data/services/cache_service.dart';
import 'logic/breeds/breeds_bloc.dart';
import 'logic/theme/theme_bloc.dart';
import 'logic/theme/theme_state.dart';
import 'ui/screens/breed_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize cache service
  final cacheService = await CacheService.create();

  runApp(MyApp(cacheService: cacheService));
}

class MyApp extends StatelessWidget {
  final CacheService cacheService;

  const MyApp({
    super.key,
    required this.cacheService,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CatRepository>(
          create: (context) => CatRepositoryImpl(),
        ),
        RepositoryProvider<CacheService>.value(
          value: cacheService,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeBloc(),
          ),
          BlocProvider(
            create: (context) => BreedsBloc(
              repository: context.read<CatRepository>(),
              cacheService: context.read<CacheService>(),
            ),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Cat Directory',
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: state.themeMode,
              home: const BreedListScreen(),
            );
          },
        ),
      ),
    );
  }
}
