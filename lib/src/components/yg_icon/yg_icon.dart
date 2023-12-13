import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yggdrasil/src/extensions/hex_color.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/tokens/extensions/yg_color.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgIcon extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgIcon(
    this.iconData, {
    super.key,
    this.size,
    this.color,
    this.semanticLabel,
  });

  const YgIcon.embeddedColor(
    this.iconData, {
    super.key,
    this.size,
    this.semanticLabel,
  }) : color = null;

  /// The icon to show represented as [YgIconData].
  ///
  /// Available can be gotten from [YgIcons].
  ///
  /// The icon can be null, in which case the widget will render as an empty
  /// space of the specified [size].
  final YgIconData? iconData;

  /// The size of the icon.
  ///
  /// If no size is specified, the nearest IconTheme of the current
  /// context will be used. This is useful when a parent widget wants to
  /// specify a size for the icon.
  final YgIconSize? size;

  /// The color to use when drawing the icon.
  ///
  /// If no size is specified, the nearest IconTheme of the current
  /// context will be used. This is useful when a parent widget wants to
  /// specify a color for the icon.
  ///
  /// Note that [YgIconData]s will never be colored regardless of
  /// the parent widget specifying an [IconTheme].
  final Color? color;

  /// Semantic label for the icon.
  ///
  /// This label does not show in the UI.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final YgIconData? iconData = this.iconData;
    final YgIconSize? size = this.size;

    final YgIconTheme ygIconTheme = context.iconTheme;
    final IconThemeData materialIconTheme = IconTheme.of(context);

    // By default the size is inherited from the parent widget.
    late double? iconSize = materialIconTheme.size;
    if (size != null) {
      iconSize = YgIconMapper.getIconSize(
        iconTheme: ygIconTheme,
        iconSize: size,
      );
    }

    // If no icon is specified, render an empty space with the size that
    // the icon would have used.
    if (iconData == null) {
      return Semantics(
        label: semanticLabel,
        child: SizedBox.square(
          dimension: iconSize,
          child: const Placeholder(),
        ),
      );
    }

    // If the icon is colorable, we need to apply the color filter.
    // If colorFilter is null, the icon will be rendered with the embedded color.
    late ColorFilter? colorFilter;
    if (iconData is YgColorableIconData) {
      final Color? iconColor = color ?? materialIconTheme.color;
      colorFilter = _getColorFilter(context, iconColor);
    }

    return FutureBuilder<String>(
      future: rootBundle.loadString('packages/yggdrasil/${iconData.path}'),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.data == null) {
          // This is what we show when the icon is loading.
          return Semantics(
            label: semanticLabel ?? iconData.name,
            child: SizedBox.square(
              dimension: iconSize,
            ),
          );
        }

        late SvgPicture svgPicture;
        if (iconData is YgColorableIconData) {
          svgPicture = SvgPicture.asset(
            iconData.path,
            package: 'yggdrasil',
            colorFilter: colorFilter,
            height: iconSize,
            width: iconSize,
            excludeFromSemantics: true,
          );
        } else {
          final String iconDocument = _convertYggColorTagToFillColor(snapshot, context);
          svgPicture = SvgPicture.string(
            iconDocument,
            height: iconSize,
            width: iconSize,
            excludeFromSemantics: true,
          );
        }

        return Semantics(
          label: semanticLabel ?? iconData.name,
          child: ExcludeSemantics(
            child: SizedBox.square(
              dimension: iconSize,
              child: Center(
                child: Align(
                  alignment: Alignment.center,
                  child: svgPicture,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Replace all fill with color from yggColor.
  String _convertYggColorTagToFillColor(AsyncSnapshot<String> snapshot, BuildContext context) {
    return snapshot.data!
        .replaceAllMapped(RegExp(r'fill="[^"]+"'), (Match match) => '')
        .replaceAllMapped(RegExp(r'yggColor="([^"]+)"'), (Match match) {
      final YgColor colors = context.tokens.colors;
      final Color color = YgColors.getColorFromString(
            colors: colors,
            colorName: match.group(1)!,
          ) ??
          context.defaults.iconColor;

      return 'fill="${color.toHex()}"';
    });
  }

  ColorFilter _getColorFilter(
    BuildContext context,
    Color? color,
  ) {
    if (color == null) {
      return ColorFilter.mode(
        context.defaults.iconColor,
        BlendMode.srcIn,
      );
    }

    return ColorFilter.mode(
      color,
      BlendMode.srcIn,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('iconData', iconData?.toString(), defaultValue: null));
    properties.add(EnumProperty<YgIconSize>('size', size, defaultValue: null));
    properties.add(ColorProperty('color', color, defaultValue: null));
    properties.add(StringProperty('semanticLabel', semanticLabel, defaultValue: null));
  }
}
