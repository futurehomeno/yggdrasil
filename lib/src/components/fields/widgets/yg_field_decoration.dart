import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '../enums/field_state.dart';
import 'yg_field_text_content.dart';

typedef ChildWrapperBuilder = Widget Function(BuildContext context, Widget child);

/// The decoration of any yggdrasil field widget.
///
/// Only decorates the outside of the field, the content will most likely be a
/// [YgFieldTextContent], but the content may also be a row of widgets as in
/// for example the phone number field, or any other field with more than one
/// value.
class YgFieldDecoration extends StatelessWidget {
  const YgFieldDecoration({
    super.key,
    required this.content,
    required this.variant,
    required this.error,
    required this.states,
    required this.suffix,
    required this.size,
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

  /// The size of the field.
  final YgFieldSize size;

  /// The variant of the field.
  final YgFieldVariant variant;

  /// The current states of the field.
  final FieldStates states;

  @override
  Widget build(BuildContext context) {
    final Widget? suffix = this.suffix;
    final YgFieldTheme fieldTheme = context.fieldTheme;
    final YgFieldDecorationTheme theme = fieldTheme.decorationTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Material(
          borderRadius: _getBorderRadius(theme),
          color: _getBackgroundColor(theme),
          clipBehavior: Clip.antiAlias,
          child: _maybeUseBuilder(
            context: context,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: AnimatedContainer(
                    duration: fieldTheme.animationDuration,
                    curve: fieldTheme.animationCurve,
                    decoration: BoxDecoration(
                      border: _getBorder(theme),
                      borderRadius: _getDecorationBorderRadius(theme),
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
          ),
        ),
        AnimatedSize(
          duration: fieldTheme.animationDuration,
          curve: fieldTheme.animationCurve,
          child: _buildErrorMessage(theme),
        ),
      ],
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
    if (variant == YgFieldVariant.outlined) {
      return theme.outlinedSuffixPadding;
    }

    return theme.standardSuffixPadding;
  }

  EdgeInsets _getChildPadding(YgFieldDecorationTheme theme) {
    // TODO(DEV-1915): Have to find some better way to figure out the border
    // size to add to the padding.
    final EdgeInsets borderPadding = switch (variant) {
      YgFieldVariant.outlined => const EdgeInsets.all(
          2.0,
        ),
      YgFieldVariant.standard => const EdgeInsets.only(
          bottom: 2,
        ),
    };

    final EdgeInsets base = switch (variant) {
      YgFieldVariant.outlined => switch (size) {
          YgFieldSize.large => theme.largeOutlinedContentPadding,
          YgFieldSize.medium => theme.mediumOutlinedContentPadding,
        },
      YgFieldVariant.standard => switch (size) {
          YgFieldSize.large => theme.largeStandardContentPadding,
          YgFieldSize.medium => theme.mediumStandardContentPadding,
        },
    };

    if (suffix == null) return base + borderPadding;

    return base.copyWith(
          right: 0,
        ) +
        borderPadding;
  }

  BorderRadius _getBorderRadius(YgFieldDecorationTheme theme) {
    switch (variant) {
      case YgFieldVariant.outlined:
        return theme.borderRadiusOutlined;
      case YgFieldVariant.standard:
        return theme.borderRadiusDefault;
    }
  }

  /// This method has to exist because a uneven border can not be applied when
  /// there is a border radius.
  BorderRadius? _getDecorationBorderRadius(YgFieldDecorationTheme theme) {
    switch (variant) {
      case YgFieldVariant.outlined:
        return theme.borderRadiusOutlined;
      case YgFieldVariant.standard:
        return null;
    }
  }

  Border _getBorder(YgFieldDecorationTheme theme) {
    Border base = theme.borderDefault;

    if (states.disabled) {
      base = theme.borderDisabled;
    } else if (states.error) {
      base = theme.borderError;
    } else if (states.focused || states.opened) {
      base = theme.borderFocus;
    } else if (states.hovered) {
      base = theme.borderHover;
    }

    if (variant == YgFieldVariant.outlined) {
      return base;
    }

    return Border(
      bottom: base.bottom,
    );
  }

  Color _getBackgroundColor(YgFieldDecorationTheme theme) {
    if (variant != YgFieldVariant.outlined) {
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
