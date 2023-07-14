import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgIcon extends StatelessWidget {
  const YgIcon(
    this.icon, {
    this.color,
    this.invertColor = false,
    this.useSvgColor = false,
    this.size = YgIconSize.large,
    this.tapSize = YgIconTapSize.larger,
    this.onTap,
    super.key,
  });

  final String icon;
  final Color? color;
  final bool invertColor;
  final bool useSvgColor;
  final YgIconSize size;
  final YgIconTapSize tapSize;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final YgIconTheme iconTheme = context.iconTheme;

    // Need to be saved as a local variable in order to allow for type promotion.
    final Color? myColor = color;

    final ColorFilter? colorFilter;

    if (useSvgColor) {
      colorFilter = null;
    } else if (myColor == null) {
      colorFilter = ColorFilter.mode(
        invertColor ? context.defaults.invertedIconColor : context.defaults.iconColor,
        BlendMode.srcIn,
      );
    } else {
      colorFilter = ColorFilter.mode(
        myColor,
        BlendMode.srcIn,
      );
    }

    if (onTap == null) {
      return _buildSvg(colorFilter, iconTheme);
    }

    return Material(
      borderRadius: BorderRadius.circular(
        tapSize.getTapSize(iconTheme),
      ),
      color: context.tokens.colors.backgroundTransparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(
          tapSize.getTapSize(iconTheme),
        ),
        onTap: onTap,
        child: SizedBox.square(
          dimension: tapSize.getTapSize(iconTheme),
          child: Align(
            alignment: Alignment.center,
            child: _buildSvg(colorFilter, iconTheme),
          ),
        ),
      ),
    );
  }

  SvgPicture _buildSvg(
    ColorFilter? colorFilter,
    YgIconTheme iconTheme,
  ) {
    return SvgPicture.asset(
      IconConstants.getIconPath(icon),
      package: 'yggdrasil',
      colorFilter: colorFilter,
      height: size.getIconSize(iconTheme),
      width: size.getIconSize(iconTheme),
    );
  }

  /// Creates a copy of this [YgIcon] but with the given fields replaced with the new values.
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
