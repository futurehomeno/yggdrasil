import 'dart:async';

import 'package:yggdrasil/src/components/fields/search/controller/yg_search_controller.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_results_layout.dart';

abstract class YgBaseSearchProvider<Value, ResultValue, Result extends YgBaseSearchResult,
    ResultsLayout extends YgBaseSearchResultsLayout<Result>> {
  YgBaseSearchSession<Value, ResultValue, Result, ResultsLayout,
      YgBaseSearchProvider<Value, ResultValue, Result, ResultsLayout>> createSession();
}

abstract class YgBaseSearchSession<
    Value,
    ResultValue,
    Result extends YgBaseSearchResult,
    ResultsLayout extends YgBaseSearchResultsLayout<Result>,
    Provider extends YgBaseSearchProvider<Value, ResultValue, Result, ResultsLayout>> {
  YgSearchControllerAny<Value, ResultValue>? _controller;
  Provider? _provider;

  FutureOr<ResultsLayout?> buildResults(String query);

  void initSession() {}

  void dispose() {}

  YgSearchControllerAny<Value, ResultValue> get controller {
    assert(
      _controller != null,
      'Tried accessing controller while search session was not attached to a search controller.',
    );

    return _controller!;
  }

  Provider get provider {
    assert(
      _provider != null,
      'Tried accessing provider while search session was not attached to a search controller.',
    );

    return _provider!;
  }

  void attach(YgSearchControllerAny<Value, ResultValue> controller, Provider provider) {
    _controller = controller;
    _provider = provider;
  }

  void detach() {
    _controller = null;
    _provider = null;
  }
}
