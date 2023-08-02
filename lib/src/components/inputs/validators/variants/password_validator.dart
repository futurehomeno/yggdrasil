import 'package:yggdrasil/src/components/inputs/validators/_validators.dart';

class PasswordValidator extends CombinedValidator<String> {
  const PasswordValidator({
    this.passwordTooShortError,
  });

  final String? passwordTooShortError;

  @override
  List<YgTextValidator> getValidators(YgDefaultValidatorErrors defaults, String? value) {
    return <YgTextValidator>[
      MinLengthValidator(
        min: 8,
        tooShortError: passwordTooShortError ?? defaults.passwordTooShort,
      ),
    ];
  }
}
