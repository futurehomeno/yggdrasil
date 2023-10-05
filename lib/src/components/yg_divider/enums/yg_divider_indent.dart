import 'package:yggdrasil/src/theme/_theme.dart';

enum YgDividerIndent {
  none,
  small,
  medium,
  large;

  double getIndent(YgDividerTheme theme) {
    switch (this) {
      case YgDividerIndent.none:
        return 0.0;
      case YgDividerIndent.small:
        return theme.indentSmall;
      case YgDividerIndent.medium:
        return theme.indentMedium;
      case YgDividerIndent.large:
        return theme.indentLarge;
    }
  }
}
