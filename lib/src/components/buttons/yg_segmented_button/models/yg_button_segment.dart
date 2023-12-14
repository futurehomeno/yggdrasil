import 'package:yggdrasil/yggdrasil.dart';

/// A segments of a [YgSegmentedButton].
class YgButtonSegment<T extends Object?> {
  const YgButtonSegment({
    required String this.label,
    required this.value,
    this.icon,
  });

  /// A segment with only an icon, so without a label.
  const YgButtonSegment.iconOnly({
    required YgColorableIconData this.icon,
    required this.value,
  }) : label = null;

  /// The value used to determine if this segment is selected.
  final T value;

  /// The label shown in this segment.
  final String? label;

  /// The icon shown in this segment.
  ///
  /// When using the [YgButtonSegment.iconOnly] constructor the icon will be
  /// shown at all times, when using the normal constructor the icon will only
  /// be shown when then segment is not selected.
  final YgColorableIconData? icon;
}
