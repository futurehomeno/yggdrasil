import 'package:flutter/material.dart';

/// When the widget should be automatically validated.
///
/// Similar to [AutovalidateMode], but different in that we have a [onComplete]
/// mode which flutter by default does not.
enum YgAutovalidate {
  /// No auto validation will occur.
  disabled,

  /// Used to auto-validate the [FormField] only after the user presses
  /// the keyboard action button.
  onComplete,

  /// Used to auto-validate the [FormField] even without user interaction.
  always,

  /// Used to auto-validate the [FormField] only after each user interaction.
  onUserInteraction,
}
