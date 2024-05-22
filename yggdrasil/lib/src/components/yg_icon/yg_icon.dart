import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'icon_frame/_yg_icon_frame.dart';
import 'viewers/_viewers.dart';

part 'yg_icon_animated.dart';
part 'yg_icon_any.dart';
part 'yg_icon_colorable.dart';

/// Widget which displays an icon.
abstract class YgIcon extends StatelessWidget with StatelessWidgetDebugMixin {
  /// Create an YgIcon.
  ///
  /// This will work with any icon type and displays the icon without any
  /// customization. When more control over the icon is needed use the
  /// [YgIcon.colorable] or [YgIcon.animated] constructors instead.
  const factory YgIcon(
    YgIconData icon, {
    Key? key,
    String? semanticLabel,
    YgIconSize? size,
  }) = _YgIconAny;

  /// Create an colorable icon.
  ///
  /// Only works with colorable icons but allows you to overwrite the icon color.
  const factory YgIcon.colorable(
    YgColorableIconData icon, {
    required Color color,
    Key? key,
    String? semanticLabel,
    YgIconSize? size,
  }) = _YgIconColorable;

  /// Creates an animated icon.
  ///
  /// Only works with animated icons, but allows you to manually overwrite
  /// whether the animation should be playing.
  const factory YgIcon.animated(
    YgAnimatedIconData icon, {
    bool animated,
    Key? key,
    String? semanticLabel,
    YgIconSize? size,
  }) = _YgIconAnimated;

  const YgIcon._(
    this.iconData, {
    super.key,
    this.size,
    this.semanticLabel,
  });

  /// The icon to show represented as [YgIconData].
  ///
  /// Available can be gotten from [YgIcons] and [YgAnimatedIcons].
  final YgIconData iconData;

  /// The size of the icon.
  ///
  /// If no size is specified, the nearest IconTheme of the current
  /// context will be used. This is useful when a parent widget wants to
  /// specify a size for the icon.
  final YgIconSize? size;

  /// Semantic label for the icon.
  ///
  /// This label does not show in the UI.
  final String? semanticLabel;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('iconData', iconData.toString(), defaultValue: null));
    properties.add(EnumProperty<YgIconSize>('size', size, defaultValue: null));
    properties.add(StringProperty('semanticLabel', semanticLabel, defaultValue: null));
  }
}
