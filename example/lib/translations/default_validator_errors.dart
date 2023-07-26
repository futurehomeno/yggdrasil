import 'package:yggdrasil/yggdrasil.dart';

YgDefaultValidatorErrors buildDefaultValidatorErrors() {
  return const YgDefaultValidatorErrors(
    invalidEmail: 'Invalid email',
    required: 'This field is required',
    invalidHubSerial: 'Invalid hub serial',
    siteNameTooLong: 'A site name can not be longer than 30 characters',
    doormanPinCodeTooLong: 'Pin code has to be 6 characters',
    doormanPinCodeTooShort: 'Pin code has to be 6 characters',
    invalidZwaveParameterLength: 'Invalid zwave parameter length',
    phoneNumberInvalid: 'Phone number invalid',
    phoneNumberTooLong: 'Phone number too long',
    phoneNumberTooShort: 'Phone number too short',
    passwordsDoNotMatch: 'Passwords do not match',
    passwordTooShort: 'Password too short',
  );
}
