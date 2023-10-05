import 'package:yggdrasil/src/theme/_theme.dart';

enum YgIconButtonSize {
  small,
  medium;

  double buildSize(YgIconButtonTheme theme) {
    return switch (this) {
      YgIconButtonSize.small => theme.sizeSmall,
      YgIconButtonSize.medium => theme.sizeMedium,
    };
  }

  double buildIconSize(YgIconButtonTheme theme) {
    return switch (this) {
      YgIconButtonSize.small => theme.iconSizeSmall,
      YgIconButtonSize.medium => theme.iconSizeMedium,
    };
  }
}
