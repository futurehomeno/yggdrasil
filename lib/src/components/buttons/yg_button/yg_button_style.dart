import 'dart:ui';

import 'package:flutter/src/animation/curves.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/components/buttons/yg_button/enum/yg_button_state.dart';

class YgButtonStyle extends YgBaseButtonStyle<YgButtonState> {
  @override
  Color resolveColor(BuildContext context, Set<YgButtonState> states) {
    // TODO: implement resolveColor
    throw UnimplementedError();
  }

  @override
  TextStyle resolveTextStyle(BuildContext context, Set<YgButtonState> states) {
    // TODO: implement resolveTextStyle
    throw UnimplementedError();
  }

  @override
  Curve get curve => Curves.easeInOut;

  @override
  Duration get duration => const Duration(milliseconds: 200);
}
