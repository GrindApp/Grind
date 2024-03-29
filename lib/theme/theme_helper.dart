import 'package:flutter/material.dart';

import '../core/utils/pref_utils.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.gray900,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.gray200,
            width: 1,
          ),
          shape: RoundedRectangleBorder(),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: colorScheme.primary,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.gray500,
          fontSize: 16,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: Color(0XFF999999),
          fontSize: 14,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: Color(0X7FEDEDED),
          fontSize: 10,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: TextStyle(
          color: appTheme.redA200,
          fontSize: 27,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          color: appTheme.gray200,
          fontSize: 24,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
        ),
        labelMedium: TextStyle(
          color: Color(0XB2EDEDED),
          fontSize: 10,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
        ),
        labelSmall: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 8,
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 20,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        titleSmall: TextStyle(
          color: appTheme.gray200,
          fontSize: 14,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF23262B),
    primaryContainer: Color(0XB2040404),

    // Error colors
    onError: Color(0X99222222),

    // On colors(text colors)
    onPrimary: Color(0XFFC3C4C8),
    onPrimaryContainer: Color(0XFF484A4C),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Amber
  Color get amber500 => Color(0XFFFFC107);

  // Blackd
  Color get black9002d => Color(0X2D000000);

  // BlueGray
  Color get blueGray400 => Color(0XFF888A8C);
  Color get blueGray50 => Color(0XFFEDEEF2);

  // Cyan
  Color get cyan700 => Color(0XFF109EA3);

  // Gray
  Color get gray200 => Color(0XFFEDEDED);
  Color get gray500 => Color(0XFF999999);
  Color get gray700 => Color(0XFF55585B);
  Color get gray900 => Color(0XFF1C1E20);

  // Orange
  Color get orange300 => Color(0XFFF6BE4E);

  // Red
  Color get redA200 => Color(0XFFF9545E);

  // White
  Color get whiteA700 => Color(0XFFFFFFFF);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
