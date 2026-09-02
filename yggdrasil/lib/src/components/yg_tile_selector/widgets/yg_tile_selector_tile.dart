import 'dart:ui' show ImageFilter;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_icon/_yg_icon.dart';
import 'package:yggdrasil/src/components/yg_tile_selector/enums/_enums.dart';
import 'package:yggdrasil/src/components/yg_tile_selector/widgets/yg_tile_selector_spec.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/tokens/_tokens.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// A tile button, used internally for the [YgTileSelector].
///
/// Shows the icon of the tile in a circle with the label below it. While
/// pressed the whole tile scales down, on release it springs back up. When
/// the tile becomes selected its circle pops in with a spring, the icon
/// sharpens from a slight blur and a halo ring expands out of the circle.
/// The selection is otherwise carried entirely by color, see
/// [YgTileSelector] for the states and [YgTileSelectorVariant] for the
/// looks.
class YgTileSelectorTile extends StatefulWidget {
  const YgTileSelectorTile({
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
  State<YgTileSelectorTile> createState() => _YgTileSelectorTileState();
}

class _YgTileSelectorTileState extends State<YgTileSelectorTile> with SingleTickerProviderStateMixin {
  /// How far the tile scales down while pressed.
  static const double _pressedScale = 0.93;

  /// Press down is short and snappy, the release takes roughly 3 times as
  /// long and overshoots the resting scale once before settling.
  static const Duration _pressDuration = Duration(milliseconds: 100);
  static const Curve _pressCurve = Curves.easeOutCubic;
  static const Duration _releaseDuration = Duration(milliseconds: 350);
  static const Curve _releaseCurve = Curves.elasticOut;

  /// The entrance of a newly selected tile: the circle springs up from
  /// [_circlePopScale], the icon sharpens from [_iconBlurSigma] and a halo
  /// ring grows to [_haloScale] while fading out.
  static const Duration _selectDuration = Duration(milliseconds: 500);
  static const double _circlePopScale = 0.7;
  static const double _iconBlurSigma = 5.0;
  static const double _haloScale = 1.6;
  static const double _haloOpacity = 0.5;
  static const Interval _blurInterval = Interval(0.0, 0.35, curve: Curves.easeOut);
  static const Interval _haloInterval = Interval(0.0, 0.55, curve: Curves.easeOutCubic);

  /// Starts settled so an initially selected tile does not animate.
  late final AnimationController _selectController = AnimationController(
    vsync: this,
    duration: _selectDuration,
    value: 1.0,
  );

  late final Animation<double> _circleScale = _selectController.drive(
    Tween<double>(begin: _circlePopScale, end: 1.0).chain(CurveTween(curve: Curves.elasticOut)),
  );

  late final Animation<double> _iconBlur = _selectController.drive(
    Tween<double>(begin: _iconBlurSigma, end: 0.0).chain(CurveTween(curve: _blurInterval)),
  );

  late final Animation<double> _haloScaleAnimation = _selectController.drive(
    Tween<double>(begin: 1.0, end: _haloScale).chain(CurveTween(curve: _haloInterval)),
  );

  late final Animation<double> _haloFadeAnimation = _selectController.drive(
    Tween<double>(begin: _haloOpacity, end: 0.0).chain(CurveTween(curve: _haloInterval)),
  );

  bool _pressed = false;
  bool _focused = false;
  Offset? _pressOrigin;

  bool get _disabled => widget.onPressed == null;

  bool get _outlined => widget.variant == YgTileSelectorVariant.outlined;

  @override
  void didUpdateWidget(YgTileSelectorTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_disabled) {
      _pressed = false;
      _pressOrigin = null;
    }

    if (widget.selected && !oldWidget.selected) {
      if (MediaQuery.disableAnimationsOf(context)) {
        _selectController.value = 1.0;
      } else {
        _selectController.forward(from: 0.0);
      }
    }
  }

  @override
  void dispose() {
    _selectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final YgTokens tokens = context.tokens;
    final YgColor colors = tokens.colors;
    final YgTileSelectorSpec spec = widget.spec;
    final Duration colorDuration = context.defaults.animationDuration;
    final Curve colorCurve = context.defaults.animationCurve;
    final bool showPressed = _pressed && !MediaQuery.disableAnimationsOf(context);

    return Semantics(
      checked: widget.selected,
      enabled: !_disabled,
      inMutuallyExclusiveGroup: true,
      child: Listener(
        onPointerDown: _disabled ? null : _handlePointerDown,
        onPointerMove: _disabled ? null : _handlePointerMove,
        onPointerUp: (_) => _setPressed(false),
        onPointerCancel: (_) => _setPressed(false),
        child: AnimatedScale(
          scale: showPressed ? _pressedScale : 1.0,
          duration: showPressed ? _pressDuration : _releaseDuration,
          curve: showPressed ? _pressCurve : _releaseCurve,
          child: AnimatedContainer(
            duration: colorDuration,
            curve: colorCurve,
            decoration: BoxDecoration(
              color: _resolveTileColor(colors),
              borderRadius: spec.borderRadius,
            ),
            // The border is drawn in the foreground so its width does not
            // affect the size of the tile.
            foregroundDecoration: BoxDecoration(
              border: _resolveBorder(tokens),
              borderRadius: spec.borderRadius,
            ),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                customBorder: RoundedRectangleBorder(borderRadius: spec.borderRadius),
                overlayColor: WidgetStateProperty.resolveWith(
                  (Set<WidgetState> states) => _resolveOverlayColor(colors, states),
                ),
                splashFactory: NoSplash.splashFactory,
                onTap: widget.onPressed,
                // Releases the pressed scale when another gesture, like a
                // scroll of the tiles, claims the pointer.
                onTapCancel: () => _setPressed(false),
                onFocusChange: (bool focused) => setState(() => _focused = focused),
                canRequestFocus: !_disabled,
                child: Padding(
                  padding: spec.padding,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        width: spec.circleSize,
                        height: spec.circleSize,
                        child: Stack(
                          fit: StackFit.expand,
                          clipBehavior: Clip.none,
                          children: <Widget>[
                            FadeTransition(
                              opacity: _haloFadeAnimation,
                              child: ScaleTransition(
                                scale: _haloScaleAnimation,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: colors.borderHighlightDefault,
                                      width: tokens.borders.md.top.width,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ScaleTransition(
                              scale: _circleScale,
                              child: AnimatedContainer(
                                duration: colorDuration,
                                curve: colorCurve,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: _resolveCircleColor(colors),
                                  shape: BoxShape.circle,
                                ),
                                child: ExcludeSemantics(
                                  child: _buildIcon(colors),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: spec.labelSpacing),
                      AnimatedDefaultTextStyle(
                        duration: colorDuration,
                        curve: colorCurve,
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

  /// The icon of the tile, blurred while the selection entrance plays.
  Widget _buildIcon(YgColor colors) {
    final Widget icon = IconTheme.merge(
      data: IconThemeData(size: widget.spec.iconSize),
      child: YgIcon.colorable(
        widget.icon,
        color: _resolveIconColor(colors),
      ),
    );

    return AnimatedBuilder(
      animation: _iconBlur,
      child: icon,
      builder: (BuildContext context, Widget? child) {
        final double sigma = _iconBlur.value;
        if (sigma == 0.0) {
          return child!;
        }

        return ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: sigma,
            sigmaY: sigma,
            tileMode: TileMode.decal,
          ),
          child: child,
        );
      },
    );
  }

  void _handlePointerDown(PointerDownEvent event) {
    _pressOrigin = event.position;
    _setPressed(true);
  }

  /// Releases the pressed scale when the pointer strays beyond the touch
  /// slop, like when the gesture turns out to be a scroll of the tiles.
  void _handlePointerMove(PointerMoveEvent event) {
    final Offset? pressOrigin = _pressOrigin;
    if (pressOrigin == null) {
      return;
    }

    if ((event.position - pressOrigin).distance > kTouchSlop) {
      _setPressed(false);
    }
  }

  void _setPressed(bool pressed) {
    if (!pressed) {
      _pressOrigin = null;
    }

    if (_pressed == pressed) {
      return;
    }

    setState(() => _pressed = pressed);
  }

  Color _resolveTileColor(YgColor colors) {
    if (_outlined) {
      return colors.backgroundTransparent;
    }

    if (widget.selected && !_disabled) {
      return colors.backgroundHighlightWeak;
    }

    return colors.backgroundWeak;
  }

  Border _resolveBorder(YgTokens tokens) {
    final YgColor colors = tokens.colors;
    final double emphasisWidth = tokens.borders.md.top.width;

    if (widget.selected) {
      return Border.all(
        color: _resolveSelectedBorderColor(colors),
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
        width: tokens.borders.sm.top.width,
      );
    }

    return Border.all(
      color: colors.borderTransparent,
      width: emphasisWidth,
    );
  }

  Color _resolveSelectedBorderColor(YgColor colors) {
    if (_disabled) {
      return colors.borderDisabled;
    }

    if (_focused) {
      return colors.borderHighlightStrong;
    }

    return colors.borderHighlightDefault;
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

  Color? _resolveOverlayColor(YgColor colors, Set<WidgetState> states) {
    if (states.contains(WidgetState.hovered) || states.contains(WidgetState.pressed)) {
      return colors.textDefault.withValues(alpha: 0.08);
    }

    return null;
  }
}
