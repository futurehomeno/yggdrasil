import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/search/controller/yg_search_controller.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_results_layout.dart';

/// Base class for all search providers.
abstract class YgBaseSearchProvider<Value, ResultValue, Result extends YgBaseSearchResult,
    ResultsLayout extends YgBaseSearchResultsLayout<Result>> {
  const YgBaseSearchProvider();

  YgBaseSearchSession<Value, ResultValue, Result, ResultsLayout,
      YgBaseSearchProvider<Value, ResultValue, Result, ResultsLayout>> createSession();
}

/// Base class for all search sessions.
abstract class YgBaseSearchSession<
    Value,
    ResultValue,
    Result extends YgBaseSearchResult,
    ResultsLayout extends YgBaseSearchResultsLayout<Result>,
    Provider extends YgBaseSearchProvider<Value, ResultValue, Result, ResultsLayout>> {
  YgSearchControllerAny<Value, ResultValue>? _controller;
  Provider? _provider;

  /// Called whenever the [query] changes.
  ///
  /// Should either synchronously or asynchronously build a results layout with
  /// all the results to be shown in the search widget.
  ///
  /// If this method returns a future, it will not get called again until the
  /// future has completed, this means in some cases this method might not get
  /// called for all search queries, however, if the search query has changed
  /// after this method has been called, it will always be called again.
  ///
  /// !-- IMPORTANT --
  /// Error handling should be handled by the user of this interface, the
  /// controller will not handle any errors by it self.
  FutureOr<ResultsLayout?> buildResultsLayout(String query);

  /// Called after this session has been created and attached to a provider.
  ///
  /// Can be used to initialize the search session.
  void initSession() {}

  /// Called when this session is getting disposed.
  ///
  /// If there are any server connections, they should be closed in this
  /// callback.
  void dispose() {}

  /// The search controller managing this search session.
  @mustCallSuper
  YgSearchControllerAny<Value, ResultValue> get controller {
    assert(
      _controller != null,
      'Tried accessing controller while search session was not attached to a search controller.',
    );

    return _controller!;
  }

  /// The search provider for this search session.
  ///
  /// Can be used to pass data from the search provider to the search session.
  @mustCallSuper
  Provider get provider {
    assert(
      _provider != null,
      'Tried accessing provider while search session was not attached to a search controller.',
    );

    return _provider!;
  }

  bool get attached => _controller != null && _provider != null;

  /// Internal method called to attach this session to a controller and provider.
  @mustCallSuper
  void attach(YgSearchControllerAny<Value, ResultValue> controller, Provider provider) {
    _controller = controller;
    _provider = provider;
  }

  /// Internal method called to detach this session from a controller and provider.
  @mustCallSuper
  void detach() {
    _controller = null;
    _provider = null;
  }
}
