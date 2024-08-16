import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Placeholder widget.
///
/// Mimics the style of the placeholder widget in figma to make it clear for
/// designers that this is a placeholder.
class DemoPlaceholder extends StatelessWidget {
  const DemoPlaceholder({
    super.key,
    this.width,
    this.height,
  });

  /// The width of the placeholder.
  ///
  /// When not provided and width constraints are finite will take up the
  /// maximum possible width. Will take up the minimum amount of space possible
  /// required to properly render the icon if width constraints are infinite.
  final double? width;

  /// The height of the placeholder.
  ///
  /// When not provided and height constraints are finite will take up the
  /// maximum possible height. Will take up the minimum amount of space possible
  /// required to properly render the icon if height constraints are infinite.
  final double? height;

  @override
  Widget build(BuildContext context) {
    return YgFiniteExpandingBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromRGBO(163, 65, 255, 0.15),
        ),
        child: DottedBorder(
          borderPadding: const EdgeInsets.all(0.5),
          padding: const EdgeInsets.all(5),
          borderType: BorderType.RRect,
          color: const Color(0xffA341FF),
          strokeCap: StrokeCap.round,
          dashPattern: const <double>[3, 5],
          radius: const Radius.circular(10),
          child: const Center(
            child: YgIcon.colorable(
              YgIcons.refreshAlt,
              color: Color(0xffA341FF),
            ),
          ),
        ),
      ),
    );
  }
}
