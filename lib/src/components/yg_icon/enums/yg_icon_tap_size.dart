import 'package:yggdrasil/src/theme/_theme.dart';

enum YgIconTapSize {
  large,
  larger,
  largest;

  double getTapSize(YgIconTheme iconThemes) {
    switch (this) {
      case large:
        return iconThemes.tapSize.large;
      case larger:
        return iconThemes.tapSize.larger;
      case largest:
        return iconThemes.tapSize.largest;
    }
  }
}
