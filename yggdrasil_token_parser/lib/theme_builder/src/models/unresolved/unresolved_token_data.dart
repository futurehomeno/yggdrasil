import '_unresolved.dart';

class UnresolvedTokenData {
  const UnresolvedTokenData({
    required this.children,
    required this.extending,
  });

  final String? extending;
  final Map<String, UnresolvedTokenObject> children;
}
