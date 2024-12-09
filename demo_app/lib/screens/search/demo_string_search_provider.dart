import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class DemoStringSearchProvider extends YgFuzzyStringSearchProvider {
  DemoStringSearchProvider({
    this.hint = false,
    this.loading = false,
  }) : super(
          items: _searchResults,
          noResultsBuilder: (_) => const SizedBox(),
        );

  // Random non existing addresses
  static const List<YgStringSearchItem> _searchResults = <YgStringSearchItem>[
    YgStringSearchItem(title: 'Aarhusvej, 1000, Berlin', icon: YgIcons.map),
    YgStringSearchItem(title: 'Akersgata, 1026, Munich', icon: YgIcons.map),
    YgStringSearchItem(title: 'Bakken, 1001, Stockholm', icon: YgIcons.map),
    YgStringSearchItem(title: 'Bjørnsonsvei, 1027, Helsinki', icon: YgIcons.map),
    YgStringSearchItem(title: 'Carl Johans gate, 1028, Oslo', icon: YgIcons.map),
    YgStringSearchItem(title: 'Christiansgade, 1002, Vienna', icon: YgIcons.map),
    YgStringSearchItem(title: 'Damsgårdsveien, 1029, Zurich', icon: YgIcons.map),
    YgStringSearchItem(title: 'Dronningensgate, 1003, Prague', icon: YgIcons.map),
    YgStringSearchItem(title: 'Eidsvolls plass, 1030, Brussels', icon: YgIcons.map),
    YgStringSearchItem(title: 'Elvegata, 1004, Warsaw', icon: YgIcons.map),
    YgStringSearchItem(title: 'Fjordveien, 1005, Amsterdam', icon: YgIcons.map),
    YgStringSearchItem(title: 'Frognerveien, 1031, Lisbon', icon: YgIcons.map),
    YgStringSearchItem(title: 'Gata, 1006, Madrid', icon: YgIcons.map),
    YgStringSearchItem(title: 'Gjerdrums vei 16, 2 etasje, 0484 Oslo, Norway', icon: YgIcons.map),
    YgStringSearchItem(title: 'Grønland, 1032, Budapest', icon: YgIcons.map),
    YgStringSearchItem(title: 'Hansensgate, 1007, Athens', icon: YgIcons.map),
    YgStringSearchItem(title: 'Haugesundgata, 1033, Sofia', icon: YgIcons.map),
    YgStringSearchItem(title: 'Ibsensgate, 1008, Dublin', icon: YgIcons.map),
    YgStringSearchItem(title: 'Industrigata, 1034, Riga', icon: YgIcons.map),
    YgStringSearchItem(title: 'Jernbanegata, 1009, Vilnius', icon: YgIcons.map),
    YgStringSearchItem(title: 'Johan Sverdrups gate, 1035, Tallinn', icon: YgIcons.map),
    YgStringSearchItem(title: 'Kirkegata, 1010, Copenhagen', icon: YgIcons.map),
    YgStringSearchItem(title: 'Kongsveien, 1036, Reykjavik', icon: YgIcons.map),
    YgStringSearchItem(title: 'Lilleveien, 1011, Paris', icon: YgIcons.map),
    YgStringSearchItem(title: 'Løkkegata, 1037, Rome', icon: YgIcons.map),
    YgStringSearchItem(title: 'Møllergata, 1012, Brussels', icon: YgIcons.map),
    YgStringSearchItem(title: 'Munkegata, 1038, Vienna', icon: YgIcons.map),
    YgStringSearchItem(title: 'Nedre gate, 1039, Warsaw', icon: YgIcons.map),
    YgStringSearchItem(title: 'Nygata, 1013, Amsterdam', icon: YgIcons.map),
    YgStringSearchItem(title: 'Operagata, 1040, Lisbon', icon: YgIcons.map),
    YgStringSearchItem(title: 'Osloveien, 1014, Madrid', icon: YgIcons.map),
    YgStringSearchItem(title: 'Parkveien, 1015, Budapest', icon: YgIcons.map),
    YgStringSearchItem(title: 'Prinsens gate, 1041, Athens', icon: YgIcons.map),
    YgStringSearchItem(title: 'Qvaleveien, 1042, Sofia', icon: YgIcons.map),
    YgStringSearchItem(title: 'Qvistgata, 1016, Dublin', icon: YgIcons.map),
    YgStringSearchItem(title: 'Rådhusgata, 1017, Riga', icon: YgIcons.map),
    YgStringSearchItem(title: 'Rosenkrantz gate, 1043, Vilnius', icon: YgIcons.map),
    YgStringSearchItem(title: 'Sandveien, 1018, Tallinn', icon: YgIcons.map),
    YgStringSearchItem(title: 'Sjøgata, 1044, Copenhagen', icon: YgIcons.map),
    YgStringSearchItem(title: 'Tollbugata, 1045, Reykjavik', icon: YgIcons.map),
    YgStringSearchItem(title: 'Torggata, 1019, Paris', icon: YgIcons.map),
    YgStringSearchItem(title: 'Uranienborgveien, 1046, Rome', icon: YgIcons.map),
    YgStringSearchItem(title: 'Utsiktsveien, 1020, Berlin', icon: YgIcons.map),
    YgStringSearchItem(title: 'Vassbotnen 11b, 4313 Sandnes, Norway', icon: YgIcons.map),
    YgStringSearchItem(title: 'Vestreveien, 1021, Munich', icon: YgIcons.map),
    YgStringSearchItem(title: 'Vikaveien, 1047, Stockholm', icon: YgIcons.map),
    YgStringSearchItem(title: 'Waldemar Thranes gate, 1048, Helsinki', icon: YgIcons.map),
    YgStringSearchItem(title: 'Wergelandsveien, 1022, Zurich', icon: YgIcons.map),
    YgStringSearchItem(title: 'Xenogata, 1049, Prague', icon: YgIcons.map),
    YgStringSearchItem(title: 'Xylogata, 1023, Brussels', icon: YgIcons.map),
    YgStringSearchItem(title: 'Ynglingveien, 1050, Vienna', icon: YgIcons.map),
    YgStringSearchItem(title: 'Ytreveien, 1024, Warsaw', icon: YgIcons.map),
    YgStringSearchItem(title: 'Zahlgata, 1051, Amsterdam', icon: YgIcons.map),
    YgStringSearchItem(title: 'Zinkgata, 1025, Lisbon', icon: YgIcons.map),
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
  YgStringSearchSession<DemoStringSearchProvider> createSession() {
    return DemoStringSearchSession(parent: super.createSession());
  }
}

class DemoStringSearchSession extends YgStringSearchSession<DemoStringSearchProvider> {
  DemoStringSearchSession({
    required this.parent,
  });

  final YgStringSearchSession<YgFuzzyStringSearchProvider> parent;

  @override
  Future<YgStringSearchResultsLayout?> buildResultsLayout(String query) async {
    if (provider.loading) {
      await Future<void>.delayed(const Duration(milliseconds: 500));
    }

    return parent.buildResultsLayout(query);
  }

  @override
  void attach(YgSearchControllerAny<String, String> controller, DemoStringSearchProvider provider) {
    super.attach(controller, provider);
    parent.attach(controller, provider);
  }

  @override
  void detach() {
    super.detach();
    parent.detach();
  }
}
