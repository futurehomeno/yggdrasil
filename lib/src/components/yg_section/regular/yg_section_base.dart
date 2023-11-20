part of '../yg_section.dart';

abstract class _YgSectionBase extends YgSection {
  const _YgSectionBase({
    super.title,
    super.subtitle,
    super.tag,
    super.icon,
  }) : super._();

  @override
  Widget build(BuildContext context) {
    final String? title = this.title;
    final String? subtitle = this.subtitle;
    final Widget child = buildChild(context);

    if (title == null) {
      return child;
    }

    return Column(
      children: <Widget>[
        _YgSectionHeader(
          title: title,
          subtitle: subtitle,
          icon: icon,
          trailing: buildTrailing(),
        ),
        child,
      ],
    );
  }

  /// Builds the trailing widgets.
  List<Widget>? buildTrailing() {
    final YgTag? tag = this.tag;

    if (tag == null) {
      return null;
    }

    return <Widget>[
      tag,
    ];
  }
}
