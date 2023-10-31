import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

extension YgNullableDrivenPropertyExtension<V> on YgDrivenProperty<V>? {
  /// Assign a default value if a property is null.
  YgDrivenProperty<V> orDefault(V defaultValue) {
    return YgDrivenProperty<V>.all(
      value: defaultValue,
    );
  }
}
