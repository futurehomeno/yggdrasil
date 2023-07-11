import 'package:yggdrasil/src/theme/_theme.dart';

enum YgIconTapSize {
  small,
  large,
  larger,
  largest;

  double getTapSize(YgIconThemes iconThemes) {
    switch (this) {
      case small:
        return iconThemes.sizeSmall;
      case large:
        return iconThemes.sizeLarge;
      case larger:
        return iconThemes.sizeLarger;
      case largest:
        return iconThemes.sizeLargest;
    }
  }
}
