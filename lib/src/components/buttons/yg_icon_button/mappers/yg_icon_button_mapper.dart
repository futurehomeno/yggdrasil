import 'package:yggdrasil/src/components/buttons/yg_icon_button/enums/_enums.dart';
import 'package:yggdrasil/src/theme/icon_button/icon_button_theme.dart';

class YgIconButtonMapper {
  const YgIconButtonMapper._();

  static double buildSize({
    required YgIconButtonTheme theme,
    required YgIconButtonSize size,
  }) {
    return switch (size) {
      YgIconButtonSize.small => theme.sizeSmall,
      YgIconButtonSize.medium => theme.sizeMedium,
    };
  }

  static double buildIconSize({
    required YgIconButtonTheme theme,
    required YgIconButtonSize size,
  }) {
    return switch (size) {
      YgIconButtonSize.small => theme.iconSizeSmall,
      YgIconButtonSize.medium => theme.iconSizeMedium,
    };
  }
}
