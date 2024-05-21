import 'package:flutter/widgets.dart';

class AppTextStyles {
  static const lexend = 'Lexend';

  static TextStyle dynamic(
    double size, {
    Color? color,
    FontWeight? weight,
    double? height,
    double? spacing,
    FontStyle? style,
    String? fontFamily,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? lexend,
      fontSize: size,
      color: color,
      fontWeight: weight,
      height: height == null ? null : height / size,
      letterSpacing: spacing,
      fontStyle: style,
    );
  }

  /// Regular
  static const regular12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  static const regular14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  static const regular16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  /// Medium
  static const medium12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.67,
  );

  static const medium14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.7,
  );

  static const medium16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static const medium18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.78,
  );

  /// Bold
  static const bold14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    height: 1.5,
  );

  static const bold16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    height: 1.5,
  );

  static const bold18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.27,
    height: 1.25,
  );

  static const bold32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.8,
    height: 1.25,
  );
}
