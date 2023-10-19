import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/widgets/decoration/yg_field_decoration_style.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '../../enums/yg_field_state.dart';
import '../content/yg_field_content.dart';

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
    required this.variant,
    required this.error,
    required this.statesController,
    required this.suffix,
    required this.size,
    required this.onPressed,
  });

  /// The primary content in the field.
  final Widget content;

  /// The suffix shown next to the content in the field.
  final Widget? suffix;

  /// The error of the field.
  ///
  /// Will be displayed below the field and when shown or hidden, will
  /// animate the height of the field.
  final String? error;

  /// The size of the field.
  final YgFieldSize size;

  /// The variant of the field.
  final YgFieldVariant variant;

  /// The current states of the field.
  final YgStatesController<YgFieldState> statesController;

  /// Called when the field is pressed.
  ///
  /// !--- WARNING ---
  /// Only use when the field decoration functions as a button, rather than a
  /// container for child widgets which can request focus or handle clicks by
  /// themselves, as these will not, and should not, trigger this callback and
  /// its accompanying ink ripple.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return YgStyleBuilder(
      createStyle: (YgVsync vsync) => YgFieldDecorationStyle(
        controller: statesController,
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
              child: _maybeWrapWithInkwell(
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

  Widget _maybeWrapWithInkwell({
    required Widget child,
  }) {
    if (onPressed == null) {
      return child;
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return YgNoFocus(
          child: InkResponse(
            splashFactory: InkRipple.splashFactory,
            radius: constraints.maxWidth,
            mouseCursor: SystemMouseCursors.click,
            onTap: onPressed,
            canRequestFocus: false,
            hoverColor: Colors.transparent,
            child: child,
          ),
        );
      },
    );
  }

  Widget _buildErrorMessage(YgFieldDecorationTheme theme) {
    final String? error = this.error;

    if (statesController.value.disabled || error == null) {
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
                child: YgIcon(
                  YgIcons.error,
                  size: YgIconSize.small,
                  color: theme.errorIconColor,
                ),
              ),
            ),
          ),
          Text(
            error,
            style: theme.errorTextStyle,
          ),
        ],
      ),
    );
  }
}
