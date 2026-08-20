import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/colors.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/colors.dart' as consumer_light;

/// Categorical colors automatically assigned to [YgChartSeries] without an
/// explicit color.
///
/// Every slot is a color token from the design system, starting with the
/// Futurehome success green. The slot order is not cosmetic: it was chosen so
/// that adjacent slots stay distinguishable for color blind users on the
/// light (0xffffffff) and dark (0xff18303f) background tokens, with the
/// legend labels, stack gaps and bar/line shapes as secondary encoding for
/// the closest pairs. When changing these values, re-validate the palette
/// against both surfaces instead of judging by eye.
class YgChartColors {
  const YgChartColors._();

  /// Opacity of translucent area fills relative to the series color: the
  /// band envelope, the area of a stepped area series and the matching
  /// legend markers.
  static const double areaFillOpacity = 0.2;

  /// Categorical palette used on light backgrounds.
  static const List<Color> categoricalLight = <Color>[
    consumer_light.FhColors.borderSuccessDefault, // green
    consumer_light.FhColors.interactiveHighlightDefault, // blue
    consumer_light.FhColors.backgroundAccentDefault, // orange
    consumer_light.FhColors.borderHighlightStrong, // navy
    consumer_light.FhColors.backgroundCriticalDefault, // pink
    consumer_light.FhColors.borderWarningDefault, // amber
  ];

  /// Categorical palette used on dark backgrounds.
  ///
  /// Same hue families as [categoricalLight], stepped for the dark surface.
  static const List<Color> categoricalDark = <Color>[
    consumer_dark.FhColors.borderSuccessDefault, // green
    consumer_dark.FhColors.interactiveHighlightPressed, // blue
    consumer_dark.FhColors.backgroundAccentDefault, // orange
    consumer_dark.FhColors.interactiveHighlightSelected, // navy
    consumer_dark.FhColors.actionCriticalHovered, // crimson
    consumer_dark.FhColors.iconWarning, // amber
  ];

  /// Resolves the categorical palette matching the current theme brightness.
  static List<Color> categoricalOf(BuildContext context) {
    final bool isLightBackground = context.tokens.colors.backgroundDefault.computeLuminance() > 0.5;

    return isLightBackground ? categoricalLight : categoricalDark;
  }

  /// Resolves one color per item: items with an explicit color keep it, the
  /// others get palette colors assigned by their position among the
  /// auto-colored items.
  ///
  /// Assignment by position keeps an item's color stable when other items
  /// are toggled or recolored. Shared by [YgChart] and [YgStateTimeline] so
  /// both assign the same colors to the same data.
  static List<Color> resolveAutoColors(BuildContext context, List<Color?> explicitColors) {
    final List<Color> palette = categoricalOf(context);
    final List<Color> resolved = <Color>[];
    int autoColorIndex = 0;

    for (final Color? explicitColor in explicitColors) {
      if (explicitColor != null) {
        resolved.add(explicitColor);
        continue;
      }

      resolved.add(palette[autoColorIndex % palette.length]);
      autoColorIndex++;
    }

    return resolved;
  }
}
