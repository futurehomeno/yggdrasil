import 'package:yggdrasil/yggdrasil.dart';

enum YgIconSize {
  smaller,
  small,
  medium;

  double getIconSize(YgIconThemes iconThemes) {
    switch (this) {
      case smaller:
        return iconThemes.sizeSmaller;
      case small:
        return iconThemes.sizeSmall;
      case medium:
        return iconThemes.sizeLarge;
    }
  }
}
