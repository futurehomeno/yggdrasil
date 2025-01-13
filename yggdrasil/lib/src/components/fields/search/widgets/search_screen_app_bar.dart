import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/theme/search_modal/search_modal_theme.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'widget_or_loading.dart';

/// Internal search bar.
class SearchScreenAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchScreenAppBar({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.initialValue,
    required this.onChanged,
    required this.onEditingComplete,
    required this.onFocusChanged,
    required this.placeholder,
    required this.textInputAction,
    required this.keyboardType,
    required this.autocorrect,
    required this.textCapitalization,
    required this.inputFormatters,
  });

  final FocusNode? focusNode;
  final String? initialValue;
  final YgSearchControllerAny<Object?, Object?> controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<bool>? onFocusChanged;
  final TextInputAction textInputAction;
  final String? placeholder;
  final TextInputType keyboardType;
  final bool autocorrect;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;

  // We can't make this dynamic because we don't have the context.
  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  State<SearchScreenAppBar> createState() => _SearchScreenAppBarState();
}

class _SearchScreenAppBarState extends State<SearchScreenAppBar>
    with EditableTextContainerStateMixin<SearchScreenAppBar> {
  late bool _isEmpty;

  @override
  String? get initialValue => widget.initialValue;

  @override
  bool get readOnly => false;

  @override
  TextEditingController get userController => widget.controller.textEditingController;

  @override
  FocusNode? get userFocusNode => widget.focusNode;

  @override
  void initState() {
    super.initState();
    _isEmpty = controller.text.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final YgSearchModalTheme theme = context.searchModalTheme;
    final String? placeholder = widget.placeholder;

    return SafeArea(
      bottom: false,
      child: MouseRegion(
        cursor: SystemMouseCursors.text,
        child: buildGestureDetector(
          child: Column(
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  height: theme.headerHeight,
                  child: Padding(
                    padding: theme.headerPadding,
                    child: Row(
                      children: <Widget>[
                        YgIconButton(
                          icon: YgIcons.arrowLeft,
                          onPressed: () => Navigator.of(context).maybePop(),
                        ),
                        SizedBox(width: theme.headerSpacing),
                        Expanded(
                          child: Stack(
                            children: <Widget>[
                              if (placeholder != null && _isEmpty)
                                Text(
                                  placeholder,
                                  style: theme.placeholderStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              DefaultTextStyle(
                                style: theme.valueStyle,
                                child: buildEditableText(
                                  cursorColor: theme.cursorColor,
                                  onChanged: widget.onChanged,
                                  onEditingComplete: widget.onEditingComplete,
                                  textInputAction: widget.textInputAction,
                                  keyboardType: widget.keyboardType,
                                  autocorrect: widget.autocorrect,
                                  textCapitalization: widget.textCapitalization,
                                  inputFormatters: widget.inputFormatters,
                                  disabled: false,
                                  maxLines: 1,
                                  minLines: 1,
                                  obscureText: false,
                                  readOnly: false,
                                  onTapOutside: (_) {},
                                  autofocus: true,
                                  maxLength: null,
                                  maxLengthEnforcement: null,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: theme.headerSpacing),
                        WidgetOrLoading(
                          controller: widget.controller,
                          child: YgIconButton(
                            icon: YgIcons.cross,
                            onPressed: () => widget.controller.clear(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const YgDivider(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void valueUpdated() {
    if (!mounted) {
      return;
    }

    final bool isEmpty = controller.text.isEmpty;
    if (_isEmpty != isEmpty) {
      _isEmpty = controller.text.isEmpty;
      setState(() {});
    }
  }
}
