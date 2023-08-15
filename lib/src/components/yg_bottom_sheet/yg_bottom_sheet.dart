import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_bottom_sheet/yg_bottom_sheet_header.dart';
import 'package:yggdrasil/yggdrasil.dart';

// TODO(bjhandeland): potentially expose the scroll controller.
class YgBottomSheet extends StatefulWidget with StatefulWidgetDebugMixin {
  const YgBottomSheet({
    super.key,
    required this.title,
    required this.content,
    this.footerButtons,
  });

  final String title;
  final Widget content;
  final YgButtonGroup? footerButtons;

  @override
  State<YgBottomSheet> createState() => _YgBottomSheetState();
}

class _YgBottomSheetState extends State<YgBottomSheet> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final YgBottomSheetTheme bottomSheetTheme = context.bottomSheetTheme;
    final YgBottomSheetScrollPhysicsProvider? scrollPhysicsProvider =
        context.dependOnInheritedWidgetOfExactType<YgBottomSheetScrollPhysicsProvider>();

    return RepaintBoundary(
      child: Material(
        borderRadius: bottomSheetTheme.borderRadius,
        color: bottomSheetTheme.backgroundColor,
        child: SafeArea(
          top: false,
          child: ClipRRect(
            borderRadius: bottomSheetTheme.borderRadius,
            child: Padding(
              padding: bottomSheetTheme.verticalOuterPadding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  YgBottomSheetHeader(title: widget.title),
                  _buildContent(scrollPhysicsProvider, bottomSheetTheme),
                  if (widget.footerButtons != null)
                    Padding(
                      padding: bottomSheetTheme.footerPadding,
                      child: widget.footerButtons!,
                    ),
                ].withVerticalSpacing(bottomSheetTheme.contentSpacing),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    YgBottomSheetScrollPhysicsProvider? scrollPhysicsProvider,
    YgBottomSheetTheme theme,
  ) {
    return Flexible(
      child: YgScrollShadow(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: scrollPhysicsProvider?.scrollPhysics,
          child: widget.content,
        ),
      ),
    );
  }
}
