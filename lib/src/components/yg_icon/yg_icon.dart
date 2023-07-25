import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgIcon extends StatelessWidget {
  const YgIcon(
    this.icon, {
    super.key,
    this.color,
    this.onTap,
    this.invertColor = false,
    this.useSvgColor = false,
    this.size = YgIconSize.large,
    this.tapSize = YgIconTapSize.largest,
  });

  /// String representing the name of the icon.
  final String icon;

  /// Color of the icon.
  ///
  /// If null, the default theme color for icons will be used.
  /// This responds well when changing the theme.
  final Color? color;

  /// Whether the icon color should be inverted.
  ///
  /// Enable this if the icon is placed on a dark background.
  /// The default theme color works for light backgrounds,
  /// but not for dark backgrounds.
  final bool invertColor;

  /// Whether the icon should use the color defined in the SVG file.
  ///
  /// !--- IMPORTANT ---
  /// Setting this will override [color] and [invertColor].
  final bool useSvgColor;

  /// Size of the icon.
  final YgIconSize size;

  /// Size of the tap area.
  final YgIconTapSize tapSize;

  /// Callback for when the icon is tapped.
  ///
  /// This also enables the ripple effect on the icon.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final YgIconTheme ygIconTheme = context.iconTheme;

    final double iconSize = YgIconMapper.getIconSize(
      iconTheme: ygIconTheme,
      iconSize: size,
    );

    final double iconTapSize = YgIconMapper.getTapSize(
      iconTheme: ygIconTheme,
      tapSize: tapSize,
    );

    // Grabs the nearest material icon theme.
    final IconThemeData materialIconTheme = IconTheme.of(context);
    final Color? iconColor = color ?? materialIconTheme.color;
    final ColorFilter? colorFilter = _setColorFilter(context, iconColor);

    if (onTap == null) {
      return _buildSvg(colorFilter, iconSize);
    }

    return Material(
      borderRadius: BorderRadius.circular(iconTapSize),
      color: context.tokens.colors.backgroundTransparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(iconTapSize),
        onTap: onTap,
        child: SizedBox.square(
          dimension: iconTapSize,
          child: Align(
            alignment: Alignment.center,
            child: _buildSvg(colorFilter, iconSize),
          ),
        ),
      ),
    );
  }

  ColorFilter? _setColorFilter(BuildContext context, Color? color) {
    if (useSvgColor) {
      return null;
    }

    if (color == null) {
      return ColorFilter.mode(
        invertColor ? context.defaults.invertedIconColor : context.defaults.iconColor,
        BlendMode.srcIn,
      );
    }

    return ColorFilter.mode(
      color,
      BlendMode.srcIn,
    );
  }

  SvgPicture _buildSvg(
    ColorFilter? colorFilter,
    double iconSize,
  ) {
    return SvgPicture.asset(
      icon,
      package: 'yggdrasil',
      colorFilter: colorFilter,
      height: iconSize,
      width: iconSize,
    );
  }

  /// Creates a copy of this [YgIcon] but with the given fields replaced with the new values.
  ///
  /// This can be used to enforce a default value for some of the fields of [YgIcon].
  YgIcon copyWith({
    String? icon,
    Color? color,
    bool? invertColor,
    bool? useSvgColor,
    YgIconSize? size,
    YgIconTapSize? tapSize,
    VoidCallback? onTap,
  }) {
    return YgIcon(
      icon ?? this.icon,
      color: color ?? this.color,
      invertColor: invertColor ?? this.invertColor,
      useSvgColor: useSvgColor ?? this.useSvgColor,
      size: size ?? this.size,
      tapSize: tapSize ?? this.tapSize,
      onTap: onTap ?? this.onTap,
    );
  }
}
