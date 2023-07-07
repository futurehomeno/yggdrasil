import 'package:yggdrasil/yggdrasil.dart';

enum YgIconSize {
  small,
  medium;

  double getIconSize(YgIconThemes iconThemes) {
    switch (this) {
      case small:
        return iconThemes.sizeSmall;
      case medium:
        return iconThemes.sizeMedium;
    }
  }
}
