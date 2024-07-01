import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yggdrasil/src/components/yg_icon/mappers/_mappers.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/src/utils/yg_consts.dart';
import 'package:yggdrasil/yggdrasil.dart';

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
        packageName: YgConsts.package,
        colorMapper: TokenColorMapper(
          colors: context.ygTheme.tokens.colors,
          fallbackColor: color,
        ),
      ),
    );
  }
}
