import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yggdrasil/src/utils/yg_consts.dart';
import 'package:yggdrasil/yggdrasil.dart';

class ColorableIcon extends StatelessWidget {
  const ColorableIcon({
    super.key,
    required this.iconData,
    required this.color,
  });

  final YgColorableIconData iconData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconData.path,
      package: YgConsts.package,
      colorFilter: ColorFilter.mode(
        color,
        BlendMode.srcIn,
      ),
    );
  }
}
