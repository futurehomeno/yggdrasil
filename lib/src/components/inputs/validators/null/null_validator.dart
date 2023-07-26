import 'package:yggdrasil/yggdrasil.dart';

class NullValidator extends YgInputValidator<dynamic> {
  NullValidator({
    required this.error,
  });

  final String error;

  @override
  String? validate(YgDefaultValidatorErrors defaults, dynamic value) {
    if (value == null) {
      return error;
    }

    return null;
  }
}
