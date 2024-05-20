import 'package:flutter/widgets.dart';

class AppTextStyles {
  static const ibmPlexSans = 'IBM_Plex_Sans';

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
      fontFamily: fontFamily ?? ibmPlexSans,
      fontSize: size,
      color: color,
      fontWeight: weight,
      height: height == null ? null : height / size,
      letterSpacing: spacing,
      fontStyle: style,
    );
  }

  // // Regular
  // /// Default color - Lightcolor2
  // static final regular11 = TextStyle(
  //   fontSize: 11,
  //   fontWeight: FontWeight.normal,
  //   height: 1.3,
  //   color: AppColors.lightColor2,
  // );

  ///
  static const regular12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    height: 1.2,
  );

  // static final regular13 = TextStyle(
  //   fontSize: 13,
  //   fontWeight: FontWeight.normal,
  //   height: 1.3,
  // );

  static const regular14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.4,
  );

  static const regular16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static const regular18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  static const regular24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    height: 1.2,
  );

  // // Medium
  static const medium12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.3,
  );

  // static final medium13 = TextStyle(
  //   fontSize: 13,
  //   fontWeight: FontWeight.w500,
  //   height: 1.3,
  // );

  static const medium14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  static const medium16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static const medium18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.56,
  );

  static const medium20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  static const medium24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  // /// Default color - DarkColor1
  // static final medium26 = TextStyle(
  //   fontSize: 26,
  //   fontWeight: FontWeight.w500,
  //   color: AppColors.darkColor1,
  // );

  static const medium36 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w500,
  );

  static const medium48 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w500,
    height: 1.25,
  );

  /// SemiBold
  static const semiBold12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static const semiBold14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const semiBold16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const semiBold18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const semiBold24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static const semiBold30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );
  // // Bold
  static const bold14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  // static final bold16 = TextStyle(
  //   fontSize: 16,
  //   fontWeight: FontWeight.bold,
  // );

  // // Default Color -
  // static final bold18 = TextStyle(
  //   fontSize: 18,
  //   fontWeight: FontWeight.bold,
  // );

  // static final bold28 = TextStyle(
  //   fontSize: 28,
  //   fontWeight: FontWeight.bold,
  // );
}
