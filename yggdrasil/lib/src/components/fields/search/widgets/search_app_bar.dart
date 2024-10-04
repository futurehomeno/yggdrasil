import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/theme/search_modal/search_modal_theme.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

class SearchAppBar extends StatefulWidget with EditableTextContainerWidgetMixin implements PreferredSizeWidget {
  const SearchAppBar({
    super.key,
    this.readOnly = false,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.onChanged,
    this.onEditingComplete,
    this.onFocusChanged,
    this.placeholder,
    required this.textInputAction,
    required this.keyboardType,
    required this.autocorrect,
    required this.textCapitalization,
    this.error,
    this.inputFormatters,
  });

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();

  @override
  final bool readOnly;

  @override
  final FocusNode? focusNode;

  @override
  final String? initialValue;

  @override
  final TextEditingController? controller;

  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<bool>? onFocusChanged;
  final TextInputAction textInputAction;
  final String? placeholder;
  final TextInputType keyboardType;
  final bool autocorrect;
  final TextCapitalization textCapitalization;
  final String? error;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Size get preferredSize => const Size.fromHeight(65);
}

class _SearchAppBarState extends State<SearchAppBar> with EditableTextContainerStateMixin<SearchAppBar> {
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
                              if (placeholder != null)
                                Text(
                                  placeholder,
                                  style: theme.placeholderStyle,
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
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: theme.headerSpacing),
                        YgIconButton(
                          icon: YgIcons.cross,
                          onPressed: () => controller.text = '',
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
}
