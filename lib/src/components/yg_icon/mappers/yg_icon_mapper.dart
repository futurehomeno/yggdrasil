import 'package:yggdrasil/src/components/yg_icon/_yg_icon.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgIconMapper {
  const YgIconMapper._();

  static double getIconSize({
    required YgIconTheme iconTheme,
    required YgIconSize iconSize,
  }) {
    switch (iconSize) {
      case YgIconSize.smaller:
        return iconTheme.size.smaller;
      case YgIconSize.small:
        return iconTheme.size.small;
      case YgIconSize.medium:
        return iconTheme.size.large;
    }
  }

  static double getTapSize({
    required YgIconTheme iconTheme,
    required YgIconTapSize tapSize,
  }) {
    switch (tapSize) {
      case YgIconTapSize.large:
        return iconTheme.tapSize.large;
      case YgIconTapSize.larger:
        return iconTheme.tapSize.larger;
      case YgIconTapSize.largest:
        return iconTheme.tapSize.largest;
    }
  }
}
