library phosphor_flutter;

import 'package:flutter/widgets.dart';

// IconData became a `final class` in Flutter 3.44 / Dart 3.12, so it can no
// longer be subclassed. Icon data is now expressed as plain const IconData.

// Backward-compat alias used by the generated PhosphorIcons base class.
typedef PhosphorIconData = Object;

// PhosphorDuotoneIconData can no longer extend IconData; it is a const class
// holding both codepoints. PhosphorIcon renders it as a two-layer Stack.
class PhosphorDuotoneIconData {
  const PhosphorDuotoneIconData(this.codePoint, this.secondaryCodePoint);

  final int codePoint;
  final int secondaryCodePoint;

  IconData get primary => IconData(
        codePoint,
        fontFamily: 'PhosphorDuotone',
        fontPackage: 'phosphor_flutter',
        matchTextDirection: true,
      );

  IconData get secondary => IconData(
        secondaryCodePoint,
        fontFamily: 'PhosphorDuotone',
        fontPackage: 'phosphor_flutter',
        matchTextDirection: true,
      );
}
