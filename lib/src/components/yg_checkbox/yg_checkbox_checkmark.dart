import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Checkmark used to indicated selected checkbox.
class YgCheckboxCheckmark extends StatelessWidget {
  const YgCheckboxCheckmark({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '<svg fill="none" height="8" viewBox="0 0 10 8" width="10" xmlns="http://www.w3.org/2000/svg"><path d="m1 4 3 3 5-6" stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"/></svg>',
      colorFilter: ColorFilter.mode(
        color,
        BlendMode.srcIn,
      ),
    );
  }
}
