import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// An iOS settings like section.
///
/// Renders every [YgSettingGroup] as a card on a weak background, with the
/// group name as a header above the card. Groups without positions are not
/// rendered.
class YgSettingSection extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgSettingSection({
    super.key,
    required this.groups,
  });

  /// The groups shown in the section.
  final List<YgSettingGroup> groups;

  @override
  Widget build(BuildContext context) {
    final YgDimension dimensions = context.tokens.dimensions;
    final List<YgSettingGroup> visibleGroups = groups
        .where((YgSettingGroup group) => group.positions.isNotEmpty)
        .toList();

    return ColoredBox(
      color: context.tokens.colors.backgroundWeak,
      child: Padding(
        padding: EdgeInsets.all(dimensions.sm),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            for (int index = 0; index < visibleGroups.length; index++)
              Padding(
                padding: EdgeInsets.only(
                  top: index == 0 ? 0 : dimensions.lg,
                ),
                child: _YgSettingGroupWidget(group: visibleGroups[index]),
              ),
          ],
        ),
      ),
    );
  }

  @override
  YgDebugType get debugType => YgDebugType.layout;
}

class _YgSettingGroupWidget extends StatelessWidget {
  const _YgSettingGroupWidget({
    required this.group,
  });

  final YgSettingGroup group;

  @override
  Widget build(BuildContext context) {
    final YgTokens tokens = context.tokens;
    final String? name = group.name;
    final List<Widget> positions = group.positions;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (name != null)
          Padding(
            padding: EdgeInsets.only(
              left: tokens.dimensions.md,
              right: tokens.dimensions.md,
              bottom: tokens.dimensions.xxs,
            ),
            child: Text(
              name.toUpperCase(),
              style: tokens.textStyles.paragraph3Medium.copyWith(
                color: tokens.colors.textWeak,
                letterSpacing: 1.0,
              ),
            ),
          ),
        Material(
          color: tokens.colors.backgroundDefault,
          borderRadius: tokens.radii.md,
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              for (int index = 0; index < positions.length; index++) ...<Widget>[
                if (index > 0) const YgDivider(),
                positions[index],
              ],
            ],
          ),
        ),
      ],
    );
  }
}
