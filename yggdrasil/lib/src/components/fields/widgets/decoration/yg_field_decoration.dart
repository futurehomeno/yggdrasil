import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/widgets/decoration/yg_field_decoration_style.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '../../yg_field_state.dart';

typedef ChildWrapperBuilder = Widget Function(BuildContext context, Widget child);

/// The decoration of any yggdrasil field widget.
///
/// Only decorates the outside of the field, the content will most likely be a
/// [YgFieldContent], but the content may also be a row of widgets as in
/// for example the phone number field, or any other field with more than one
/// value.
class YgFieldDecoration extends StatelessWidget {
  const YgFieldDecoration({
    super.key,
    required this.content,
    required this.error,
    required this.state,
    required this.suffix,
    this.builder,
  });

  final ChildWrapperBuilder? builder;

  /// The primary content in the field.
  final Widget content;

  /// The suffix shown next to the content in the field.
  final Widget? suffix;

  /// The error of the field.
  ///
  /// Will be displayed below the field and when shown or hidden, will
  /// animate the height of the field.
  final String? error;

  /// The current state of the field.
  final YgFieldState state;

  @override
  Widget build(BuildContext context) {
    return YgStyleBuilder<YgFieldDecorationStyle>(
      createStyle: (YgVsync vsync) => YgFieldDecorationStyle(
        state: state,
        vsync: vsync,
      ),
      builder: (BuildContext context, YgFieldDecorationStyle style) {
        final Widget? suffix = this.suffix;
        final YgFieldTheme fieldTheme = context.fieldTheme;
        final YgFieldDecorationTheme theme = fieldTheme.decorationTheme;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            YgAnimatedPhysicalModel(
              borderRadius: style.borderRadius,
              color: style.backgroundColor,
              clipBehavior: Clip.antiAlias,
              child: Material(
                color: Colors.transparent,
                child: _maybeUseBuilder(
                  context: context,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: YgAnimatedContainer(
                          decoration: style.boxDecoration,
                        ),
                      ),
                      YgAnimatedPadding(
                        padding: style.childPadding,
                        child: Row(
                          children: <Widget>[
                            Expanded(child: content),
                            if (suffix != null)
                              YgAnimatedPadding(
                                padding: style.suffixPadding,
                                // We do not want the suffix to be traversable because
                                // it breaks the next keyboard action.
                                child: Focus(
                                  descendantsAreTraversable: false,
                                  skipTraversal: true,
                                  canRequestFocus: false,
                                  child: suffix,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedSize(
              duration: fieldTheme.animationDuration,
              curve: fieldTheme.animationCurve,
              child: _buildErrorMessage(theme),
            ),
          ],
        );
      },
    );
  }

  Widget _maybeUseBuilder({
    required BuildContext context,
    required Widget child,
  }) {
    final ChildWrapperBuilder? builder = this.builder;

    if (builder == null) {
      return child;
    }

    return builder(context, child);
  }

  Widget _buildErrorMessage(YgFieldDecorationTheme theme) {
    final String? error = this.error;

    if (state.disabled.value || error == null) {
      return const FractionallySizedBox(
        widthFactor: 1,
      );
    }

    return Padding(
      padding: theme.errorPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: theme.errorIconPadding,
            child: SizedBox(
              height: theme.errorTextStyle.computedHeight,
              child: Center(
                child: YgIcon.colorable(
                  YgIcons.error,
                  size: YgIconSize.small,
                  color: theme.errorIconColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              error,
              style: theme.errorTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
