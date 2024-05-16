import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'icon_frame/_yg_icon_frame.dart';
import 'mappers/_mappers.dart';

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
  }) = YgIconAny;

  /// Create an colorable icon.
  ///
  /// Only works with colorable icons but allows you to overwrite the icon color.
  const factory YgIcon.colorable(
    YgColorableIconData icon, {
    required Color color,
    Key? key,
    String? semanticLabel,
    YgIconSize? size,
  }) = YgIconColorable;

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
  }) = YgIconAnimated;

  const YgIcon._(
    this.iconData, {
    super.key,
    this.size,
    this.semanticLabel,
  });

  /// The icon to show represented as [YgIconData].
  ///
  /// Available can be gotten from [YgIcons].
  ///
  /// The icon can be null, in which case the widget will render as an empty
  /// space of the specified [size].
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

  Widget _buildColorfulIcon({
    required BuildContext context,
    required YgIconData iconData,
    required Color color,
  }) {
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

  Widget _buildColorableIcon({
    required YgColorableIconData iconData,
    required Color color,
  }) {
    return SvgPicture.asset(
      iconData.path,
      package: 'yggdrasil',
      colorFilter: ColorFilter.mode(
        color,
        BlendMode.srcIn,
      ),
    );
  }

  Widget _buildAnimatedIcon({
    required YgAnimatedIconData iconData,
    required bool animated,
  }) {
    return LottieBuilder.asset(
      iconData.path,
      package: 'yggdrasil',
      animate: true,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('iconData', iconData.toString(), defaultValue: null));
    properties.add(EnumProperty<YgIconSize>('size', size, defaultValue: null));
    properties.add(StringProperty('semanticLabel', semanticLabel, defaultValue: null));
  }
}
