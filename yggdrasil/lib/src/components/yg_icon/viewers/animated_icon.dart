import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

class AnimatedIcon extends StatelessWidget {
  const AnimatedIcon({
    super.key,
    required this.iconData,
    required this.animated,
  });

  final YgAnimatedIconData iconData;
  final bool animated;

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      iconData.path,
      package: YgConsts.package,
      animate: true,
    );
  }
}
