import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class DemoSearchProvider extends YgFuzzySimpleSearchProvider<int> {
  DemoSearchProvider({
    this.hint = false,
    this.loading = false,
  }) : super(
          items: searchResults,
          noResultsBuilder: (_) => const SizedBox(),
        );

  // Random non existing addresses
  static const List<YgSearchItem<int>> searchResults = <YgSearchItem<int>>[
    YgSearchItem<int>(title: 'Aarhusvej, 1000, Berlin', value: 0, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Akersgata, 1026, Munich', value: 1, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Bakken, 1001, Stockholm', value: 2, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Bjørnsonsvei, 1027, Helsinki', value: 3, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Carl Johans gate, 1028, Oslo', value: 4, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Christiansgade, 1002, Vienna', value: 5, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Damsgårdsveien, 1029, Zurich', value: 6, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Dronningensgate, 1003, Prague', value: 7, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Eidsvolls plass, 1030, Brussels', value: 8, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Elvegata, 1004, Warsaw', value: 9, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Fjordveien, 1005, Amsterdam', value: 10, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Frognerveien, 1031, Lisbon', value: 11, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Gata, 1006, Madrid', value: 12, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Gjerdrums vei 16, 2 etasje, 0484 Oslo, Norway', value: 13, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Grønland, 1032, Budapest', value: 14, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Hansensgate, 1007, Athens', value: 15, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Haugesundgata, 1033, Sofia', value: 16, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Ibsensgate, 1008, Dublin', value: 17, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Industrigata, 1034, Riga', value: 18, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Jernbanegata, 1009, Vilnius', value: 19, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Johan Sverdrups gate, 1035, Tallinn', value: 20, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Kirkegata, 1010, Copenhagen', value: 21, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Kongsveien, 1036, Reykjavik', value: 22, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Lilleveien, 1011, Paris', value: 23, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Løkkegata, 1037, Rome', value: 24, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Møllergata, 1012, Brussels', value: 25, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Munkegata, 1038, Vienna', value: 26, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Nedre gate, 1039, Warsaw', value: 27, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Nygata, 1013, Amsterdam', value: 28, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Operagata, 1040, Lisbon', value: 29, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Osloveien, 1014, Madrid', value: 30, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Parkveien, 1015, Budapest', value: 31, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Prinsens gate, 1041, Athens', value: 32, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Qvaleveien, 1042, Sofia', value: 33, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Qvistgata, 1016, Dublin', value: 34, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Rådhusgata, 1017, Riga', value: 35, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Rosenkrantz gate, 1043, Vilnius', value: 36, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Sandveien, 1018, Tallinn', value: 37, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Sjøgata, 1044, Copenhagen', value: 38, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Tollbugata, 1045, Reykjavik', value: 39, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Torggata, 1019, Paris', value: 40, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Uranienborgveien, 1046, Rome', value: 41, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Utsiktsveien, 1020, Berlin', value: 42, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Vassbotnen 11b, 4313 Sandnes, Norway', value: 43, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Vestreveien, 1021, Munich', value: 44, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Vikaveien, 1047, Stockholm', value: 45, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Waldemar Thranes gate, 1048, Helsinki', value: 46, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Wergelandsveien, 1022, Zurich', value: 47, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Xenogata, 1049, Prague', value: 48, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Xylogata, 1023, Brussels', value: 49, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Ynglingveien, 1050, Vienna', value: 50, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Ytreveien, 1024, Warsaw', value: 51, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Zahlgata, 1051, Amsterdam', value: 52, icon: YgIcons.map),
    YgSearchItem<int>(title: 'Zinkgata, 1025, Lisbon', value: 53, icon: YgIcons.map),
  ];

  final bool hint;
  final bool loading;

  @override
  WidgetBuilder get noResultsBuilder => _buildNoResults;
  Widget _buildNoResults(BuildContext context) {
    return const YgSectionHeader(
      title: 'No Results Found',
      subtitle: 'Try adjusting your search to find what you are looking for.',
    );
  }

  @override
  WidgetBuilder? get hintBuilder => hint ? _buildHint : null;
  Widget _buildHint(BuildContext context) {
    return const YgSectionHeader(
      title: 'Hint widget',
      subtitle: 'This widget can be used to help the user find what they need.',
    );
  }

  @override
  YgSimpleSearchSession<int, DemoSearchProvider> createSession() {
    return DemoSearchSession(parent: super.createSession());
  }
}

class DemoSearchSession extends YgSimpleSearchSession<int, DemoSearchProvider> {
  DemoSearchSession({
    required this.parent,
  });

  final YgSimpleSearchSession<int, YgSimpleSearchProvider<int>> parent;

  @override
  Future<YgSearchResultsLayout<int>?> buildResultsLayout(String query) async {
    if (provider.loading) {
      await Future<void>.delayed(const Duration(milliseconds: 500));
    }

    return parent.buildResultsLayout(query);
  }

  @override
  Future<String?>? getValueText(int value) async {
    if (provider.loading) {
      await Future<void>.delayed(const Duration(milliseconds: 500));
    }

    return parent.getValueText(value);
  }

  @override
  void attach(YgSearchControllerAny<int, int> controller, DemoSearchProvider provider) {
    super.attach(controller, provider);
    parent.attach(controller, provider);
  }

  @override
  void detach() {
    super.detach();
    parent.detach();
  }
}
