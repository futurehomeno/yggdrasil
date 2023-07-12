import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgIcon extends StatelessWidget {
  const YgIcon({
    required this.icon,
    this.size = YgIconSize.medium,
    this.tapSize = YgIconTapSize.larger,
    this.onTap,
    super.key,
  });

  final String icon;
  final YgIconSize size;
  final YgIconTapSize tapSize;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final YgIconTheme iconTheme = context.iconTheme;

    if (onTap == null) {
      return SizedBox.square(
        dimension: size.getIconSize(iconTheme),
        child: const Placeholder(),
      );
    }

    return Material(
      borderRadius: BorderRadius.circular(tapSize.getTapSize(iconTheme)),
      color: context.tokens.colors.backgroundTransparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(tapSize.getTapSize(iconTheme)),
        onTap: onTap,
        child: SizedBox.square(
          dimension: tapSize.getTapSize(iconTheme),
          child: Align(
            alignment: Alignment.center,
            child: SizedBox.square(
              dimension: size.getIconSize(iconTheme),
              child: const Placeholder(),
            ),
          ),
        ),
      ),
    );
  }
}
