import 'package:yggdrasil/yggdrasil.dart';

/// Validates that a site name is at maximum 30 characters.
class SiteNameValidator extends CombinedValidator<String> {
  const SiteNameValidator({
    this.siteNameTooLongError,
  });

  final String? siteNameTooLongError;

  @override
  List<YgInputValidator<String>> getValidators(
    YgDefaultValidatorErrors defaults,
    String? value,
  ) {
    return <YgInputValidator<String>>[
      MaxLengthValidator(
        max: 30,
        tooLongError: siteNameTooLongError ?? defaults.siteNameTooLong,
      ),
    ];
  }
}
