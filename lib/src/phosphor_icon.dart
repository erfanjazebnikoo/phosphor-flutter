library phosphor_flutter;

import 'package:flutter/material.dart';

class PhosphorIcon extends StatelessWidget {
  const PhosphorIcon(
    this.icon, {
    super.key,
    this.size,
    this.fill,
    this.weight,
    this.grade,
    this.opticalSize,
    this.color,
    this.shadows,
    this.semanticLabel,
    this.textDirection,
    this.duotoneSecondaryOpacity = 0.20,
    this.duotoneSecondaryColor,
  });

  final IconData? icon;
  final double? size;
  final double? fill;
  final double? weight;
  final double? grade;
  final double? opticalSize;
  final Color? color;
  final List<Shadow>? shadows;
  final String? semanticLabel;
  final TextDirection? textDirection;
  final double duotoneSecondaryOpacity;
  final Color? duotoneSecondaryColor;

  Icon _buildIcon(IconData iconData, {Color? colorOverride}) => Icon(
        iconData,
        size: size,
        fill: fill,
        weight: weight,
        grade: grade,
        opticalSize: opticalSize,
        color: colorOverride ?? color,
        shadows: shadows,
        semanticLabel: semanticLabel,
        textDirection: textDirection,
      );

  @override
  Widget build(BuildContext context) {
    final iconData = icon;
    if (iconData == null) return const SizedBox.shrink();

    if (iconData.fontFamily == 'PhosphorDuotone') {
      final primaryCode = iconData.codePoint & 0xFFFF;
      final secondaryCode = (iconData.codePoint >> 16) & 0xFFFF;
      final primary = IconData(primaryCode,
          fontFamily: 'PhosphorDuotone',
          fontPackage: 'phosphor_flutter',
          matchTextDirection: true);
      final secondary = IconData(secondaryCode,
          fontFamily: 'PhosphorDuotone',
          fontPackage: 'phosphor_flutter',
          matchTextDirection: true);
      return Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: duotoneSecondaryOpacity,
            child: _buildIcon(secondary,
                colorOverride: duotoneSecondaryColor ?? color),
          ),
          _buildIcon(primary),
        ],
      );
    }

    return _buildIcon(iconData);
  }
}
