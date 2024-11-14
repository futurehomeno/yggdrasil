import 'dart:async';

import 'package:yggdrasil/yggdrasil.dart';

abstract class YgSearchProvider<T> extends YgStringSearchProvider {
  @override
  FutureOr<List<YgSearchResult<T>>?> buildResults(String query);

  FutureOr<String?> buildResultText(T value);
}
