import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main/main.dart';
import 'package:ui/ui.dart';

class AppRoute extends ConsumerWidget {
  const AppRoute({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lightTheme = ref.read(lightThemeProvider);
    final darkTheme = ref.read(darkThemeProvider);

    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const MainPage(),
    );
  }
}
