import 'package:yggdrasil/yggdrasil.dart';

class PasswordConfirmValidator extends CombinedValidator<String> {
  const PasswordConfirmValidator({
    this.passwordsDoNotMatchError,
    required this.otherPasswordFieldKey,
  });

  final String? passwordsDoNotMatchError;
  final TextFieldKey otherPasswordFieldKey;

  @override
  List<TextValidator> getValidators(YgDefaultValidatorErrors defaults, String? value) {
    return <TextValidator>[
      ConfirmValidator<String>(
        otherKeyField: otherPasswordFieldKey,
        error: passwordsDoNotMatchError ?? defaults.passwordsDoNotMatch,
      )
    ];
  }
}
