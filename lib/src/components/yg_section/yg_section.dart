import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/yg_tag/yg_tag.dart';
import 'package:yggdrasil/src/components/yg_icon/yg_icon.dart';
import 'package:yggdrasil/src/components/yg_list_tile/yg_list_tile.dart';
import 'package:yggdrasil/src/extensions/widget_list_extension.dart';
import 'package:yggdrasil/src/icons/_icons.dart';
import 'package:yggdrasil/src/theme/section/extensions/section_header_theme.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

part 'expanding/yg_expanding_section.dart';
part 'expanding/yg_expanding_section_base.dart';
part 'expanding/yg_expanding_section_column.dart';
part 'expanding/yg_expanding_section_list.dart';
part 'regular/yg_section_base.dart';
part 'regular/yg_section_column.dart';
part 'regular/yg_section_list.dart';
part 'regular/yg_section_regular.dart';
part 'yg_section_header.dart';

/// Responsible for applying correct padding to collections of widgets.
abstract class YgSection extends StatelessWidget with StatelessWidgetDebugMixin {
  /// When you have a single widgets that need to be padded.
  const factory YgSection({
    required Widget child,
    String? subtitle,
    YgTag? tag,
    String? title,
    YgIcon? icon,
  }) = _YgSectionRegular;

  /// When you have a column of widgets that need to be padded.
  const factory YgSection.column({
    required List<Widget> children,
    String? subtitle,
    YgTag? tag,
    String? title,
    YgIcon? icon,
  }) = _YgSectionColumn;

  /// When you have a list of [YgListTiles] that should be in a section.
  ///
  /// There's no padding here as we want [YgListTiles] to be edge to edge.
  const factory YgSection.list({
    required List<YgListTile> children,
    String? subtitle,
    YgTag? tag,
    String? title,
    YgIcon? icon,
  }) = _YgSectionList;

  const factory YgSection.expanding({
    required Widget child,
    required String title,
    YgExpansionController? controller,
    bool initiallyExpanded,
    Key? key,
    String? subtitle,
    YgTag? tag,
    YgIcon? icon,
  }) = _YgExpandingSection;

  const factory YgSection.expandingList({
    required List<YgListTile> children,
    required String title,
    YgExpansionController? controller,
    bool initiallyExpanded,
    Key? key,
    String? subtitle,
    YgTag? tag,
    YgIcon? icon,
  }) = _YgExpandingSectionList;

  const factory YgSection.expandingColumn({
    required List<YgListTile> children,
    required String title,
    YgExpansionController? controller,
    bool initiallyExpanded,
    Key? key,
    String? subtitle,
    YgTag? tag,
    YgIcon? icon,
  }) = _YgExpandingSectionColumn;

  const YgSection._({
    super.key,
    this.title,
    this.subtitle,
    this.tag,
    this.icon,
  }) : assert(
          title != null || (subtitle == null && tag == null),
          'Subtitle and tag cannot be set without a title.',
        );

  /// Title of the section.
  final String? title;

  /// Subtitle of the section.
  ///
  /// You cannot have a subtitle without a title.
  final String? subtitle;

  /// The tag trailing the section.
  final YgTag? tag;

  /// The icon leading the section.
  final YgIcon? icon;

  /// Builds the child widget.
  Widget buildChild(BuildContext context);

  @override
  YgDebugType get debugType => YgDebugType.layout;
}
