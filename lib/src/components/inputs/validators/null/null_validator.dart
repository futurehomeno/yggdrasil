import 'package:yggdrasil/yggdrasil.dart';

class NullValidator extends YgInputValidator<dynamic> {
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
