import 'dart:async';

import 'package:yggdrasil/src/components/fields/search/models/yg_string_search_result.dart';

abstract class YgStringSearchProvider {
  FutureOr<List<YgStringSearchResult>?> buildResults(String query);

  void searchStarted() {}

  void searchEnded() {}
}
