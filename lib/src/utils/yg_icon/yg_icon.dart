import 'yg_icon_data.dart';

/// An icon whose color can be overwritten.
///
/// See also [YgColoredIcon].
abstract class YgIcon extends YgIconData {
  YgIcon({
    required super.name,
    required super.path,
  }) : super(colorful: false);
}
