import 'package:flutter/widgets.dart';

extension SafeBuildExtension<T extends Object> on T? {
  R? safeBuild<R extends Widget>(R Function(T) callback) {
    final T? that = this;
    if (that == null) {
      return null;
    }

    return callback(that);
  }
}
