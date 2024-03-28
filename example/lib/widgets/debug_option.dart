import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class DebugOption extends StatelessWidget {
  const DebugOption({
    super.key,
    required this.type,
    required this.color,
    required this.subtitle,
    required this.title,
    required this.onChange,
  });

  final YgDebugType type;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onChange;

  @override
  Widget build(BuildContext context) {
    return YgCheckboxListTile(
      title: title,
      subtitle: subtitle,
      value: YgDebug.isEnabled(type),
      onChanged: (_) => _toggleDebug(context),
      leadingWidget: Container(
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(
              color: color,
              width: 2,
            ),
          ),
        ),
        width: 25,
        height: 25,
      ),
    );
  }

  void _toggleDebug(BuildContext context) {
    YgDebug.toggleDebugging(context, type: type);
    onChange();
  }
}
