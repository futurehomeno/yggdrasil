import 'package:yggdrasil/src/utils/yg_debug/stateless_widget_debug_mixin.dart';

import 'yg_section_header_internal.dart';

class YgSectionHeader extends YgSectionHeaderInternal with StatelessWidgetDebugMixin {
  const YgSectionHeader({
    super.key,
    required super.title,
    super.subtitle,
    super.trailing,
    super.icon,
    super.onPressed,
  });
}
