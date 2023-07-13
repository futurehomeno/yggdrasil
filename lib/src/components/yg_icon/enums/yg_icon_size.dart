import 'package:yggdrasil/yggdrasil.dart';

enum YgIconSize {
  smaller,
  small,
  medium;

  double getIconSize(YgIconTheme iconThemes) {
    switch (this) {
      case smaller:
        return iconThemes.size.smaller;
      case small:
        return iconThemes.size.small;
      case medium:
        return iconThemes.size.large;
    }
  }
}
