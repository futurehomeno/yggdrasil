import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgIcon extends StatelessWidget {
  const YgIcon(
    this.icon, {
    super.key,
    this.size,
    this.color,
    this.semanticLabel,
    this.useEmbeddedColor = false,
  });

  /// The icon to display.
  ///
  /// The available icons are shown in the IconList screen.
  ///
  /// The icon can be null, in which case the widget will render as an empty
  /// space of the specified [size].
  final String? icon;

  /// The size of the icon.
  final YgIconSize? size;

  /// The color to use when drawing the icon.
  ///
  /// Defaults to the nearest [IconTheme]'s [IconThemeData.color].
  final Color? color;

  /// Semantic label for the icon.
  ///
  /// This label does not show in the UI.
  final String? semanticLabel;

  /// Uses the color embedded in the SVG instead of theme.
  final bool useEmbeddedColor;

  @override
  Widget build(BuildContext context) {
    final String? icon = this.icon;
    final YgIconSize? size = this.size;

    final YgIconTheme ygIconTheme = context.iconTheme;
    final IconThemeData materialIconTheme = IconTheme.of(context);

    double? iconSize = materialIconTheme.size;
    if (size != null) {
      iconSize = YgIconMapper.getIconSize(
        iconTheme: ygIconTheme,
        iconSize: size,
      );
    }

    final Color? iconColor = color ?? materialIconTheme.color;
    final ColorFilter? colorFilter = _getColorFilter(context, iconColor);

    // final double? iconSize = size ?? iconTheme.size;
    //
    // final double? iconFill = fill ?? iconTheme.fill;
    //
    // final double? iconWeight = weight ?? iconTheme.weight;
    //
    // final double? iconGrade = grade ?? iconTheme.grade;
    //
    // final double? iconOpticalSize = opticalSize ?? iconTheme.opticalSize;
    //
    // final List<Shadow>? iconShadows = shadows ?? iconTheme.shadows;

    if (icon == null) {
      return Semantics(
        label: semanticLabel,
        child: SizedBox.square(dimension: iconSize),
      );
    }

    return Semantics(
      label: semanticLabel,
      child: ExcludeSemantics(
        child: SizedBox.square(
          dimension: iconSize,
          child: Center(
            child: Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                icon,
                package: 'yggdrasil',
                colorFilter: colorFilter,
                height: iconSize,
                width: iconSize,
              ),
            ),
          ),
        ),
      ),
    );
  }

  ColorFilter? _getColorFilter(BuildContext context, Color? color) {
    if (useEmbeddedColor) {
      return null;
    }

    if (color == null) {
      return ColorFilter.mode(
        context.defaults.iconColor,
        BlendMode.srcIn,
      );
    }

    return ColorFilter.mode(
      color,
      BlendMode.srcIn,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('icon', icon, defaultValue: null));
    properties.add(EnumProperty<YgIconSize>('size', size, defaultValue: null));
    properties.add(ColorProperty('color', color, defaultValue: null));
    properties.add(StringProperty('semanticLabel', semanticLabel, defaultValue: null));
  }
}
