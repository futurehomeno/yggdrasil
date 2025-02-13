import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_layout/enums/yg_footer_behavior.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/yg_scroll_shadow/yg_scroll_shadow_overlay.dart';

import 'controller/_controller.dart';
import 'widgets/_widgets.dart';

part 'yg_layout_body_regular.dart';
part 'yg_layout_body_sliver.dart';

abstract class YgLayoutBody extends Widget {
  const factory YgLayoutBody({
    required Widget child,
    Widget? footer,
    YgFooterBehavior footerBehavior,
    Key? key,
    bool loading,
  }) = _YgLayoutBodyRegular;

  const factory YgLayoutBody.sliver({
    Key? key,
    bool loading,
    required Widget sliver,
  }) = _YgLayoutBodySliver;

  bool get loading;
}
