import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_tile_selector/widgets/yg_tile_selector_spec.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// A tile button, used internally by the [YgTileSelector].
///
/// Shows the icon of the tile in a circle with the label below it. While
/// pressed the whole tile scales down, on release it springs back up. The
/// selection is carried entirely by color, see [YgTileSelector] for the
/// states and [YgTileSelectorVariant] for the looks.
class YgTileSelectorTileButton extends StatefulWidget {
  const YgTileSelectorTileButton({
    super.key,
    required this.onPressed,
    required this.selected,
    required this.icon,
    required this.label,
    required this.spec,
    required this.variant,
  });

  /// Called when the user presses this tile.
  ///
  /// The tile is disabled when null.
  final VoidCallback? onPressed;

  /// Whether this tile is selected.
  final bool selected;

  /// The icon shown in the circle of this tile.
  final YgColorableIconData icon;

  /// The label shown below the icon.
  final String label;

  /// The resolved sizing of this tile.
  final YgTileSelectorSpec spec;

  /// The look of this tile, see [YgTileSelectorVariant].
  final YgTileSelectorVariant variant;

  @override
  State<YgTileSelectorTileButton> createState() => _YgTileSelectorTileButtonState();
}

class _YgTileSelectorTileButtonState extends State<YgTileSelectorTileButton> {
  /// How far the tile scales down while pressed.
  static const double _pressedScale = 0.93;

  /// Press down is short and snappy, the release takes roughly 3 times as
  /// long and overshoots the resting scale once before settling.
  static const Duration _pressDuration = Duration(milliseconds: 100);
  static const Curve _pressCurve = Curves.easeOutCubic;
  static const Duration _releaseDuration = Duration(milliseconds: 350);
  static const Curve _releaseCurve = Curves.elasticOut;

  /// Matches the selection transition of [YgSegmentedButton].
  static const Duration _colorDuration = Duration(milliseconds: 200);
  static const Curve _colorCurve = Cubic(0.42, 0, 0.2, 1);

  bool _pressed = false;
  bool _focused = false;

  bool get _disabled => widget.onPressed == null;

  @override
  Widget build(BuildContext context) {
    final YgColor colors = context.tokens.colors;
    final YgTileSelectorSpec spec = widget.spec;
    final bool showPressed = _pressed && !MediaQuery.disableAnimationsOf(context);

    return Semantics(
      checked: widget.selected,
      inMutuallyExclusiveGroup: true,
      child: Listener(
        onPointerDown: _disabled ? null : (_) => setState(() => _pressed = true),
        onPointerUp: (_) => setState(() => _pressed = false),
        onPointerCancel: (_) => setState(() => _pressed = false),
        child: AnimatedScale(
          scale: showPressed ? _pressedScale : 1.0,
          duration: showPressed ? _pressDuration : _releaseDuration,
          curve: showPressed ? _pressCurve : _releaseCurve,
          child: AnimatedContainer(
            duration: _colorDuration,
            curve: _colorCurve,
            decoration: BoxDecoration(
              color: _resolveTileColor(colors),
              borderRadius: spec.borderRadius,
              border: _resolveBorder(context, colors),
            ),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                customBorder: RoundedRectangleBorder(borderRadius: spec.borderRadius),
                overlayColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
                splashFactory: NoSplash.splashFactory,
                onTap: widget.onPressed,
                onFocusChange: (bool focused) => setState(() => _focused = focused),
                canRequestFocus: !_disabled,
                child: Padding(
                  padding: spec.padding,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      AnimatedContainer(
                        duration: _colorDuration,
                        curve: _colorCurve,
                        width: spec.circleSize,
                        height: spec.circleSize,
                        decoration: BoxDecoration(
                          color: _resolveCircleColor(colors),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: IconTheme.merge(
                            data: IconThemeData(size: spec.iconSize),
                            child: YgIcon.colorable(
                              widget.icon,
                              color: _resolveIconColor(colors),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: spec.labelSpacing),
                      AnimatedDefaultTextStyle(
                        duration: _colorDuration,
                        curve: _colorCurve,
                        style: spec.labelStyle.copyWith(
                          color: _resolveLabelColor(colors),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        child: Text(widget.label),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool get _outlined => widget.variant == YgTileSelectorVariant.outlined;

  Color _resolveTileColor(YgColor colors) {
    if (_outlined) {
      return colors.backgroundTransparent;
    }

    if (widget.selected && !_disabled) {
      return colors.backgroundHighlightWeak;
    }

    return colors.backgroundWeak;
  }

  Border _resolveBorder(BuildContext context, YgColor colors) {
    final double hairlineWidth = context.tokens.borders.sm.top.width;
    final double emphasisWidth = context.tokens.borders.md.top.width;

    if (widget.selected) {
      return Border.all(
        color: _disabled ? colors.borderDisabled : colors.borderHighlightDefault,
        width: emphasisWidth,
      );
    }

    if (_focused) {
      return Border.all(
        color: colors.borderDefault,
        width: emphasisWidth,
      );
    }

    if (_outlined) {
      return Border.all(
        color: colors.borderDefault,
        width: hairlineWidth,
      );
    }

    return Border.all(
      color: colors.borderTransparent,
      width: emphasisWidth,
    );
  }

  Color _resolveCircleColor(YgColor colors) {
    if (_outlined) {
      return colors.backgroundTransparent;
    }

    if (widget.selected) {
      if (_disabled) {
        return colors.backgroundDisabled;
      }

      return colors.backgroundHighlightDefault;
    }

    return colors.backgroundDefault;
  }

  Color _resolveIconColor(YgColor colors) {
    if (_disabled) {
      return colors.iconDisabled;
    }

    if (widget.selected) {
      if (_outlined) {
        return colors.iconHighlight;
      }

      return colors.iconInverse;
    }

    return colors.iconDefault;
  }

  Color _resolveLabelColor(YgColor colors) {
    if (_disabled) {
      return colors.textDisabled;
    }

    if (widget.selected) {
      return colors.textHighlight;
    }

    return colors.textDefault;
  }
}
