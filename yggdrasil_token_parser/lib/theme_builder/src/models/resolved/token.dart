import '_resolved.dart';

abstract class Token extends TokenObject {
  const Token({
    required this.description,
  });

  final String? description;
}
