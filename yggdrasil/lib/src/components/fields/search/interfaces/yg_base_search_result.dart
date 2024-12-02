import 'package:yggdrasil/src/utils/_utils.dart';

class YgBaseSearchResult {
  const YgBaseSearchResult({
    required this.title,
    this.icon,
    this.subtitle,
  });

  /// The title of the entry.
  ///
  /// This will be shown in the search results, and as the value in the field
  /// when the user selects this entry.
  final YgFormattedText title;

  /// The subtitle of the entry.
  ///
  /// !--- WARNING ---
  /// The subtitle is only shown in the search results, and
  /// NOT in the field itself, therefore they should NOT be used as the main
  /// identifier of the entry as the user will not be able to identify the
  /// selected value from looking at the field itself.
  final YgFormattedText? subtitle;

  /// The icon of the entry.
  ///
  /// !--- WARNING ---
  /// The icon is only shown in the search results, and
  /// NOT in the field itself, therefore they should NOT be used as the main
  /// identifier of the entry as the user will not be able to identify the
  /// selected value from looking at the field itself.
  final YgIconData? icon;
}
