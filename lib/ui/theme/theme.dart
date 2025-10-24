import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.smartBuyBlue,
    required this.fieldBackground,
  });

  final Color smartBuyBlue;
  final Color fieldBackground;

  @override
  AppColors copyWith({
    Color? smartBuyBlue,
    Color? fieldBackground,
    Color? googleButtonBackground,
    Color? googleButtonBorder,
  }) {
    return AppColors(
      smartBuyBlue: smartBuyBlue ?? this.smartBuyBlue,
      fieldBackground: fieldBackground ?? this.fieldBackground,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      smartBuyBlue: Color.lerp(smartBuyBlue, other.smartBuyBlue, t)!,
      fieldBackground: Color.lerp(fieldBackground, other.fieldBackground, t)!,
    );
  }

  static const AppColors light = AppColors(
    smartBuyBlue: Color(0xFF5CC1E0),
    fieldBackground: Color(0xFFEEF1F5),
  );

  static const AppColors dark = AppColors(
    smartBuyBlue: Color(0xFF5CC1E0),
    fieldBackground: Color(0xFF252D36),
  );
}

final _lightColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF5CC1E0),
  surface: const Color(0xFFF5F7FA),
  surfaceContainerHighest: const Color(0xFFFFFFFF),
  brightness: Brightness.light,
);

final _darkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF5CC1E0),
  surface: const Color(0xFF0F1419),
  surfaceContainerHighest: const Color(0xFF1A2128),
  brightness: Brightness.dark,
);

final ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
  colorScheme: _lightColorScheme,
  extensions: const <ThemeExtension<dynamic>>[
    AppColors.light,
  ],
);

final ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
  colorScheme: _darkColorScheme,
  extensions: const <ThemeExtension<dynamic>>[
    AppColors.dark,
  ],
);
