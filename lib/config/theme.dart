import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    );
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.deepOrange,
      surfaceTint: Color(0xff3C6E71),
      onPrimary: Color(0xff2C1320),
      primaryContainer: Color(0xffE9D985),
      onPrimaryContainer: Color(0xffA7CECB),
      secondary: Color.fromARGB(255, 191, 154, 44),
      onSecondary: Color.fromARGB(255, 165, 187, 224),
      secondaryContainer: Color(0xffc9e6ff),
      onSecondaryContainer: Color(0xff001e2f),
      tertiary: Color.fromARGB(255, 216, 198, 144),
      onTertiary: Color(0xFF0B4784),
      tertiaryContainer: Color(0xff9ef2e3),
      onTertiaryContainer: Color(0xff00201c),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xffffffff),
      onSurface: Color(0xff201b13),
      onSurfaceVariant: Color(0xff4e4639),
      outline: Color(0xff807667),
      outlineVariant: Color(0xffd1c5b4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff353027),
      inversePrimary: Color(0xffedc06c),
      primaryFixed: Color(0xffffdea6),
      onPrimaryFixed: Color(0xff271900),
      primaryFixedDim: Color(0xffedc06c),
      onPrimaryFixedVariant: Color(0xff5e4200),
      secondaryFixed: Color(0xffc9e6ff),
      onSecondaryFixed: Color(0xff001e2f),
      secondaryFixedDim: Color(0xff95cdf7),
      onSecondaryFixedVariant: Color(0xff004b6f),
      tertiaryFixed: Color(0xff9ef2e3),
      onTertiaryFixed: Color(0xff00201c),
      tertiaryFixedDim: Color(0xff82d5c7),
      onTertiaryFixedVariant: Color(0xff005048),
      surfaceDim: Color(0xFFE0E7FF),
      surfaceBright: Color(0xffffffff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffffffff),
      surfaceContainer: Color(0xffffffff),
      surfaceContainerHigh: Color(0xffffffff),
      surfaceContainerHighest: Color(0xffffffff),
    );
  }

  ThemeData light() {
    const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    );
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff305596),
      surfaceTint: Color(0xff7a590c),
      onPrimary: Color(0xff1181C8),
      primaryContainer: Color(0xff936f23),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff004769),
      onSecondary: Color(0x30559645),
      secondaryContainer: Color(0xff417aa1),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff004c44),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff298176),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f3),
      onSurface: Color(0xff201b13),
      onSurfaceVariant: Color(0xff4a4235),
      outline: Color(0xff675e50),
      outlineVariant: Color(0xff83796b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff353027),
      inversePrimary: Color(0xffedc06c),
      primaryFixed: Color(0xff936f23),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff775609),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff417aa1),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff236187),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff298176),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff00685d),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe3d8cc),
      surfaceBright: Color(0xfffff8f3),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffdf2e5),
      surfaceContainer: Color(0xfff7ecdf),
      surfaceContainerHigh: Color(0xfff1e7d9),
      surfaceContainerHighest: Color(0xffece1d4),
    );
  }

  ThemeData lightMediumContrast() {
    const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    );
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff2f1f00),
      surfaceTint: Color(0xff7a590c),
      onPrimary: Color(0xff1181C8),
      primaryContainer: Color(0xff593e00),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff002539),
      onSecondary: Color(0x30559645),
      secondaryContainer: Color(0xff004769),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff002823),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff004c44),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f3),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff2a2318),
      outline: Color(0xff4a4235),
      outlineVariant: Color(0xff4a4235),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff353027),
      inversePrimary: Color(0xffffe9c8),
      primaryFixed: Color(0xff593e00),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff3c2900),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff004769),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff003048),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff004c44),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff00332d),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe3d8cc),
      surfaceBright: Color(0xfffff8f3),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffdf2e5),
      surfaceContainer: Color(0xfff7ecdf),
      surfaceContainerHigh: Color(0xfff1e7d9),
      surfaceContainerHighest: Color(0xffece1d4),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    );
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff305596),
      surfaceTint: Color(0xffedc06c),
      onPrimary: Color(0xff1181C8),
      primaryContainer: Color(0xff5e4200),
      onPrimaryContainer: Color(0xffffdea6),
      secondary: Color(0xff95cdf7),
      onSecondary: Color(0x30559645),
      secondaryContainer: Color(0xff004b6f),
      onSecondaryContainer: Color(0xffc9e6ff),
      tertiary: Color(0xff82d5c7),
      onTertiary: Color(0xff003731),
      tertiaryContainer: Color(0xff005048),
      onTertiaryContainer: Color(0xff9ef2e3),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff17130b),
      onSurface: Color(0xffece1d4),
      onSurfaceVariant: Color(0xffd1c5b4),
      outline: Color(0xff9a8f80),
      outlineVariant: Color(0xff4e4639),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffece1d4),
      inversePrimary: Color(0xff7a590c),
      primaryFixed: Color(0xffffdea6),
      onPrimaryFixed: Color(0xff271900),
      primaryFixedDim: Color(0xffedc06c),
      onPrimaryFixedVariant: Color(0xff5e4200),
      secondaryFixed: Color(0xffc9e6ff),
      onSecondaryFixed: Color(0xff001e2f),
      secondaryFixedDim: Color(0xff95cdf7),
      onSecondaryFixedVariant: Color(0xff004b6f),
      tertiaryFixed: Color(0xff9ef2e3),
      onTertiaryFixed: Color(0xff00201c),
      tertiaryFixedDim: Color(0xff82d5c7),
      onTertiaryFixedVariant: Color(0xff005048),
      surfaceDim: Color(0xff17130b),
      surfaceBright: Color(0xff3e382f),
      surfaceContainerLowest: Color(0xff120e07),
      surfaceContainerLow: Color(0xff201b13),
      surfaceContainer: Color(0xff241f17),
      surfaceContainerHigh: Color(0xff2f2921),
      surfaceContainerHighest: Color(0xff3a342b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff305596),
      surfaceTint: Color(0xffedc06c),
      onPrimary: Color(0xff1181C8),
      primaryContainer: Color(0xffb28a3d),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff99d1fc),
      onSecondary: Color(0x30559645),
      secondaryContainer: Color(0xff5f96bf),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff87dacc),
      onTertiary: Color(0xff001a17),
      tertiaryContainer: Color(0xff4a9e92),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff17130b),
      onSurface: Color(0xfffffaf7),
      onSurfaceVariant: Color(0xffd5c9b8),
      outline: Color(0xffada191),
      outlineVariant: Color(0xff8c8273),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffece1d4),
      inversePrimary: Color(0xff5f4300),
      primaryFixed: Color(0xffffdea6),
      onPrimaryFixed: Color(0xff190f00),
      primaryFixedDim: Color(0xffedc06c),
      onPrimaryFixedVariant: Color(0xff483200),
      secondaryFixed: Color(0xffc9e6ff),
      onSecondaryFixed: Color(0xff001320),
      secondaryFixedDim: Color(0xff95cdf7),
      onSecondaryFixedVariant: Color(0xff003a56),
      tertiaryFixed: Color(0xff9ef2e3),
      onTertiaryFixed: Color(0xff001511),
      tertiaryFixedDim: Color(0xff82d5c7),
      onTertiaryFixedVariant: Color(0xff003e37),
      surfaceDim: Color(0xff17130b),
      surfaceBright: Color(0xff3e382f),
      surfaceContainerLowest: Color(0xff120e07),
      surfaceContainerLow: Color(0xff201b13),
      surfaceContainer: Color(0xff241f17),
      surfaceContainerHigh: Color(0xff2f2921),
      surfaceContainerHighest: Color(0xff3a342b),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff305596),
      surfaceTint: Color(0xffedc06c),
      onPrimary: Color(0xff1181C8),
      primaryContainer: Color(0xfff1c470),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfff9fbff),
      onSecondary: Color(0x30559645),
      secondaryContainer: Color(0xff99d1fc),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffebfffa),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff87dacc),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff17130b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffffaf7),
      outline: Color(0xffd5c9b8),
      outlineVariant: Color(0xffd5c9b8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffece1d4),
      inversePrimary: Color(0xff392700),
      primaryFixed: Color(0xffffe3b6),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xfff1c470),
      onPrimaryFixedVariant: Color(0xff201400),
      secondaryFixed: Color(0xffd2eaff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff99d1fc),
      onSecondaryFixedVariant: Color(0xff001827),
      tertiaryFixed: Color(0xffa3f6e8),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff87dacc),
      onTertiaryFixedVariant: Color(0xff001a17),
      surfaceDim: Color(0xff17130b),
      surfaceBright: Color(0xff3e382f),
      surfaceContainerLowest: Color(0xff120e07),
      surfaceContainerLow: Color(0xff201b13),
      surfaceContainer: Color(0xff241f17),
      surfaceContainerHigh: Color(0xff2f2921),
      surfaceContainerHighest: Color(0xff3a342b),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    ),
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    iconTheme: IconThemeData(color: colorScheme.onPrimary),
    scaffoldBackgroundColor: colorScheme.surfaceDim,
    canvasColor: colorScheme.surface,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide.none, // Removes default border
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: MaterialTheme.lightScheme().primary,
          width: 4.0,
        ), // Blue bottom border
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: MaterialTheme.lightScheme().primary,
          width: 4.5,
        ), // Blue bottom border on focus
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15),
        backgroundColor: MaterialTheme.lightScheme().primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );

  /// Warning
  static const warning = ExtendedColor(
    seed: Color(0xffffc107),
    value: Color(0xffffc107),
    light: ColorFamily(
      color: Color(0xff775a0b),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffffdf9e),
      onColorContainer: Color(0xff261a00),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff775a0b),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffffdf9e),
      onColorContainer: Color(0xff261a00),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff775a0b),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffffdf9e),
      onColorContainer: Color(0xff261a00),
    ),
    dark: ColorFamily(
      color: Color(0xffe9c16c),
      onColor: Color(0xff3f2e00),
      colorContainer: Color(0xff5b4300),
      onColorContainer: Color(0xffffdf9e),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xffe9c16c),
      onColor: Color(0xff3f2e00),
      colorContainer: Color(0xff5b4300),
      onColorContainer: Color(0xffffdf9e),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xffe9c16c),
      onColor: Color(0xff3f2e00),
      colorContainer: Color(0xff5b4300),
      onColorContainer: Color(0xffffdf9e),
    ),
  );

  /// Success
  static const success = ExtendedColor(
    seed: Color(0xff28a745),
    value: Color(0xff28a745),
    light: ColorFamily(
      color: Color(0xff39693c),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffbaf0b7),
      onColorContainer: Color(0xff002106),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff39693c),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffbaf0b7),
      onColorContainer: Color(0xff002106),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff39693c),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffbaf0b7),
      onColorContainer: Color(0xff002106),
    ),
    dark: ColorFamily(
      color: Color(0xff9ed49c),
      onColor: Color(0xff053911),
      colorContainer: Color(0xff205026),
      onColorContainer: Color(0xffbaf0b7),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xff9ed49c),
      onColor: Color(0xff053911),
      colorContainer: Color(0xff205026),
      onColorContainer: Color(0xffbaf0b7),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xff9ed49c),
      onColor: Color(0xff053911),
      colorContainer: Color(0xff205026),
      onColorContainer: Color(0xffbaf0b7),
    ),
  );

  List<ExtendedColor> get extendedColors => [warning, success];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
