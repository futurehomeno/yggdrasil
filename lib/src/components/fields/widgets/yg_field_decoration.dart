import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/fields/extensions/field_decoration/field_decoration_theme.dart';
import 'package:yggdrasil/src/theme/fields/field_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '../enums/_enums.dart';

class YgFieldDecoration extends StatelessWidget {
  const YgFieldDecoration({
    super.key,
    required this.content,
    required this.outlined,
    required this.error,
    required this.states,
    required this.suffix,
    required this.large,
  });

  final Widget content;
  final Widget? suffix;
  final String? error;
  final bool large;
  final bool outlined;
  final FieldStates states;

  @override
  Widget build(BuildContext context) {
    final Widget? suffix = this.suffix;
    final YgFieldTheme fieldTheme = context.fieldTheme;
    final YgFieldDecorationTheme theme = fieldTheme.decorationTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Positioned.fill(
              child: AnimatedContainer(
                duration: fieldTheme.animationDuration,
                curve: fieldTheme.animationCurve,
                decoration: BoxDecoration(
                  border: _getBorder(theme),
                  borderRadius: _getBorderRadius(theme),
                  color: _getBackgroundColor(theme),
                ),
              ),
            ),
            Padding(
              padding: _getChildPadding(theme),
              child: Row(
                children: <Widget>[
                  Expanded(child: content),
                  if (suffix != null)
                    Padding(
                      padding: _getSuffixPadding(theme),
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
        AnimatedSize(
          duration: fieldTheme.animationDuration,
          curve: fieldTheme.animationCurve,
          child: _buildErrorMessage(theme),
        ),
      ],
    );
  }

  Widget _buildErrorMessage(YgFieldDecorationTheme theme) {
    final String? error = this.error;

    if (states.disabled || error == null) {
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

  EdgeInsets _getSuffixPadding(YgFieldDecorationTheme theme) {
    if (outlined) {
      return theme.outlinedSuffixPadding;
    }

    return theme.standardSuffixPadding;
  }

  EdgeInsets _getChildPadding(YgFieldDecorationTheme theme) {
    // TODO(Tim): Have to find some better way to figure out the border size to
    // add to the padding.
    final EdgeInsets borderPadding = outlined
        ? const EdgeInsets.all(
            2.0,
          )
        : const EdgeInsets.only(
            bottom: 2,
          );

    final EdgeInsets base = switch (outlined) {
      true => switch (large) {
          true => theme.largeOutlinedContentPadding,
          false => theme.mediumOutlinedContentPadding,
        },
      false => switch (large) {
          true => theme.largeStandardContentPadding,
          false => theme.mediumStandardContentPadding,
        },
    };

    if (suffix == null) return base + borderPadding;

    return base.copyWith(
          right: 0,
        ) +
        borderPadding;
  }

  BorderRadius? _getBorderRadius(YgFieldDecorationTheme theme) {
    if (outlined) {
      return theme.borderRadius;
    }

    return null;
  }

  Border _getBorder(YgFieldDecorationTheme theme) {
    Border base = theme.borderDefault;

    if (states.disabled) {
      base = theme.borderDisabled;
    } else if (states.error) {
      base = theme.borderError;
    } else if (states.focused) {
      base = theme.borderFocus;
    } else if (states.hovered) {
      base = theme.borderHover;
    }

    if (outlined) {
      return base;
    }

    return Border(
      bottom: base.bottom,
    );
  }

  Color _getBackgroundColor(YgFieldDecorationTheme theme) {
    if (!outlined) {
      return Colors.transparent;
    }

    if (states.disabled) {
      return theme.backgroundDisabledColor;
    }
    if (states.error) {
      return theme.backgroundErrorColor;
    }

    return theme.backgroundDefaultColor;
  }
}
