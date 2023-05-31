import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/bottom_sheet/_bottom_sheet.dart';

import '../_components.dart';

class YgBottomSheet extends StatefulWidget {
  const YgBottomSheet({
    super.key,
    required this.title,
    required this.content,
    this.footer,
  });

  final String title;
  final Widget content;
  final Widget? footer;

  @override
  State<YgBottomSheet> createState() => _YgBottomSheetState();
}

class _YgBottomSheetState extends State<YgBottomSheet> {
  final ScrollController _scrollController = ScrollController();

  /// Wether to show a shadow on the bottom of the scrollable content.
  bool _showBottomShadow = false;

  /// Wether to show a shadow on the top of the scrollable content.
  bool _showTopShadow = false;

  final GlobalKey _bottomShadowKey = GlobalKey();

  final GlobalKey _topShadowKey = GlobalKey();

  @override
  void initState() {
    _scrollController.addListener(_updateShadows);
    super.initState();

    // Also update shadows after the content is first rendered.
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateShadows());
  }

  @override
  Widget build(BuildContext context) {
    final YgBottomSheetThemes theme = context.bottomSheetTheme;
    final YgBottomSheetScrollPhysicsProvider? scrollPhysicsProvider =
        context.dependOnInheritedWidgetOfExactType<YgBottomSheetScrollPhysicsProvider>();

    return Material(
      borderRadius: theme.borderRadius,
      color: theme.backgroundColor,
      child: ClipRRect(
        borderRadius: theme.borderRadius,
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildHeader(theme),
              _buildContent(scrollPhysicsProvider, theme),
              if (widget.footer != null) _buildFooter(theme),
            ],
          ),
        ),
      ),
    );
  }

  void _updateShadows() {
    final ScrollPosition position = _scrollController.position;

    final bool newShowBottomShadow = position.extentAfter != 0;
    final bool newShowTopShadow = position.extentBefore != 0;

    if ((_showBottomShadow != newShowBottomShadow) || (_showTopShadow != newShowTopShadow)) {
      print('UPDATE');
      setState(() {
        _showBottomShadow = newShowBottomShadow;
        _showTopShadow = newShowTopShadow;
      });
    }
  }

  Padding _buildFooter(YgBottomSheetThemes theme) {
    return Padding(
      padding: theme.outerPadding.copyWith(
        top: theme.footerPadding.top,
      ),
      child: widget.footer,
    );
  }

  Padding _buildHeader(YgBottomSheetThemes theme) {
    return Padding(
      padding: theme.outerPadding.copyWith(bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: _buildDragHandle(theme),
          ),
          Padding(
            padding: theme.titlePadding,
            child: Text(
              widget.title,
              style: theme.titleStyle,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildDragHandle(YgBottomSheetThemes theme) {
    return Container(
      width: 48,
      height: 5,
      decoration: BoxDecoration(
        color: theme.handleBarColor,
        borderRadius: BorderRadius.circular(2.5),
      ),
    );
  }

  Flexible _buildContent(
    YgBottomSheetScrollPhysicsProvider? scrollPhysicsProvider,
    YgBottomSheetThemes theme,
  ) {
    print('BUILDING, Top: ${_showTopShadow ? 1 : 0}, Bottom: ${_showBottomShadow ? 1 : 0}');

    return Flexible(
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            controller: _scrollController,
            physics: scrollPhysicsProvider?.scrollPhysics,
            child: Padding(
              padding: theme.outerPadding.copyWith(
                top: 0,
                bottom: 0,
              ),
              child: widget.content,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: IgnorePointer(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                opacity: _showTopShadow ? 1 : 0,
                key: _topShadowKey,
                child: Container(
                  color: Colors.red,
                  height: 10,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: IgnorePointer(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                opacity: _showBottomShadow ? 1 : 0,
                key: _bottomShadowKey,
                child: Container(
                  color: Colors.red,
                  height: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
