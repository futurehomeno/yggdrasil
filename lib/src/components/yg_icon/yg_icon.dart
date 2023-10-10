import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xml/xml.dart';
import 'package:yggdrasil/src/extensions/hex_color.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgIcon extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgIcon(
    this.icon, {
    super.key,
    this.size,
    this.color,
    this.semanticLabel,
  });

  /// The icon to display.
  ///
  /// The available icons are shown in the IconList screen.
  ///
  /// The icon can be null, in which case the widget will render as an empty
  /// space of the specified [size].
  final String? icon;

  /// The size of the icon.
  final YgIconSize? size;

  /// The color to use when drawing the icon.
  ///
  /// Defaults to the nearest [IconTheme]'s [IconThemeData.color].
  final Color? color;

  /// Semantic label for the icon.
  ///
  /// This label does not show in the UI.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final String? icon = this.icon;
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
    if (icon == null) {
      return Semantics(
        label: semanticLabel,
        child: SizedBox.square(
          dimension: iconSize,
          child: const Placeholder(),
        ),
      );
    }

    // Check if the icon is colorful variant.
    // If it is, make sure color has not been specified.
    final bool isColorfulIcon = icon.contains('colorful');
    if (isColorfulIcon && color != null) {
      throw FlutterError(
        'YgIcon: Colorful icons cannot be colored. '
        'Please remove the color property or use a different icon.',
      );
    }

    // If the icon is not colorful, we need to apply the color filter.
    // If colorFilter is null, the icon will be rendered with the embedded color.
    late ColorFilter? colorFilter;
    if (!isColorfulIcon) {
      final Color? iconColor = color ?? materialIconTheme.color;
      colorFilter = _getColorFilter(context, iconColor);
    }

    return FutureBuilder<String>(
      future: rootBundle.loadString('packages/yggdrasil/$icon'),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.data == null) {
          // This is what we show when the icon is loading.
          return Semantics(
            label: semanticLabel,
            child: SizedBox.square(
              dimension: iconSize,
            ),
          );
        }

        late SvgPicture svgPicture;
        if (isColorfulIcon) {
          final XmlDocument iconDocument = _convertYggColorTagToFillColor(snapshot, context);
          svgPicture = SvgPicture.string(
            iconDocument.toXmlString(),
            height: iconSize,
            width: iconSize,
            excludeFromSemantics: true,
          );
        } else {
          svgPicture = SvgPicture.asset(
            icon,
            package: 'yggdrasil',
            colorFilter: colorFilter,
            height: iconSize,
            width: iconSize,
            excludeFromSemantics: true,
          );
        }

        return Semantics(
          label: semanticLabel,
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

  XmlDocument _convertYggColorTagToFillColor(AsyncSnapshot<String> snapshot, BuildContext context) {
    final XmlDocument iconDocument = XmlDocument.parse(snapshot.data!);
    final Iterable<XmlElement> paths = iconDocument.findAllElements('path');
    for (final XmlElement path in paths) {
      final String? yggColor = path.getAttribute('yggColor');
      if (yggColor != null) {
        Color? color = YgColors.getColorFromString(context: context, colorName: yggColor);
        color ??= context.defaults.iconColor;
        path.setAttribute('fill', color.toHex());
      }
    }

    return iconDocument;
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
    properties.add(StringProperty('icon', icon, defaultValue: null));
    properties.add(EnumProperty<YgIconSize>('size', size, defaultValue: null));
    properties.add(ColorProperty('color', color, defaultValue: null));
    properties.add(StringProperty('semanticLabel', semanticLabel, defaultValue: null));
  }
}
