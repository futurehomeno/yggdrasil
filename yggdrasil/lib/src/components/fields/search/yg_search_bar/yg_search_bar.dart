import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/fields/search/controller/yg_search_mixin_interface.dart';
import 'package:yggdrasil/src/components/fields/search/controller/yg_string_search_mixin.dart';
import 'package:yggdrasil/src/components/fields/search/controller/yg_value_search_mixin.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/hint_provider.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/mobile_search_screen/_mobile_search_screen.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/optimized_listenable_builder.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/search_app_bar.dart';
import 'package:yggdrasil/src/components/fields/search/yg_search_bar/yg_search_bar_style.dart';
import 'package:yggdrasil/src/theme/search_bar/search_bar_theme.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/src/utils/yg_linked/_yg_linked.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_search_bar_state.dart';

part 'yg_string_search_bar.dart';
part 'yg_value_search_bar.dart';

abstract class YgSearchBar<T> extends StatefulWidget implements PreferredSizeWidget {
  const factory YgSearchBar({
    required bool autocorrect,
    bool automaticallyImplyLeading,
    YgCompleteAction completeAction,
    YgValueSearchController<T>? controller,
    String? error,
    FocusNode? focusNode,
    Widget? hint,
    String? initialQuery,
    T? initialValue,
    List<TextInputFormatter>? inputFormatters,
    Key? key,
    required TextInputType keyboardType,
    Widget? leading,
    ValueChanged<T>? onChanged,
    VoidCallback? onEditingComplete,
    ValueChanged<bool>? onFocusChanged,
    VoidCallback? onPressed,
    String? placeholder,
    required YgValueSearchResultTextBuilder<T> resultTextBuilder,
    required YgValueSearchResultsBuilder<T> resultsBuilder,
    YgSearchAction searchAction,
    bool showSearchIcon,
    YgFieldSize size,
    required TextCapitalization textCapitalization,
    Widget? trailing,
    YgFieldVariant variant,
  }) = _YgValueSearchBar<T>;

  const YgSearchBar._({
    super.key,
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
    this.initialQuery,
    this.leading,
    this.trailing,
    this.showSearchIcon = true,
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

  /// Hint widget shown in the top of the search results.
  final Widget? hint;

  /// The action that should be performed when the user presses the search field.
  ///
  /// By default checks the platform and will show a full screen search for
  /// mobile devices and a search menu for other devices.
  final YgSearchAction searchAction;

  /// Called when the user presses the dropdown.
  final VoidCallback? onPressed;

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

  /// The action to perform when the user completes editing the field.
  ///
  /// By default based on the [textInputAction].
  final YgCompleteAction completeAction;

  final YgSearchControllerSimple<T>? controller;

  final ValueChanged<T>? onChanged;

  final String? initialQuery;

  @override
  Size get preferredSize => const Size.fromHeight(64);
}

abstract class YgSearchBarWidgetState<T, W extends YgSearchBar<T>>
    extends StateWithYgStateAndStyle<W, YgSearchBarState, YgSearchBarStyle>
    with YgControllerManagerMixin, YgCompleteActionStateMixin
    implements YgSearchMixinInterface {
  /// Manages the controller of this widget.
  late final YgControllerManager<YgSearchControllerSimple<T>> _controllerManager = manageController(
    createController: createController,
    getUserController: () => widget.controller,
  );

  /// Manages the [FocusNode] of this widget.
  late final YgControllerManager<FocusNode> _focusNodeManager = manageController(
    createController: () => FocusNode(),
    getUserController: () => widget.focusNode,
  );

  YgSearchControllerSimple<T> createController();

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

    final YgSearchControllerSimple<T> controller = _controllerManager.value;
    final TextEditingController textController = controller.textEditingController;

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
                              child: OptimizedListenableBuilder<String>(
                                listenable: textController,
                                getValue: () => textController.text,
                                builder: (BuildContext context, String value, Widget? child) {
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
            initialValue: widget.initialQuery,
            textInputAction: YgConsts.isIos ? TextInputAction.search : TextInputAction.none,
            onEditingComplete: widget.onEditingComplete,
            onFocusChanged: null,
            focusNode: null,
            onChanged: null,
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

    doCompleteAction();
  }

  @override
  YgCompleteAction get completeAction => widget.completeAction;

  @override
  FocusNode get focusNode => _focusNodeManager.value;

  @override
  VoidCallback? get onEditingComplete => widget.onEditingComplete;
}
