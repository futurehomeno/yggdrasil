import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/hint_provider.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/mobile_search_screen/_mobile_search_screen.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/search_app_bar.dart';
import 'package:yggdrasil/src/components/fields/search/yg_search_bar/yg_search_bar_style.dart';
import 'package:yggdrasil/src/theme/search_bar/search_bar_theme.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/src/utils/yg_linked/_yg_linked.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_search_bar_state.dart';

class YgSearchBar<T> extends StatefulWidget implements PreferredSizeWidget {
  const YgSearchBar({
    super.key,
    required this.resultTextBuilder,
    required this.resultsBuilder,
    required this.keyboardType,
    required this.autocorrect,
    required this.textCapitalization,
    this.focusNode,
    this.error,
    this.placeholder,
    this.onFocusChanged,
    this.onPressed,
    this.controller,
    this.onEditingComplete,
    this.onChanged,
    this.hint,
    this.inputFormatters,
    this.initialValue,
    this.leading,
    this.trailing,
    this.showSearchIcon = true,
    this.readOnly = false,
    this.automaticallyImplyLeading = true,
    this.variant = YgFieldVariant.standard,
    this.size = YgFieldSize.large,
    this.completeAction = YgCompleteAction.unfocus,
    this.searchAction = YgSearchAction.auto,
  });

  /// A widget to display before the toolbar's [title].
  ///
  /// Typically the [leading] widget is an [Icon] or an [IconButton].
  ///
  /// If set and [automaticallyImplyLeading] is true, then a [BackButton] will
  /// be shown instead of the [leading] widget when possible.
  final Widget? leading;

  /// Controls whether we should try to imply the leading widget if null.
  ///
  /// If true and even if [leading] is set, automatically try to deduce what the leading
  /// widget should be. If no leading widget can be automatically deduced, the
  /// [leading] will be shown.
  ///
  /// If false and [leading] is null, title will be centered.
  final bool automaticallyImplyLeading;

  final Widget? trailing;
  final bool showSearchIcon;

  /// Called to get the results list for the search screen / menu.
  ///
  /// Gets called every time the search text changes, if the previous call
  /// returned a future, this builder will not be called again until that future
  /// has resolved. If the value has changed since the last time this builder was
  /// called, this builder will be called again, only with the most recent value.
  ///
  /// If this builder returns a future, for the duration of the future, a loading
  /// indicator will be shown to the user.
  ///
  /// Results are bound to the [controller], so in case a different controller
  /// gets assigned, the results will also change.
  final YgSearchResultsBuilder<T> resultsBuilder;

  /// Called to get the result text once a result has been selected.
  ///
  /// In the case this widget returns a string, the search text will be updated
  /// to this string, in case this builder returns null, the most recent value
  /// entered by the user will be shown in the search field.
  ///
  /// If this builder returns a future, a loading indicator will be shown to the
  /// user until this future resolves.
  final YgSearchResultTextBuilder<T> resultTextBuilder;

  /// Hint widget shown in the top of the search results.
  final Widget? hint;

  /// Controls the value of the search field and can open or close the search field.
  ///
  /// When defined will overwrite the [initialValue].
  final YgSearchController<T>? controller;

  /// The action that should be performed when the user presses the search field.
  ///
  /// By default checks the platform and will show a full screen search for
  /// mobile devices and a search menu for other devices.
  final YgSearchAction searchAction;

  /// Called when the user presses the dropdown.
  final VoidCallback? onPressed;

  /// Triggers whenever there's a change to the text field value.
  final ValueChanged<String>? onChanged;

  /// The variant of the text field.
  final YgFieldVariant variant;

  /// Called when the user submits editable content (e.g., user presses the "done"
  /// button on the keyboard).
  ///
  /// The default implementation of [onEditingComplete] executes 2 different
  /// behaviors based on the situation:
  ///
  ///  - When a completion action is pressed, such as "done", "go", "send", or
  ///    "search", the user's content is submitted to the [controller] and then
  ///    focus is given up.
  ///
  ///  - When a non-completion action is pressed, such as "next" or "previous",
  ///    the user's content is submitted to the [controller], but focus is not
  ///    given up because developers may want to immediately move focus to
  ///    another text field widget within [onSubmitted].
  ///
  /// Providing [onEditingComplete] prevents the aforementioned default behavior.
  final VoidCallback? onEditingComplete;

  /// Called when the widget gains or loses focus.
  final ValueChanged<bool>? onFocusChanged;

  /// The placeholder shown in the text field.
  ///
  /// Gets replaced with the value entered by the user if the value is not empty.
  final String? placeholder;

  /// The size of the text field.
  ///
  /// Primarily affects the height of the text field.
  final YgFieldSize size;

  /// The type of keyboard to use for editing the text.
  final TextInputType keyboardType;

  /// When true enables autocorrect.
  final bool autocorrect;

  /// Whether the text can be changed.
  ///
  /// When this is set to true, the text cannot be modified
  /// by any shortcut or keyboard operation. The text is still selectable.
  ///
  /// Defaults to false. Must not be null.
  final bool readOnly;

  /// Configures how the platform keyboard will select an uppercase or
  /// lowercase keyboard.
  ///
  /// Only supports text keyboards, other keyboard types will ignore this
  /// configuration. Capitalization is locale-aware.
  ///
  /// Defaults to [TextCapitalization.none]. Must not be null.
  ///
  /// See also:
  ///
  ///  * [TextCapitalization], for a description of each capitalization behavior.
  final TextCapitalization textCapitalization;

  /// The error to display under the text field.
  ///
  /// Will change the styling of the widget to reflect the presence of the error.
  /// Must be null when there is no error, an empty string is still seen as an
  /// valid error.
  final String? error;

  /// Determines what's allowed to enter into the field.
  ///
  /// See [FhInputFormatters].
  final List<TextInputFormatter>? inputFormatters;

  /// Controls the focus of the widget.
  final FocusNode? focusNode;

  /// The initial value of the text field.
  final String? initialValue;

  /// The action to perform when the user completes editing the field.
  ///
  /// By default based on the [textInputAction].
  final YgCompleteAction completeAction;

  @override
  State<YgSearchBar<T>> createState() => _YgSearchBarState<T>();

  @override
  Size get preferredSize => const Size.fromHeight(64);
}

class _YgSearchBarState<T> extends StateWithYgStateAndStyle<YgSearchBar<T>, YgSearchBarState, YgSearchBarStyle>
    with YgControllerManagerMixin, YgSearchMixin<T, YgSearchBar<T>> {
  /// Manages the controller of this widget.
  late final YgControllerManager<YgSearchController<T>> _controllerManager = manageController<YgSearchController<T>>(
    createController: () => YgSearchController<T>(text: widget.initialValue),
    getUserController: () => widget.controller,
  );

  /// Manages the [FocusNode] of this widget.
  late final YgControllerManager<FocusNode> _focusNodeManager = manageController(
    createController: () => FocusNode(),
    getUserController: () => widget.focusNode,
  );

  final GlobalKey _fieldKey = GlobalKey();
  final YgLinkedKey<HintProvider> _hintKey = YgLinkedKey<HintProvider>();
  ScrollNotificationObserverState? _scrollNotificationObserver;
  bool _scrolledUnder = false;
  bool _opened = false;

  @override
  YgSearchBarState createState() {
    return YgSearchBarState();
  }

  @override
  YgSearchBarStyle createStyle() {
    return YgSearchBarStyle(
      state: state,
      vsync: this,
    );
  }

  @override
  void updateState() {}

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollNotificationObserver?.removeListener(_handleScrollNotification);
    _scrollNotificationObserver = ScrollNotificationObserver.maybeOf(context);
    _scrollNotificationObserver?.addListener(_handleScrollNotification);
  }

  @override
  void dispose() {
    if (_scrollNotificationObserver != null) {
      _scrollNotificationObserver!.removeListener(_handleScrollNotification);
      _scrollNotificationObserver = null;
    }
    super.dispose();
  }

  void _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification && defaultScrollNotificationPredicate(notification)) {
      final bool oldScrolledUnder = _scrolledUnder;
      final ScrollMetrics metrics = notification.metrics;
      switch (metrics.axisDirection) {
        case AxisDirection.up:
          // Scroll view is reversed
          _scrolledUnder = metrics.extentAfter > 0;
        case AxisDirection.down:
          _scrolledUnder = metrics.extentBefore > 0;
        case AxisDirection.right:
        case AxisDirection.left:
          // Scrolled under is only supported in the vertical axis, and should
          // not be altered based on horizontal notifications of the same
          // predicate since it could be a 2D scroller.
          break;
      }

      if (_scrolledUnder != oldScrolledUnder) {
        // React to a change in MaterialState.scrolledUnder
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final YgSearchBarTheme theme = context.searchBarTheme;
    final Widget? trailing = widget.trailing;

    final FlexibleSpaceBarSettings? settings = context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    final double effectiveElevation;
    if (settings?.isScrolledUnder ?? _scrolledUnder) {
      effectiveElevation = theme.scrolledUnderElevation;
    } else {
      effectiveElevation = theme.elevation;
    }

    Widget? leading;

    if (widget.automaticallyImplyLeading) {
      // ignore: avoid-dynamic
      final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
      if (parentRoute?.canPop == true || parentRoute?.impliesAppBarDismissal == true) {
        leading = YgIconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: YgIcons.caretLeft,
        );
      }
    }

    // If no leading can be determine from automaticallyImplyLeading,
    // use the provided leading.
    if (leading == null) {
      if (widget.leading == null) {
        leading = const SizedBox(
          width: 20,
        );
      } else {
        leading = widget.leading;
      }
    }

    return HintProvider(
      key: _hintKey,
      hint: widget.hint,
      child: Material(
        elevation: effectiveElevation,
        color: theme.barColor,
        child: SafeArea(
          bottom: false,
          child: Container(
            height: theme.barHeight,
            padding: theme.barPadding,
            alignment: Alignment.center,
            child: YgAnimatedDecoratedBox(
              decoration: style.backgroundColor.map(
                (Color color) => BoxDecoration(
                  color: color,
                  borderRadius: theme.containerBorderRadius,
                ),
              ),
              child: Material(
                key: _fieldKey,
                borderRadius: theme.containerBorderRadius,
                type: MaterialType.transparency,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  focusNode: _focusNodeManager.value,
                  onHover: state.hovered.update,
                  splashFactory: InkRipple.splashFactory,
                  overlayColor: WidgetStatePropertyAll<Color>(Colors.white.withOpacity(0.05)),
                  onTap: _controllerManager.value.open,
                  child: Padding(
                    padding: theme.contentPadding,
                    child: SizedBox(
                      height: theme.contentHeight,
                      child: Row(
                        children: <Widget>[
                          if (leading != null) leading,
                          Expanded(
                            child: RepaintBoundary(
                              child: AnimatedBuilder(
                                animation: _controllerManager.value,
                                builder: (BuildContext context, Widget? child) {
                                  final String value = _controllerManager.value.text;
                                  final String? placeholder = widget.placeholder;

                                  if (value.isNotEmpty) {
                                    return Text(
                                      value,
                                      style: theme.valueTextStyle,
                                    );
                                  }

                                  if (placeholder != null && placeholder.isNotEmpty == true) {
                                    return Text(
                                      placeholder,
                                      style: theme.placeholderTextStyle,
                                    );
                                  }

                                  return const SizedBox();
                                },
                              ),
                            ),
                          ),
                          if (widget.showSearchIcon)
                            const SizedBox(
                              height: 50,
                              width: 50,
                              child: YgIcon(
                                YgIcons.search,
                              ),
                            ),
                          if (trailing != null) trailing,
                        ].withHorizontalSpacing(theme.contentSpacing),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void open() {
    _focusNodeManager.value.requestFocus();
    widget.onPressed?.call();

    switch (widget.searchAction) {
      case YgSearchAction.screen:
        return openScreen();
      case YgSearchAction.menu:
        return openMenu();
      case YgSearchAction.auto:
        return _performPlatformAction();
      case YgSearchAction.none:
        return;
    }
  }

  void _performPlatformAction() {
    if (YgConsts.isMobile) {
      openScreen();
    } else {
      openMenu();
    }
  }

  @override
  void openMenu() {
    // TODO(Tim): Implement this.
  }

  @override
  void openScreen() {
    final YgSearchBarTheme theme = context.searchBarTheme;

    Navigator.of(context).push(
      SearchScreenRoute<T>(
        searchController: _controllerManager.value,
        borderRadius: theme.containerBorderRadius,
        fieldKey: _fieldKey,
        hintKey: _hintKey,
        onClose: _onClosed,
        searchBarBuilder: (BuildContext context) {
          return SearchAppBar<T>(
            controller: _controllerManager.value,
            placeholder: widget.placeholder,
            keyboardType: widget.keyboardType,
            autocorrect: widget.autocorrect,
            textCapitalization: widget.textCapitalization,
            inputFormatters: widget.inputFormatters,
            initialValue: widget.initialValue,
            textInputAction: YgConsts.isIos ? TextInputAction.search : TextInputAction.none,
            onChanged: widget.onChanged,
            onEditingComplete: widget.onEditingComplete,
            onFocusChanged: null,
            focusNode: null,
          );
        },
      ),
    );

    _opened = true;
  }

  @override
  void close() {
    Navigator.popUntil(
      context,
      // ignore: avoid-dynamic
      (Route<dynamic> route) => route is! SearchScreenRoute,
    );

    _onClosed();
  }

  @override
  bool get isOpen {
    return _opened;
  }

  void _onClosed() {
    if (!_opened) {
      return;
    }

    final VoidCallback? onEditingComplete = widget.onEditingComplete;

    if (onEditingComplete != null) {
      onEditingComplete();

      return;
    }

    final FocusNode focusNode = _focusNodeManager.value;
    switch (widget.completeAction) {
      case YgCompleteAction.focusNext:
        focusNode.nextFocus();
        break;
      case YgCompleteAction.focusPrevious:
        focusNode.previousFocus();
        break;
      case YgCompleteAction.unfocus:
        focusNode.unfocus();
        break;
      case YgCompleteAction.none:
    }
  }

  @override
  FutureOr<String?> Function(T value)? get resultTextBuilder => widget.resultTextBuilder;

  @override
  YgSearchResultsBuilder<T> get resultsBuilder => widget.resultsBuilder;
}
