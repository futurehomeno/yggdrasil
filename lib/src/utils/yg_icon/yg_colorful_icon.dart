import 'yg_icon_data.dart';

/// An icon whose color is defined in the svg file.
///
/// See also [YgIcon].
abstract class YgColorfulIcon extends YgIconData {
  YgColorfulIcon({
    required super.name,
    required super.path,
  }) : super(colorful: true);
}
