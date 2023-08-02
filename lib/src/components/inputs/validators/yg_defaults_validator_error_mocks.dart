import '_validators.dart';

class YgDefaultsValidatorErrorMocks {
  static const YgDefaultValidatorErrors valid = YgDefaultValidatorErrors(
    invalidEmail: 'default_mock_invalid_email',
    required: 'default_mock_required',
    invalidHubSerial: 'default_mock_invalid_hub_serial',
    siteNameTooLong: 'default_mock_site_name_too_long',
    doormanPinCodeTooLong: 'default_mock_doorman_pin_code_too_long',
    doormanPinCodeTooShort: 'default_mock_doorman_pin_code_too_short',
    invalidZwaveParameterLength: 'default_mock_invalid_zwave_parameter_length',
    phoneNumberInvalid: 'default_mock_phone_number_invalid',
    phoneNumberTooLong: 'default_mock_phone_number_too_long',
    phoneNumberTooShort: 'default_mock_phone_number_too_short',
    passwordsDoNotMatch: 'default_mock_passwords_do_not_match',
    passwordTooShort: 'default_mock_password_too_short',
  );
}
