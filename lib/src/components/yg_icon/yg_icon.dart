import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgIcon extends StatelessWidget {
  const YgIcon({
    required this.icon,
    this.color,
    this.size = YgIconSize.medium,
    this.tapSize = YgIconTapSize.larger,
    this.onTap,
    super.key,
  });

  final String icon;
  final Color? color;
  final YgIconSize size;
  final YgIconTapSize tapSize;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final YgIconTheme iconTheme = context.iconTheme;

    if (onTap == null) {
      return SizedBox.square(
        dimension: YgIconMapper.getIconSize(
          iconTheme: iconTheme,
          iconSize: size,
        ),
        child: const Placeholder(),
      );
    }

    return Material(
      borderRadius: BorderRadius.circular(
        YgIconMapper.getTapSize(
          iconTheme: iconTheme,
          tapSize: tapSize,
        ),
      ),
      color: context.tokens.colors.backgroundTransparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(
          YgIconMapper.getTapSize(
            iconTheme: iconTheme,
            tapSize: tapSize,
          ),
        ),
        onTap: onTap,
        child: SizedBox.square(
          dimension: YgIconMapper.getTapSize(
            iconTheme: iconTheme,
            tapSize: tapSize,
          ),
          child: Align(
            alignment: Alignment.center,
            child: SizedBox.square(
              dimension: YgIconMapper.getIconSize(
                iconTheme: iconTheme,
                iconSize: size,
              ),
              child: Placeholder(
                color: color ?? context.defaults.iconColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
