import 'package:yggdrasil/yggdrasil.dart';

/// Validates that a site name is at maximum 30 characters.
class SiteNameValidator extends YgCombinedValidator<String> {
  const SiteNameValidator({
    this.siteNameTooLongError,
  });

  /// The error shown when the site name is longer than 30 characters.
  ///
  /// Overrides the default error [YgDefaultValidatorErrors.siteNameTooLong].
  final String? siteNameTooLongError;

  @override
  List<YgFieldValidator<String>> getValidators(
    YgDefaultValidatorErrors defaults,
    String? value,
  ) {
    return <YgFieldValidator<String>>[
      MaxLengthValidator(
        max: 30,
        tooLongError: siteNameTooLongError ?? defaults.siteNameTooLong,
      ),
    ];
  }
}
