import 'package:yggdrasil/yggdrasil.dart';

class PasswordConfirmValidator extends CombinedValidator<String> {
  const PasswordConfirmValidator({
    this.passwordsDoNotMatchError,
    required this.otherPasswordFieldKey,
  });

  final String? passwordsDoNotMatchError;
  final TextFieldKey otherPasswordFieldKey;

  @override
  List<YgTextValidator> getValidators(YgDefaultValidatorErrors defaults, String? value) {
    return <YgTextValidator>[
      MatchValidator<String>(
        otherKeyField: otherPasswordFieldKey,
        error: passwordsDoNotMatchError ?? defaults.passwordsDoNotMatch,
      )
    ];
  }
}
