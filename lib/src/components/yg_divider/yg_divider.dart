import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Simple divider based on [Divider] from M3.
class YgDivider extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgDivider({
    super.key,
    this.indent = YgDividerIndent.none,
    this.endIndent = YgDividerIndent.none,
  });

  /// The amount of empty space to the leading edge of the divider.
  final YgDividerIndent indent;

  /// The amount of empty space to the trailing edge of the divider.
  final YgDividerIndent endIndent;

  @override
  Widget build(BuildContext context) {
    final YgDividerTheme theme = context.dividerTheme;

    return SizedBox(
      height: 1.0,
      child: Center(
        child: Container(
          height: 1.0,
          margin: EdgeInsetsDirectional.only(
            start: YgDividerMapper.getIndent(indent, theme),
            end: YgDividerMapper.getIndent(endIndent, theme),
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: context.dividerTheme.color,
                width: 1.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
