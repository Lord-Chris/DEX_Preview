import 'package:flutter/material.dart';

extension Contexter on BuildContext {
  /// Returns the text theme defined in the current theme context.
  ///
  /// This extension method retrieves the [TextTheme] defined in the
  /// [ThemeData] associated with the current [BuildContext]. It allows
  /// convenient access to the text-related styling configurations, such as
  /// font sizes, font weights, and font families, that are defined for
  /// various text elements within the application.
  TextTheme get tTheme => Theme.of(this).textTheme;

  /// Returns the color scheme defined in the current theme context.
  ///
  /// This extension method retrieves the [ColorScheme] defined in the
  /// [ThemeData] associated with the current [BuildContext]. It allows
  /// convenient access to the color-related styling configurations, such as
  /// primary color, secondary color, background color, surface color, etc.,
  /// that are defined for different parts of the application's UI.
  ColorScheme get cScheme => Theme.of(this).colorScheme;

  /// Returns a boolean indicating whether the current theme is dark.
  bool get isDark => cScheme.brightness == Brightness.dark;

  /// Returns the size of the screen in logical pixels.
  ///
  /// This extension method retrieves the size of the screen in logical pixels
  /// as a [Size] object. It allows convenient access to the width and height
  /// of the screen, which can be useful for creating responsive UIs that adapt
  /// to the size of the screen on which the application is running.
  Size get screenSize => MediaQuery.sizeOf(this);

  /// Returns whether the screen is in landscape orientation.
  ///
  /// This extension method retrieves the orientation of the screen as a
  /// [bool] value indicating whether the screen is in landscape orientation.
  bool get isTablet => screenSize.width > 600;
}
