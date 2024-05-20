import 'package:flutter/material.dart';

/// ExtraTiny space = 2
///
/// Tiny space = 4
///
/// Small space = 8
///
/// Regular space = 16
///
/// Medium space = 24
///
/// ExtraMedium space = 32
///
/// Large space = 48
///
/// ExtraLarge space = 72
///
/// ExtraExtraLarge space = 96
class Spacing extends StatelessWidget {
  final double height;
  final double width;

  const Spacing({
    super.key,
    this.height = 0,
    this.width = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }

  /// Empty
  factory Spacing.empty() => const Spacing();

  // Horizontal Spacing
  /// Spacing = 2
  factory Spacing.horizExtraTiny() => const Spacing(width: 2);

  /// Spacing = 4
  factory Spacing.horizTiny() => const Spacing(width: 4);

  /// Spacing = 8
  factory Spacing.horizSmall() => const Spacing(width: 8);

  /// Spacing = 16
  factory Spacing.horizRegular() => const Spacing(width: 16);

  /// Spacing = 24
  factory Spacing.horizMedium() => const Spacing(width: 24);

  /// Spacing = 32
  factory Spacing.horizExtraMedium() => const Spacing(width: 32);

  /// Spacing = 48
  factory Spacing.horizLarge() => const Spacing(width: 48);

  /// Spacing = 72
  factory Spacing.horizExtraLarge() => const Spacing(width: 72);

  /// Spacing = 96
  factory Spacing.horizExtraExtraLarge() => const Spacing(width: 96);

  // Vertical Spacing
  /// Spacing = 2
  factory Spacing.vertExtraTiny() => const Spacing(height: 2);

  /// Spacing = 4
  factory Spacing.vertTiny() => const Spacing(height: 4);

  /// Spacing = 8
  factory Spacing.vertSmall() => const Spacing(height: 8);

  /// Spacing = 16
  factory Spacing.vertRegular() => const Spacing(height: 16);

  /// Spacing = 24
  factory Spacing.vertMedium() => const Spacing(height: 24);

  /// Spacing = 32
  factory Spacing.vertExtraMedium() => const Spacing(height: 32);

  /// Spacing = 48
  factory Spacing.vertLarge() => const Spacing(height: 48);

  /// Spacing = 72
  factory Spacing.vertExtraLarge() => const Spacing(height: 72);

  /// Spacing = 96
  factory Spacing.vertExtraExtraLarge() => const Spacing(height: 96);
}
