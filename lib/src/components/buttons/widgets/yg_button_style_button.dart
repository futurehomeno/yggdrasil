import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/enums/yg_button_state.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import '_widgets.dart';

typedef YbButtonStyleCreator = YgButtonStyle Function(YgVsync vsync, YgStatesController<YgButtonState> controller);

class YgButtonStyleButton extends StatefulWidget with StatefulWidgetDebugMixin {
  const YgButtonStyleButton({
    super.key,
    required this.child,
    required this.onPressed,
    required this.createStyle,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.autofocus = false,
  });

  final YbButtonStyleCreator createStyle;
  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final FocusNode? focusNode;
  final bool autofocus;

  @override
  State<YgButtonStyleButton> createState() => _YgButtonStyleButtonState();
}

class _YgButtonStyleButtonState extends State<YgButtonStyleButton> {
  late final YgStatesController<YgButtonState> _controller = YgStatesController<YgButtonState>({
    if (widget.onPressed == null) YgButtonState.disabled,
  });

  late final YgStatesMaterialStatesProxyController<YgButtonState> _proxyController =
      YgStatesMaterialStatesProxyController<YgButtonState>(
    parentController: _controller,
    statesMap: <YgButtonState, MaterialState>{
      YgButtonState.disabled: MaterialState.disabled,
      YgButtonState.hovered: MaterialState.hovered,
      YgButtonState.pressed: MaterialState.pressed,
    },
  );

  @override
  void didUpdateWidget(covariant YgButtonStyleButton oldWidget) {
    _controller.update(YgButtonState.disabled, widget.onPressed == null);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    _proxyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YgStyleBuilder(
      createStyle: (YgVsync vsync) => widget.createStyle(vsync, _controller),
      builder: (BuildContext context, YgButtonStyle style) {
        return ConstrainedBox(
          constraints: style.constraints.value,
          child: YgAnimatedPhysicalModel(
            color: style.color,
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
                  child: YgAnimatedPadding(
                    padding: style.padding,
                    child: AlignTransition(
                      widthFactor: 1,
                      heightFactor: 1,
                      alignment: style.alignment,
                      child: widget.child,
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
}
