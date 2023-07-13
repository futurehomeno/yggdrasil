import 'package:yggdrasil/yggdrasil.dart';

class YgDividerIndentMapper {
  static double getIndent(YgDividerIndent ygDividerIndent, YgDividerTheme theme) {
    switch (ygDividerIndent) {
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
