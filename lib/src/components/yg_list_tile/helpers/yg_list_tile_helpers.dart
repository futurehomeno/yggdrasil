import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgListTileHelpers {
  const YgListTileHelpers._();

  static const int _allowedNumberOfLeadingWidgets = 2;
  static const int _allowedNumberOfTrailingWidgets = 2;
  static const int _allowedNumberOfSupportingWidgets = 2;

  static Widget? buildInfoButton(VoidCallback? onInfoTap) {
    if (onInfoTap == null) {
      return null;
    }

    return YgIconButton(
      onPressed: onInfoTap,
      size: YgIconButtonSize.small,
      icon: YgIcons.info,
    );
  }

  static Widget? buildLeading(
    YgListTileTheme theme,
    List<Widget>? leadingWidgets,
  ) {
    if (leadingWidgets == null || leadingWidgets.isEmpty) {
      return null;
    }

    assert(
      leadingWidgets.length <= _allowedNumberOfLeadingWidgets,
      'Cannot have more than 2 leading widgets.',
    );

    return Row(
      children: leadingWidgets.withHorizontalSpacing(
        theme.contentSpacing,
      ),
    );
  }

  static Widget? buildTrailing(
    YgListTileTheme theme,
    List<Widget>? trailingWidgets,
  ) {
    if (trailingWidgets == null || trailingWidgets.isEmpty) {
      return null;
    }

    assert(
      trailingWidgets.length <= _allowedNumberOfTrailingWidgets,
      'Cannot have more than 2 trailing widget.',
    );

    return Row(
      children: trailingWidgets.withHorizontalSpacing(
        theme.contentSpacing,
      ),
    );
  }

  static Widget? buildSupporting(
    YgListTileTheme theme,
    List<Widget>? supportingWidgets,
  ) {
    if (supportingWidgets == null || supportingWidgets.isEmpty) {
      return null;
    }

    assert(
      supportingWidgets.length <= _allowedNumberOfSupportingWidgets,
      'Cannot have more than 2 supporting widgets.',
    );

    return Column(
      children: supportingWidgets.withVerticalSpacing(
        theme.contentSpacing,
      ),
    );
  }
}
