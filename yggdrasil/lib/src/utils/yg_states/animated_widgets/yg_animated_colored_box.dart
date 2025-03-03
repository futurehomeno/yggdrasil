part of yg_states;


class YgAnimatedColoredBox extends StatelessWidget {
  const YgAnimatedColoredBox({
    super.key,
    required this.color,
    this.child,
  });

  final YgDrivenColorProperty color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Color>(
      valueListenable: color,
      builder: (BuildContext context, Color value, Widget? _) {
        return ColoredBox(
          color: value,
          child: child,
        );
      },
    );
  }
}
