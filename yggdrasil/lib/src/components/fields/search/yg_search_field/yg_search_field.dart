import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/fields/search/enums/yg_search_action.dart';
import 'package:yggdrasil/src/components/fields/search/models/yg_search_state.dart';
import 'package:yggdrasil/src/components/fields/search/models/yg_search_widget.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/mobile_search_screen.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/search_app_bar.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/widget_or_loading.dart';
import 'package:yggdrasil/src/components/fields/widgets/_widgets.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_search_field_state.dart';

part 'yg_search_field_controller.dart';

/// A field which when opened allows the user to search for a value.
class YgSearchField<T> extends StatefulWidget implements YgSearchWidget<T> {
  const YgSearchField({
    super.key,
    required this.label,
    this.variant = YgFieldVariant.standard,
    this.size = YgFieldSize.large,
    this.completeAction = YgCompleteAction.unfocus,
    this.searchAction = YgSearchAction.auto,
    this.focusNode,
    this.error,
    this.disabled = false,
    this.placeholder,
    this.onFocusChanged,
    this.onPressed,
    this.controller,
    this.onEditingComplete,
    this.onChanged,
    this.hint,
    required this.resultTextBuilder,
    required this.resultsBuilder,
    required this.keyboardType,
    required this.autocorrect,
    required this.readOnly,
    required this.textCapitalization,
    this.inputFormatters,
    this.initialValue,
  });

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
  @override
  final YgSearchResultsBuilder<T> resultsBuilder;

  /// Called to get the result text once a result has been selected.
  ///
  /// In the case this widget returns a string, the search text will be updated
  /// to this string, in case this builder returns null, the most recent value
  /// entered by the user will be shown in the search field.
  ///
  /// If this builder returns a future, a loading indicator will be shown to the
  /// user until this future resolves.
  @override
  final YgSearchResultTextBuilder<T> resultTextBuilder;

  /// Hint widget shown in the top of the search results.
  final Widget? hint;

  /// Controls the value of the search field and can open or close the search field.
  ///
  /// When defined will overwrite the [initialValue].
  final YgSearchFieldController<T>? controller;

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

  /// The initial value of the text field.
  final String? initialValue;

  /// The action to perform when the user completes editing the field.
  ///
  /// By default based on the [textInputAction].
  final YgCompleteAction completeAction;

  @override
  State<YgSearchField<T>> createState() => _YgSearchFieldState<T>();
}

class _YgSearchFieldState<T> extends StateWithYgState<YgSearchField<T>, YgSearchFieldState>
    with YgControllerManagerMixin
    implements YgSearchState<YgSearchField<T>> {
  /// Manages the controller of this widget.
  late final YgControllerManager<YgSearchFieldController<T>> _controllerManager = manageController(
    createController: () => YgSearchFieldController<T>(text: widget.initialValue),
    getUserController: () => widget.controller,
    listener: _valueUpdated,
  );

  /// Manages the [FocusNode] of this widget.
  late final YgControllerManager<FocusNode> _focusNodeManager = manageController(
    createController: () => FocusNode(),
    getUserController: () => widget.focusNode,
    listener: _focusChanged,
  );

  // This is a little weird, but it works, and is probably the best available
  // option.
  late final ValueNotifier<Widget?> _hint = ValueNotifier<Widget?>(
    widget.hint,
  );

  final GlobalKey _fieldKey = GlobalKey();
  final LinkedKey<HintProvider> _hintKey = LinkedKey<HintProvider>();

  void _valueUpdated() {
    state.filled.value = _controllerManager.value.text.isNotEmpty;
  }

  void _focusChanged() {
    final bool focused = _focusNodeManager.value.hasFocus;
    state.focused.value = focused;
    widget.onFocusChanged?.call(focused);
  }

  @override
  YgSearchFieldState createState() {
    return YgSearchFieldState(
      filled: _controllerManager.value.text.isNotEmpty,
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
    _hint.value = widget.hint;
  }

  @override
  void dispose() {
    _hint.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isTextField = (widget.searchAction == YgSearchAction.menu) ||
        (widget.searchAction == YgSearchAction.auto && !YgConsts.isMobile);

    final YgSearchFieldController<T> controller = _controllerManager.value;

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
          value: AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget? child) {
              return Text(controller.text);
            },
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
          loading: controller.loading,
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
  void openMenu() {}

  @override
  void openScreen() {
    final BorderRadius radius = context.fieldTheme.decorationTheme.borderRadiusOutlined;

    Navigator.of(context).push(
      MobileSearchRoute<T>(
        searchController: _controllerManager.value,
        borderRadius: radius,
        fieldKey: _fieldKey,
        hintKey: _hintKey,
        searchBarBuilder: (BuildContext context) {
          return SearchAppBar<T>(
            controller: _controllerManager.value,
            placeholder: widget.placeholder ?? widget.label,
            keyboardType: widget.keyboardType,
            autocorrect: widget.autocorrect,
            textCapitalization: widget.textCapitalization,
            inputFormatters: widget.inputFormatters,
            initialValue: widget.initialValue,
            textInputAction: TextInputAction.none,
            onChanged: widget.onChanged,
            onEditingComplete: widget.onEditingComplete,
            onFocusChanged: null,
            focusNode: null,
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
      (Route<dynamic> route) => route is! MobileSearchRoute,
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
}

// ignore: prefer-single-widget-per-file
class HintProvider extends LinkedUpdateProvider<HintProvider> {
  const HintProvider({
    required super.key,
    required super.child,
    required this.hint,
  });

  final Widget? hint;

  @override
  bool updateShouldNotify(HintProvider oldWidget) {
    return oldWidget.hint != hint;
  }
}

abstract class LinkedUpdateProvider<T extends LinkedUpdateProvider<T>> extends ProxyWidget {
  const LinkedUpdateProvider({
    required LinkedKey<T> super.key,
    required super.child,
  });

  @override
  Element createElement() {
    return LinkedUpdateProviderElement<T>(this);
  }

  bool updateShouldNotify(covariant LinkedUpdateProvider oldWidget);
}

class LinkedUpdateProviderElement<T extends LinkedUpdateProvider<T>> extends ProxyElement {
  LinkedUpdateProviderElement(super.widget);

  final Set<Element> _dependents = <Element>{};

  void addDependent(Element dependent) {
    _dependents.add(dependent);
  }

  void removeDependent(Element dependent) {
    _dependents.remove(dependent);
  }

  @override
  void updated(LinkedUpdateProvider<T> oldWidget) {
    if ((widget as LinkedUpdateProvider<T>).updateShouldNotify(oldWidget)) {
      super.updated(oldWidget);
    }
  }

  @override
  void notifyClients(LinkedUpdateProvider<T> oldWidget) {
    for (final Element dependent in _dependents) {
      dependent.rebuild(force: true);
    }
  }
}

abstract interface class LinkedKey<T extends LinkedUpdateProvider<T>> implements Key {
  factory LinkedKey() = _LinkedKey<T>;

  BuildContext? get currentContext;
  Widget? get currentWidget;
}

class _LinkedKey<T extends LinkedUpdateProvider<T>> extends GlobalKey<State<StatefulWidget>> implements LinkedKey<T> {
  const _LinkedKey() : super.constructor();
}

class RemotelyLinkedBuilder<T extends LinkedUpdateProvider<T>> extends Widget {
  const RemotelyLinkedBuilder({
    super.key,
    required this.builder,
    required this.linkedKey,
  });

  final Widget Function(T? linkedWidget) builder;
  final LinkedKey linkedKey;

  @override
  RemotelyLinkedBuilderElement createElement() {
    return RemotelyLinkedBuilderElement<T>(this);
  }
}

class RemotelyLinkedBuilderElement<T extends LinkedUpdateProvider<T>> extends ComponentElement {
  RemotelyLinkedBuilderElement(super.widget);

  bool _hadUnsatisfiedDependency = false;

  @override
  RemotelyLinkedBuilder<T> get widget => super.widget as RemotelyLinkedBuilder<T>;

  LinkedUpdateProviderElement<T>? get _linkedElement =>
      widget.linkedKey.currentContext as LinkedUpdateProviderElement<T>?;

  @override
  Widget build() {
    final LinkedUpdateProviderElement<T>? linkedElement = _linkedElement;

    final T? remoteWidget;
    if (linkedElement != null) {
      remoteWidget = _linkedElement?.widget as T?;
      _linkedElement?.addDependent(this);
      _hadUnsatisfiedDependency = true;
    } else {
      remoteWidget = null;
    }

    return widget.builder(remoteWidget);
  }

  @override
  void activate() {
    super.activate();
    final bool hadDependencies = _linkedElement != null || _hadUnsatisfiedDependency;
    _hadUnsatisfiedDependency = false;
    if (hadDependencies) {
      didChangeDependencies();
    }
  }

  @override
  void deactivate() {
    final LinkedUpdateProviderElement<T>? linkedElement = _linkedElement;
    if (linkedElement != null) {
      linkedElement.removeDependent(this);
    }
    super.deactivate();
  }
}
