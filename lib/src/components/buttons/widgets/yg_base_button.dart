import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import '_widgets.dart';

typedef YbButtonStyleCreator<T extends Enum> = YgBaseButtonStyle<T> Function(YgVsync vsync);

class YgBaseButton<T extends Enum> extends StatefulWidget with StatefulWidgetDebugMixin {
  const YgBaseButton({
    super.key,
    required this.child,
    required this.controller,
    required this.statesToMaterialMap,
    required this.onPressed,
    required this.createStyle,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.autofocus = false,
  });

  final YbButtonStyleCreator<T> createStyle;
  final YgStatesController<T> controller;
  final Map<T, MaterialState> statesToMaterialMap;
  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final FocusNode? focusNode;
  final bool autofocus;

  @override
  State<YgBaseButton<T>> createState() => _YgBaseButtonState<T>();
}

class _YgBaseButtonState<T extends Enum> extends State<YgBaseButton<T>> {
  late final YgStatesMaterialStatesProxyController<T> _proxyController = YgStatesMaterialStatesProxyController<T>(
    parentController: widget.controller,
    statesMap: widget.statesToMaterialMap,
  );

  @override
  void dispose() {
    _proxyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YgStyleBuilder<YgBaseButtonStyle<T>>(
      createStyle: widget.createStyle,
      getWatchedProperties: (YgBaseButtonStyle<T> style) => <YgDynamicDrivenProperty>{
        style.splashFactory,
        style.cursor,
      },
      builder: (BuildContext context, YgBaseButtonStyle<T> style) {
        return YgAnimatedConstrainedBox(
          constraints: style.constraints,
          child: YgAnimatedPhysicalModel(
            color: style.color,
            elevation: style.elevation,
            child: YgAnimatedShaperBorderPainter(
              shape: style.shape,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  statesController: _proxyController,
                  splashFactory: style.splashFactory.value,
                  onLongPress: widget.onLongPress,
                  onTap: widget.onPressed,
                  onHover: widget.onHover,
                  onFocusChange: widget.onFocusChange,
                  autofocus: widget.autofocus,
                  focusNode: widget.focusNode,
                  canRequestFocus: widget.onPressed != null,
                  mouseCursor: style.cursor.value,
                  child: YgAnimatedPadding(
                    padding: style.padding,
                    child: AlignTransition(
                      widthFactor: 1,
                      heightFactor: 1,
                      alignment: style.alignment,
                      child: DefaultTextStyleTransition(
                        style: style.textStyle,
                        child: YgAnimatedIconTheme(
                          iconTheme: _getMappedIconTheme(style, context),
                          child: widget.child,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  YgAnimatedProperty<IconThemeData> _getMappedIconTheme(YgBaseButtonStyle<T> style, BuildContext context) {
    return style.iconColor.map(
      (Color color) => IconTheme.of(context).copyWith(
        color: color,
      ),
    );
  }
}
