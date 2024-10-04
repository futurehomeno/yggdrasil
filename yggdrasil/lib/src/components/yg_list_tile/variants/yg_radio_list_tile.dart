import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_list_tile/enums/yg_list_tile_density.dart';
import 'package:yggdrasil/src/components/yg_list_tile/widgets/yg_list_tile_body.dart';
import 'package:yggdrasil/src/components/yg_radio/yg_radio.dart';
import 'package:yggdrasil/src/extensions/string_extension.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// Radio button inside a list tile.
final class YgRadioListTile<T> extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgRadioListTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.title,
    this.subtitle,
    this.subtitleIcon,
    this.leadingWidget,
    this.density = YgListTileDensity.standard,
  })  : assert(
          title != null || leadingWidget != null,
          'Can not have neither a title or leading widget.',
        ),
        assert(
          subtitleIcon == null || subtitle != null,
          'Can not add a subtitleIcon without a subtitle.',
        ),
        assert(
          title != null || subtitle == null,
          'Can not have a subtitle without a title.',
        );

  /// See [YgRadio.value].
  final T value;

  /// See [YgRadio.groupValue].
  final T? groupValue;

  /// See [YgRadio.onChanged].
  final ValueChanged<T?>? onChanged;

  /// Optional leading widget.
  ///
  /// When provided the [YgRadio] will be moved to the trailing position.
  final Widget? leadingWidget;

  /// The title.
  ///
  /// Shown in the middle of the list tile when there is no [subtitle], will be
  /// pushed to the top of the list tile if there is a [subtitle].
  final String? title;

  /// The subtitle.
  ///
  /// Shown below the [title].
  final String? subtitle;

  /// Small icon shown in front of [subtitle].
  ///
  /// Can not be provided when there is no subtitle.
  final Widget? subtitleIcon;

  /// The density of the list tile.
  ///
  /// Defaults to [YgListTileDensity.standard].
  final YgListTileDensity density;

  @override
  Widget build(BuildContext context) {
    return YgListTileBody.withChildAndOptionalLeading(
      density: density,
      title: title.asText(),
      subtitle: subtitle.asText(),
      subtitleIcon: subtitleIcon,
      disabled: onChanged == null,
      onTap: _onTap,
      leading: leadingWidget,
      supporting: null,
      infoButton: null,
      builder: null,
      child: AbsorbPointer(
        child: YgNoFocus(
          child: YgRadio<T>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }

  void _onTap() {
    onChanged?.call(value);
  }

  @override
  YgDebugType get debugType {
    if (onChanged == null) {
      return YgDebugType.other;
    }

    return YgDebugType.intractable;
  }
}
