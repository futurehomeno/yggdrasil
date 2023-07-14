import 'package:yggdrasil/yggdrasil.dart';

enum YgIconSize {
  small,
  large;

  double getIconSize(YgIconTheme iconThemes) {
    switch (this) {
      case small:
        return iconThemes.size.small;
      case large:
        return iconThemes.size.large;
    }
  }
}
