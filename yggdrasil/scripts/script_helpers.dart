class ScriptHelpers {
  const ScriptHelpers._();

  /// Converts [text] to camelCase.
  ///
  /// Replaces hyphens and underscores with spaces, then capitalizes the
  /// first character of each word (except the first word).
  /// Finally, removes the spaces to form a single word.
  static String toCamelCase(String text) {
    final String normalizedText = text.replaceAll('-', '_');

    return normalizedText.split('_').asMap().entries.map((MapEntry<int, String> entry) {
      if (entry.key == 0) return entry.value;

      return '${entry.value[0].toUpperCase()}${entry.value.substring(1)}';
    }).join();
  }

  static String toTitleCase(String text) {
    final String normalizedText = text.replaceAll('-', '_');

    return normalizedText.split('_').asMap().entries.map((MapEntry<int, String> entry) {
      return '${entry.value[0].toUpperCase()}${entry.value.substring(1)}';
    }).join();
  }
}
