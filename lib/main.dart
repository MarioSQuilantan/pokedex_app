import 'package:flutter/material.dart';

import 'core/core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const PokedexApp());
}

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = di<AppRouter>().router;

    return MaterialApp.router(
      title: 'Pokedex App',
      theme: AppTheme.light(),
      routerConfig: router,
    );
  }
}
