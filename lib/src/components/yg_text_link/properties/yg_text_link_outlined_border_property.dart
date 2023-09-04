import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class YgTextLinkOutlinedBorderProperty extends MaterialStateProperty<OutlinedBorder> with Diagnosticable {
  YgTextLinkOutlinedBorderProperty({
    required this.focusColor,
  });

  final Color focusColor;

  @override
  OutlinedBorder resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.focused)) {
      return RoundedRectangleBorder(
        side: BorderSide(
          color: focusColor,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      );
    }

    return const RoundedRectangleBorder(
      side: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    );
  }
}
