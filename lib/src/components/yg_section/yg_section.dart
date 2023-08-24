import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/_components.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

part 'yg_section_base.dart';
part 'yg_section_column.dart';
part 'yg_section_header.dart';
part 'yg_section_list.dart';
part 'yg_section_padding.dart';

/// Responsible for applying correct padding to collections of widgets.
abstract class YgSection extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgSection._({
    this.title,
    this.subtitle,
  });

  /// When you have a single widgets that need to be padded.
  const factory YgSection.base({
    required Widget child,
    String? title,
    String? subtitle,
  }) = _YgSectionBase;

  /// When you have a column of widgets that need to be padded.
  const factory YgSection.column({
    required List<Widget> children,
    String? title,
    String? subtitle,
    MainAxisAlignment mainAxisAlignment,
    MainAxisSize mainAxisSize,
    CrossAxisAlignment crossAxisAlignment,
  }) = _YgSectionColumn;

  /// When you have a list of [YgListTiles] that should be in a section.
  ///
  /// There's no padding here as we want [YgListTiles] to be edge to edge.
  const factory YgSection.list({
    required List<YgListTile> children,
    String? title,
    String? subtitle,
    MainAxisAlignment mainAxisAlignment,
    MainAxisSize mainAxisSize,
    CrossAxisAlignment crossAxisAlignment,
  }) = _YgSectionList;

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final String? title = this.title;
    final String? subtitle = this.subtitle;
    final Widget child = buildChild(context);

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

  Widget buildChild(BuildContext context);
}
