import 'package:yggdrasil/src/components/inputs/validators/_validators.dart';

class PasswordValidator extends CombinedValidator<String> {
  const PasswordValidator({
    this.passwordTooShortError,
  });

  final String? passwordTooShortError;

  @override
  List<TextValidator> getValidators(YgDefaultValidatorErrors defaults, String? value) {
    return <TextValidator>[
      MinLengthValidator(
        min: 8,
        toShortError: passwordTooShortError ?? defaults.passwordTooShort,
      ),
    ];
  }
}
