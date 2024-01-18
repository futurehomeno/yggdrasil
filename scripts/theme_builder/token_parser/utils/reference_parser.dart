class ReferenceParser {
  const ReferenceParser._();

  static final RegExp _regex = RegExp(r'^{([^}]+)}$');

  // ignore: avoid-dynamic
  static List<String>? tryParse(dynamic data) {
    if (data is! String) {
      return null;
    }

    final RegExpMatch? match = _regex.firstMatch(data);
    if (match == null) {
      return null;
    }

    return match.group(1)?.split('.') ?? <String>[];
  }
}
