import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_section/widgets/_widgets.dart';
import 'package:yggdrasil/yggdrasil.dart';

part 'yg_section_column.dart';
part 'yg_section_list.dart';
part 'yg_section_regular.dart';

/// Responsible for applying correct padding to collections of widgets.
abstract class YgSection extends StatelessWidget with StatelessWidgetDebugMixin {
  /// A section with a single child.
  const factory YgSection({
    required Widget child,
    String? subtitle,
    Widget? trailing,
    String? title,
    YgColorableIconData? icon,
  }) = _YgSectionRegular;

  /// A section with a column of children.
  const factory YgSection.column({
    required List<Widget> children,
    String? subtitle,
    Widget? trailing,
    String? title,
    YgColorableIconData? icon,
    CrossAxisAlignment crossAxisAlignment,
  }) = _YgSectionColumn;

  /// A section with a list of [YgListTile] widgets.
  ///
  /// Unlike the other constructors, does not apply padding to its children as
  /// list tiles are responsible for providing their own padding and should
  /// extend to the edges of the screen.
  const factory YgSection.list({
    required List<Widget> children,
    String? subtitle,
    Widget? trailing,
    String? title,
    YgColorableIconData? icon,
  }) = _YgSectionList;

  const YgSection._({
    super.key,
    this.title,
    this.subtitle,
    this.trailing,
    this.icon,
  }) : assert(
          title != null || (subtitle == null && trailing == null && icon == null),
          'subtitle, tag or icon cannot be set without a title.',
        );

  @override
  Widget build(BuildContext context) {
    final String? title = this.title;
    final String? subtitle = this.subtitle;
    final Widget child = buildChild(context);

    if (title == null) {
      return child;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        YgSectionHeaderInternal(
          title: title,
          subtitle: subtitle,
          icon: icon,
          tag: trailing,
          trailing: null,
        ),
        child,
      ],
    );
  }

  /// Title of the section.
  final String? title;

  /// Subtitle of the section.
  ///
  /// You cannot have a subtitle without a title.
  final String? subtitle;

  /// The widget trailing the section.
  ///
  /// You cannot have a trailing widget without a title.
  final Widget? trailing;

  /// The icon leading the section.
  ///
  /// You cannot have an icon without a title.
  final YgIconData? icon;

  /// Builds the child widget.
  Widget buildChild(BuildContext context);

  @override
  YgDebugType get debugType => YgDebugType.layout;
}
