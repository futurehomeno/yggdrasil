import 'package:yggdrasil/src/theme/_theme.dart';

enum YgIconTapSize {
  small,
  medium,
  large;

  double getTapSize(YgIconThemes iconThemes) {
    switch (this) {
      case small:
        return iconThemes.sizeSmall;
      case medium:
        return iconThemes.sizeMedium;
      case large:
        return iconThemes.sizeLarge;
    }
  }
}
