import '_models.dart';

final class TokenReference extends TokenObject {
  const TokenReference({
    required this.path,
  });

  final List<String> path;

  @override
  bool isStructurallyIdentical(TokenObject other) {
    return other is TokenReference;
  }
}
