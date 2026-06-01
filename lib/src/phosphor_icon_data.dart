library phosphor_flutter;

import 'package:flutter/widgets.dart';

// IconData became a `final class` in Flutter 3.44 / Dart 3.12.
//
// PhosphorDuotoneIconData holds both layers as const IconData fields so the
// tree-shaker can statically enumerate every glyph codepoint. PhosphorIcon
// checks `icon is PhosphorDuotoneIconData` and renders a two-layer Stack.

class PhosphorDuotoneIconData {
  const PhosphorDuotoneIconData(this.primary, this.secondary);

  final IconData primary;
  final IconData secondary;
}

// Backward-compat alias used by the generated PhosphorIcons base class.
typedef PhosphorIconData = Object;
