import 'package:yggdrasil/src/theme/_theme.dart';

enum YgIconSize {
  small,
  large;

  double getIconSize(YgIconTheme iconTheme) {
    switch (this) {
      case YgIconSize.small:
        return iconTheme.size.small;
      case YgIconSize.large:
        return iconTheme.size.large;
    }
  }
}
