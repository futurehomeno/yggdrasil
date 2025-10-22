import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Mechanisms for enforcing maximum length limits.
///
/// Based on [MaxLengthEnforcement] but with an additional option of auto, to
/// be able to explicitly define the behavior of the text field without having
/// to rely on ambiguous behavior when passing a null value.
enum YgMaxLengthEnforcement {
  /// Platform based max length enforcement.
  ///
  /// Different platforms follow different behaviors by default, according to
  /// their native behavior.
  ///  * Android, Windows: [MaxLengthEnforcement.enforced]. The native behavior
  ///    of these platforms is enforced. The composing will be handled by the
  ///    IME while users are entering CJK characters.
  ///  * iOS: [MaxLengthEnforcement.truncateAfterCompositionEnds]. iOS has no
  ///    default behavior and it requires users implement the behavior
  ///    themselves. Allow the composition to exceed to avoid breaking CJK input.
  ///  * Web, macOS, linux, fuchsia:
  ///    [MaxLengthEnforcement.truncateAfterCompositionEnds]. These platforms
  ///    allow the composition to exceed by default.
  auto,

  /// No enforcement applied to the editing value.
  ///
  /// It's possible to exceed the max length (Default behavior for text fields).
  none,

  /// Keep the length of the text input from exceeding the max length even when
  /// the text has an unfinished composing region.
  enforced,

  /// Users can still input text if the current value is composing even after
  /// reaching the max length limit. After composing ends, the value will be
  /// truncated.
  truncateAfterCompositionEnds;

  /// Resolve the correct [MaxLengthEnforcement] based on the platform and
  /// this value.
  MaxLengthEnforcement resolve(BuildContext context) {
    return switch (this) {
      YgMaxLengthEnforcement.auto => LengthLimitingTextInputFormatter.getDefaultMaxLengthEnforcement(
        Theme.of(context).platform,
      ),
      YgMaxLengthEnforcement.none => MaxLengthEnforcement.none,
      YgMaxLengthEnforcement.enforced => MaxLengthEnforcement.enforced,
      YgMaxLengthEnforcement.truncateAfterCompositionEnds => MaxLengthEnforcement.truncateAfterCompositionEnds,
    };
  }
}
