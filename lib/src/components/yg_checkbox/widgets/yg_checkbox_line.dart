import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Line used to indicate null value in a checkbox.
class YgCheckboxLine extends StatelessWidget {
  const YgCheckboxLine({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '<svg fill="none" height="2" viewBox="0 0 10 2" width="10" xmlns="http://www.w3.org/2000/svg"><path d="m1 1h8" stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"/></svg>',
      colorFilter: ColorFilter.mode(
        color,
        BlendMode.srcIn,
      ),
    );
  }
}
