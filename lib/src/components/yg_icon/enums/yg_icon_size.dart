import 'package:yggdrasil/yggdrasil.dart';

enum YgIconSize {
  smaller,
  small,
  large;

  double getIconSize(YgIconTheme iconThemes) {
    switch (this) {
      case smaller:
        return iconThemes.size.smaller;
      case small:
        return iconThemes.size.small;
      case large:
        return iconThemes.size.large;
    }
  }
}
