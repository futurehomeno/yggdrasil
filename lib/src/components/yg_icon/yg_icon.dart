import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgIcon extends StatelessWidget {
  const YgIcon({
    required this.icon,
    this.iconSize = YgIconSize.medium,
    this.tapSize = YgIconTapSize.larger,
    this.onTap,
    super.key,
  });

  final String icon;
  final YgIconSize iconSize;
  final YgIconTapSize tapSize;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final YgIconThemes iconThemes = context.iconThemes;

    if (onTap == null) {
      return SizedBox.square(
        dimension: iconSize.getIconSize(iconThemes),
        child: const Placeholder(),
      );
    }

    return Material(
      borderRadius: BorderRadius.circular(tapSize.getTapSize(iconThemes)),
      color: context.tokens.colors.backgroundTransparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(tapSize.getTapSize(iconThemes)),
        onTap: onTap,
        child: SizedBox.square(
          dimension: tapSize.getTapSize(iconThemes),
          child: Align(
            alignment: Alignment.center,
            child: SizedBox.square(
              dimension: iconSize.getIconSize(iconThemes),
              child: const Placeholder(),
            ),
          ),
        ),
      ),
    );
  }
}
