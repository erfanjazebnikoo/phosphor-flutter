library phosphor_flutter;

import 'package:flutter/widgets.dart';

// IconData became a `final class` in Flutter 3.44 / Dart 3.12, preventing
// subclassing outside its library. Extension types implement final classes
// and preserve the full IconData API at zero runtime cost.

extension type const PhosphorIconData._(IconData _icon) implements IconData {
  const PhosphorIconData(int codePoint, String style)
      : this._(IconData(
          codePoint,
          fontFamily: 'Phosphor$style',
          fontPackage: 'phosphor_flutter',
          matchTextDirection: true,
        ));
}

// PhosphorFlatIconData is structurally identical to PhosphorIconData.
typedef PhosphorFlatIconData = PhosphorIconData;

// PhosphorDuotoneIconData can no longer extend IconData (final class), so it
// is a plain const class. PhosphorIcon handles it via an explicit type check.
class PhosphorDuotoneIconData {
  const PhosphorDuotoneIconData(this.codePoint, this.secondary);

  final int codePoint;
  final PhosphorIconData secondary;

  IconData get primary => IconData(
        codePoint,
        fontFamily: 'PhosphorDuotone',
        fontPackage: 'phosphor_flutter',
        matchTextDirection: true,
      );
}
