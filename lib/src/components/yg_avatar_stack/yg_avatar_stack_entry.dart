import 'package:flutter/material.dart';

/// An entry for a [YgAvatarStack].
class YgAvatarStackEntry {
  const YgAvatarStackEntry({
    required this.initials,
    this.image,
  });

  /// The initials shown in the avatar.
  ///
  /// Should normally only show the first character of the first name.
  final String initials;

  /// The background image for the avatar.
  ///
  /// When provided the initials will not be shown.
  final Widget? image;
}
