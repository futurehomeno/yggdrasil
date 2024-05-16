import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '../mappers/_mappers.dart';

class ColorfulIcon extends StatelessWidget {
  const ColorfulIcon({
    super.key,
    required this.iconData,
    required this.color,
  });

  final YgIconData iconData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture(
      SvgAssetLoader(
        iconData.path,
        packageName: 'yggdrasil',
        colorMapper: TokenColorMapper(
          colors: context.ygTheme.tokens.colors,
          fallbackColor: color,
        ),
      ),
    );
  }
}
