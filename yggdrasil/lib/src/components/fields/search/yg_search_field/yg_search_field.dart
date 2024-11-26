// ignore_for_file: prefer-single-widget-per-file

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/fields/search/controller/string_search/yg_string_search_mixin.dart';
import 'package:yggdrasil/src/components/fields/search/controller/value_search/yg_value_search_mixin.dart';
import 'package:yggdrasil/src/components/fields/search/controller/yg_search_mixin_interface.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/hint_provider.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/mobile_search_screen/_mobile_search_screen.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/search_app_bar.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/widget_or_loading.dart';
import 'package:yggdrasil/src/components/fields/widgets/_widgets.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/src/utils/yg_linked/_yg_linked.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_search_field_state.dart';

part 'string_search/yg_string_search_field.dart';
part 'value_search/yg_value_search_field.dart';

/// A field which when opened allows the user to search for a value.
///
/// If you want to search for a string without a specific value attached to it,
/// use [YgStringSearchField] instead.
abstract class YgSearchField<Value, Result> extends StatefulWidget with StatefulWidgetDebugMixin {
  const factory YgSearchField({
    required bool autocorrect,
    YgCompleteAction completeAction,
    YgValueSearchController<Value, Result>? controller,
    bool disabled,
    String? error,
    FocusNode? focusNode,
    Widget? hint,
    Value? initialValue,
    List<TextInputFormatter>? inputFormatters,
    Key? key,
    required TextInputType keyboardType,
    required String label,
    ValueChanged<Value>? onChanged,
    VoidCallback? onEditingComplete,
    ValueChanged<bool>? onFocusChanged,
    VoidCallback? onPressed,
    String? placeholder,
    bool readOnly,
    YgSearchAction searchAction,
    required YgSearchProvider<Value, Result> searchProvider,
    YgFieldSize size,
    required TextCapitalization textCapitalization,
    YgFieldVariant variant,
  }) = _YgValueSearchField<Value, Result>;

  const YgSearchField._({
    super.key,
    required this.label,
    required this.keyboardType,
    required this.autocorrect,
    required this.textCapitalization,
    this.onChanged,
    this.focusNode,
    this.error,
    this.placeholder,
    this.onFocusChanged,
    this.onPressed,
    this.onEditingComplete,
    this.hint,
    this.inputFormatters,
    this.disabled = false,
    this.readOnly = false,
    this.variant = YgFieldVariant.standard,
    this.size = YgFieldSize.large,
    this.completeAction = YgCompleteAction.unfocus,
    this.searchAction = YgSearchAction.auto,
  });

  /// Hint widget shown in the top of the search results.
  final Widget? hint;

  /// The action that should be performed when the user presses the search field.
  ///
  /// By default checks the platform and will show a full screen search for
  /// mobile devices and a search menu for other devices.
  final YgSearchAction searchAction;

  /// Called when the user presses the search field.
  final VoidCallback? onPressed;

  /// The variant of the text field.
  final YgFieldVariant variant;

  /// The label shown on top of the text field.
  final String label;

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

  /// Whether the text field is disabled.
  ///
  /// Applies styling for the disabled text text field. Also disables all interaction.
  final bool disabled;

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

  /// The action to perform when the user completes editing the field.
  ///
  /// By default based on the [textInputAction].
  final YgCompleteAction completeAction;

  final ValueChanged<Value>? onChanged;

  @override
  YgDebugType get debugType {
    if (disabled) {
      return YgDebugType.other;
    }

    return YgDebugType.intractable;
  }
}

abstract class YgSearchFieldWidgetState<Value, ResultValue, W extends YgSearchField<Value, ResultValue>,
        Result extends YgStringSearchResult> extends StateWithYgState<W, YgSearchFieldState>
    with YgControllerManagerMixin
    implements YgSearchMixinInterface<Value, Result> {
  /// Manages the controller of this widget.
  late final YgControllerManager<YgSearchControllerAnyWithResult<Value, ResultValue>> _controllerManager =
      manageController(
    createController: createController,
    getUserController: getUserController,
    listener: _valueUpdated,
  );

  /// Manages the [FocusNode] of this widget.
  late final YgControllerManager<FocusNode> _focusNodeManager = manageController(
    createController: () => FocusNode(),
    getUserController: () => widget.focusNode,
    listener: _focusChanged,
  );

  YgSearchControllerAnyWithResult<Value, ResultValue> createController();

  YgSearchControllerAnyWithResult<Value, ResultValue>? getUserController();

  final GlobalKey _fieldKey = GlobalKey();
  final YgLinkedKey<HintProvider> _hintKey = YgLinkedKey<HintProvider>();

  void _valueUpdated() {
    state.filled.value = _controllerManager.value.valueText.isNotEmpty;
  }

  void _focusChanged() {
    final bool focused = _focusNodeManager.value.hasFocus;
    state.focused.value = focused;
    widget.onFocusChanged?.call(focused);
  }

  @override
  YgSearchFieldState createState() {
    return YgSearchFieldState(
      filled: _controllerManager.value.valueText.isNotEmpty,
      placeholder: widget.placeholder != null,
      error: widget.error != null,
      disabled: widget.disabled,
      suffix: true,
      variant: widget.variant,
      size: widget.size,
    );
  }

  @override
  void updateState() {
    state.disabled.value = widget.disabled;
    state.placeholder.value = widget.placeholder != null;
    state.error.value = widget.error != null;
    state.disabled.value = widget.disabled;
    state.variant.value = widget.variant;
    state.size.value = widget.size;
  }

  @override
  Widget build(BuildContext context) {
    final bool isTextField = (widget.searchAction == YgSearchAction.menu) ||
        (widget.searchAction == YgSearchAction.auto && !YgConsts.isMobile);

    final YgSearchControllerAny<Value> controller = _controllerManager.value;

    return HintProvider(
      hint: widget.hint,
      key: _hintKey,
      child: YgFieldDecoration(
        key: _fieldKey,
        content: YgFieldContent(
          floatLabelOnFocus: isTextField,
          label: widget.label,
          placeholder: widget.placeholder,
          state: state,
          value: RepaintBoundary(
            child: YgOptimizedListenableBuilder<String>(
              listenable: controller,
              getValue: () => controller.valueText,
              builder: (BuildContext context, String text, Widget? child) {
                return Text(text);
              },
            ),
          ),
          minLines: null,
        ),
        builder: (BuildContext context, Widget child) {
          if (widget.disabled) {
            return child;
          }

          return InkWell(
            focusNode: _focusNodeManager.value,
            onTap: controller.open,
            child: child,
          );
        },
        error: widget.error,
        state: state,
        suffix: WidgetOrLoading(
          controller: controller,
          child: YgIconButton(
            onPressed: widget.disabled ? null : controller.open,
            size: YgIconButtonSize.small,
            icon: YgIcons.searchAlt,
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
    final YgFieldDecorationTheme decorationTheme = context.fieldTheme.decorationTheme;
    _controllerManager.value.startSession();

    // Get the radius based on the variant. Used to animate in the screen.
    final BorderRadius radius = switch (state.variant.value) {
      YgFieldVariant.outlined => decorationTheme.borderRadiusOutlined,
      YgFieldVariant.standard => decorationTheme.borderRadiusDefault,
    };

    Navigator.of(context).push(
      SearchScreenRoute<Value>(
        searchController: _controllerManager.value,
        borderRadius: radius,
        fieldKey: _fieldKey,
        hintKey: _hintKey,
        onClose: _onClosed,
        searchBarBuilder: (BuildContext context) {
          return SearchAppBar<Value>(
            controller: _controllerManager.value,
            placeholder: widget.placeholder ?? widget.label,
            keyboardType: widget.keyboardType,
            autocorrect: widget.autocorrect,
            textCapitalization: widget.textCapitalization,
            inputFormatters: widget.inputFormatters,
            textInputAction: YgConsts.isIos ? TextInputAction.search : TextInputAction.none,
            onEditingComplete: widget.onEditingComplete,
            initialValue: null,
            onFocusChanged: null,
            focusNode: null,
            onChanged: null,
          );
        },
      ),
    );

    state.opened.value = true;
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
    return state.opened.value;
  }

  void _onClosed() {
    if (!state.opened.update(false)) {
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
