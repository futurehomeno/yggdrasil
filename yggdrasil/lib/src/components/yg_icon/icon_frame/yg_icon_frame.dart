import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_icon/enums/_enums.dart';
import 'package:yggdrasil/src/components/yg_icon/icon_frame/yg_icon_frame_state.dart';
import 'package:yggdrasil/src/components/yg_icon/icon_frame/yg_icon_frame_style.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

typedef YgIconBuilder = Widget Function(BuildContext context, Color iconColor);

class YgIconFrame extends StatefulWidget {
  const YgIconFrame({
    super.key,
    required this.color,
    required this.size,
    required this.iconBuilder,
    required this.semanticLabel,
  });

  final Color? color;
  final YgIconSize? size;
  final YgIconBuilder iconBuilder;
  final String semanticLabel;

  @override
  State<YgIconFrame> createState() => _YgIconFrameState();
}

class _YgIconFrameState extends StateWithYgStateAndStyle<YgIconFrame, YgIconFrameState, YgIconFrameStyle> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticLabel,
      child: ExcludeSemantics(
        child: YgAnimatedSizedBox(
          size: style.size,
          child: Center(
            child: Align(
              alignment: Alignment.center,
              child: AnimatedBuilder(
                animation: style.color,
                builder: (BuildContext context, _) => widget.iconBuilder(
                  context,
                  style.color.value,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  YgIconFrameState createState() {
    return YgIconFrameState(
      color: widget.color,
      size: widget.size,
    );
  }

  @override
  YgIconFrameStyle createStyle() {
    return YgIconFrameStyle(
      state: state,
      vsync: this,
    );
  }

  @override
  void updateState() {
    state.color.value = widget.color;
    state.size.value = widget.size;
  }
}
