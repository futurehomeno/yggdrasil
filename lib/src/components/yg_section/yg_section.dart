import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/_components.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

part 'yg_section_header.dart';
part 'yg_section_padding.dart';

/// Responsible for applying correct padding to collections of widgets.
class YgSection extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgSection._({
    required this.child,
    this.title,
    this.subtitle,
  }) : assert(
          (title != null && subtitle != null) || (title == null && subtitle == null),
          'Title and subtitle must be both null or both not null.',
        );

  /// When you have a single widgets that need to be padded.
  factory YgSection.base({
    required Widget child,
    String? title,
    String? subtitle,
  }) {
    return YgSection._(
      title: title,
      subtitle: subtitle,
      child: _YgSectionPadding(
        child: child,
      ),
    );
  }

  /// When you have a column of widgets that need to be padded.
  factory YgSection.column({
    required List<Widget> children,
    String? title,
    String? subtitle,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  }) {
    return YgSection._(
      title: title,
      subtitle: subtitle,
      child: _YgSectionPadding(
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          children: children,
        ),
      ),
    );
  }

  /// When you have a list of [YgListTiles] that should be in a section.
  ///
  /// There's no padding here as we want [YgListTiles] to be edge to edge.
  factory YgSection.list({
    required List<YgListTile> children,
    String? title,
    String? subtitle,
  }) {
    return YgSection._(
      title: title,
      subtitle: subtitle,
      child: Column(
        children: children,
      ),
    );
  }

  final Widget child;
  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final String? title = this.title;
    final String? subtitle = this.subtitle;

    if (title == null) {
      return child;
    }

    return Column(
      children: <Widget>[
        _YgSectionHeader(
          title: title,
          subtitle: subtitle,
        ),
        child,
      ],
    );
  }
}
