import 'package:yggdrasil/src/theme/_theme.dart';

enum YgIconTapSize {
  larger,
  largest;

  double getTapSize(YgIconTheme iconThemes) {
    switch (this) {
      case larger:
        return iconThemes.tapSize.larger;
      case largest:
        return iconThemes.tapSize.largest;
    }
  }
}
