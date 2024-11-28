import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/fields/search/controller/advanced_search/yg_advanced_value_search_mixin.dart';
import 'package:yggdrasil/src/components/fields/search/controller/string_search/yg_string_search_mixin.dart';
import 'package:yggdrasil/src/components/fields/search/controller/yg_search_mixin_interface.dart';
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

part 'yg_string_search_bar.dart';
part 'yg_value_search_bar.dart';

abstract class YgSearchBar<T> extends StatefulWidget {
  const factory YgSearchBar({
    required bool autocorrect,
    YgCompleteAction completeAction,
    YgAdvancedSearchController<T>? controller,
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
    YgSearchAction searchAction,
    required YgSearchProvider<T> searchProvider,
    required TextCapitalization textCapitalization,
    Widget? trailing,
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

  final Widget? trailing;

  /// Hint widget shown in the top of the search results.
  final Widget? hint;

  /// The action that should be performed when the user presses the search field.
  ///
  /// By default checks the platform and will show a full screen search for
  /// mobile devices and a search menu for other devices.
  final YgSearchAction searchAction;

  /// Called when the user presses the dropdown.
  final VoidCallback? onPressed;

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

  final YgSearchControllerAny<T>? controller;

  final ValueChanged<T>? onChanged;

  final String? initialQuery;
}

abstract class YgSearchBarWidgetState<T, W extends YgSearchBar<T>, R extends YgStringSearchResult>
    extends StateWithYgStateAndStyle<W, YgSearchBarState, YgSearchBarStyle>
    with YgControllerManagerMixin
    implements YgSearchMixinInterface<T, R> {
  late final YgMaterialStatesControllerWithChangeCallback _materialController =
      YgMaterialStatesControllerWithChangeCallback(
    onStateChange: _handleMaterialStateChange,
  );

  /// Manages the controller of this widget.
  late final YgControllerManager<YgSearchControllerAny<T>> _controllerManager = manageController(
    createController: createController,
    getUserController: () => widget.controller,
  );

  /// Manages the [FocusNode] of this widget.
  late final YgControllerManager<FocusNode> _focusNodeManager = manageController(
    createController: () => FocusNode(),
    getUserController: () => widget.focusNode,
  );

  YgSearchControllerAny<T> createController();

  final GlobalKey _fieldKey = GlobalKey();
  final YgLinkedKey<HintProvider> _hintKey = YgLinkedKey<HintProvider>();
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

  void _handleMaterialStateChange(WidgetState widgetState, bool toggled) {
    switch (widgetState) {
      case WidgetState.focused:
        state.focused.value = toggled;
        break;
      case WidgetState.hovered:
        state.hovered.value = toggled;
        break;
      case WidgetState.pressed:
        state.pressed.value = toggled;
        break;
      default:
    }
  }

  @override
  void dispose() {
    _materialController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final YgSearchControllerAny<T> controller = _controllerManager.value;
    final YgSearchBarTheme theme = context.searchBarTheme;
    final Widget? trailing = widget.trailing;

    final YgIconButton searchButton = YgIconButton(
      icon: YgIcons.searchAlt,
      onPressed: () {},
    );

    Widget? leading = widget.leading;
    Widget? trailingSearch;
    if (leading == null) {
      leading = searchButton;
    } else {
      trailingSearch = searchButton;
    }

    return HintProvider(
      key: _hintKey,
      hint: widget.hint,
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
            statesController: _materialController,
            focusNode: _focusNodeManager.value,
            splashFactory: InkRipple.splashFactory,
            overlayColor: WidgetStatePropertyAll<Color>(Colors.white.withOpacity(0.05)),
            onTap: _controllerManager.value.open,
            child: Padding(
              padding: theme.contentPadding,
              child: SizedBox(
                height: theme.contentHeight,
                child: Row(
                  children: <Widget>[
                    leading,
                    Expanded(
                      child: RepaintBoundary(
                        child: YgOptimizedListenableBuilder<String>(
                          listenable: controller,
                          getValue: () => controller.valueText,
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
                    if (trailingSearch != null) trailingSearch,
                    if (trailing != null) trailing,
                  ].withHorizontalSpacing(theme.contentSpacing),
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
    _controllerManager.value.startSession();

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

    _controllerManager.value.endSession();
    YgEditingCompleteHelper.onComplete(
      onEditingComplete: widget.onEditingComplete,
      focusNode: _focusNodeManager.value,
      completeAction: widget.completeAction,
    );
  }
}
