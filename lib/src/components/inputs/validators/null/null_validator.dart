import 'package:yggdrasil/yggdrasil.dart';

class NullValidator extends InputValidator<dynamic> {
  const NullValidator({
    required this.nullError,
  });

  final String nullError;

  @override
  String? validate(YgDefaultValidatorErrors defaults, dynamic value) {
    if (value == null) {
      return nullError;
    }

    return null;
  }
}
