import 'dart:async';

import 'package:yggdrasil/src/components/fields/search/controller/yg_search_controller_mixin.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_result.dart';

abstract class YgBaseSearchProvider<Value, Result extends YgStringSearchResult> {
  YgBaseSearchSession<Value, Result, YgBaseSearchProvider<Value, Result>> createSession();
}

abstract class YgBaseSearchSession<Value, Result extends YgStringSearchResult,
    Provider extends YgBaseSearchProvider<Value, Result>> {
  YgSearchControllerAny<Value>? _controller;
  Provider? _provider;

  FutureOr<List<Result>?> buildResults(String query);

  void initSession() {}

  void dispose() {}

  YgSearchControllerAny<Value> get controller {
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

  void attach(YgSearchControllerAny<Value> controller, Provider provider) {
    _controller = controller;
    _provider = provider;
  }

  void detach() {
    _controller = null;
    _provider = null;
  }
}
