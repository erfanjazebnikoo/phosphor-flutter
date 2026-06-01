library phosphor_flutter;

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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

  final Object? icon;
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
    if (icon is PhosphorDuotoneIconData) {
      final d = icon as PhosphorDuotoneIconData;
      return Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: duotoneSecondaryOpacity,
            child: _buildIcon(d.secondary,
                colorOverride: duotoneSecondaryColor ?? color),
          ),
          _buildIcon(d.primary),
        ],
      );
    }
    if (icon == null) return const SizedBox.shrink();
    return _buildIcon(icon as IconData);
  }
}
