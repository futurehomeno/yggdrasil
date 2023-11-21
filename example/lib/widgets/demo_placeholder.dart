import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class DemoPlaceholder extends StatelessWidget {
  const DemoPlaceholder({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double? width = this.width ?? (constraints.maxWidth.isFinite ? constraints.maxWidth : null);
        final double? height = this.height ?? (constraints.maxHeight.isFinite ? constraints.maxHeight : null);

        return Container(
          width: width,
          height: height,
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
            dashPattern: const [3, 5],
            radius: const Radius.circular(10),
            child: const Center(
              child: YgIcon(
                YgIcons.refreshAlt,
                color: Color(0xffA341FF),
              ),
            ),
          ),
        );
      },
    );
  }
}
