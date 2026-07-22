import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../consts/consts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: BaseColors.pokedexRed),
      useMaterial3: true,
      textTheme: GoogleFonts.poppinsTextTheme(),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: BaseColors.pokedexRed,
      ),
    );
  }
}
