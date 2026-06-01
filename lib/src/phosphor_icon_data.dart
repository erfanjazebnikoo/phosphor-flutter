library phosphor_flutter;

import 'package:flutter/widgets.dart';

// IconData became a `final class` in Flutter 3.44 / Dart 3.12.
//
// Duotone icons encode both codepoints in a single IconData by packing the
// secondary codepoint into the upper 16 bits of codePoint
// (encoded = primary | (secondary << 16)). PhosphorIcon decodes them by
// checking fontFamily == 'PhosphorDuotone'.

// Backward-compat alias used by the generated PhosphorIcons base class.
typedef PhosphorIconData = IconData;
