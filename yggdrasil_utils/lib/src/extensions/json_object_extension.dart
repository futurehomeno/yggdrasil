import 'package:yggdrasil_utils/yggdrasil_utils.dart';

extension JsonObjectExtension on JsonObject {
  T? safeValue<T>(String name) {
    final value = this[name];

    if (value is T) {
      return value;
    }

    return null;
  }

  JsonObject safeJsonObject(String name) => safeValue(name);
}
