// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'dropdown_field_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgDropdownFieldTheme extends ThemeExtension<YgDropdownFieldTheme> {
  const YgDropdownFieldTheme({
    required this.menuItemBackground,
    required this.menuItemPadding,
    required this.menuItemPrefixPadding,
    required this.menuItemSubtitleStyle,
    required this.menuItemSuffixPadding,
    required this.menuItemTitleStyle,
  });

  final Color menuItemBackground;
  final EdgeInsets menuItemPadding;
  final EdgeInsets menuItemPrefixPadding;
  final TextStyle menuItemSubtitleStyle;
  final EdgeInsets menuItemSuffixPadding;
  final TextStyle menuItemTitleStyle;

  static final YgDropdownFieldTheme consumerLight = YgDropdownFieldTheme(
    menuItemBackground: _$YgDropdownFieldTheme.menuItemBackground[0],
    menuItemPadding: _$YgDropdownFieldTheme.menuItemPadding[0],
    menuItemPrefixPadding: _$YgDropdownFieldTheme.menuItemPrefixPadding[0],
    menuItemSubtitleStyle: _$YgDropdownFieldTheme.menuItemSubtitleStyle[0],
    menuItemSuffixPadding: _$YgDropdownFieldTheme.menuItemSuffixPadding[0],
    menuItemTitleStyle: _$YgDropdownFieldTheme.menuItemTitleStyle[0],
  );

  static final YgDropdownFieldTheme consumerDark = YgDropdownFieldTheme(
    menuItemBackground: _$YgDropdownFieldTheme.menuItemBackground[1],
    menuItemPadding: _$YgDropdownFieldTheme.menuItemPadding[1],
    menuItemPrefixPadding: _$YgDropdownFieldTheme.menuItemPrefixPadding[1],
    menuItemSubtitleStyle: _$YgDropdownFieldTheme.menuItemSubtitleStyle[1],
    menuItemSuffixPadding: _$YgDropdownFieldTheme.menuItemSuffixPadding[1],
    menuItemTitleStyle: _$YgDropdownFieldTheme.menuItemTitleStyle[1],
  );

  static final YgDropdownFieldTheme professionalLight = YgDropdownFieldTheme(
    menuItemBackground: _$YgDropdownFieldTheme.menuItemBackground[2],
    menuItemPadding: _$YgDropdownFieldTheme.menuItemPadding[2],
    menuItemPrefixPadding: _$YgDropdownFieldTheme.menuItemPrefixPadding[2],
    menuItemSubtitleStyle: _$YgDropdownFieldTheme.menuItemSubtitleStyle[2],
    menuItemSuffixPadding: _$YgDropdownFieldTheme.menuItemSuffixPadding[2],
    menuItemTitleStyle: _$YgDropdownFieldTheme.menuItemTitleStyle[2],
  );

  static final YgDropdownFieldTheme professionalDark = YgDropdownFieldTheme(
    menuItemBackground: _$YgDropdownFieldTheme.menuItemBackground[3],
    menuItemPadding: _$YgDropdownFieldTheme.menuItemPadding[3],
    menuItemPrefixPadding: _$YgDropdownFieldTheme.menuItemPrefixPadding[3],
    menuItemSubtitleStyle: _$YgDropdownFieldTheme.menuItemSubtitleStyle[3],
    menuItemSuffixPadding: _$YgDropdownFieldTheme.menuItemSuffixPadding[3],
    menuItemTitleStyle: _$YgDropdownFieldTheme.menuItemTitleStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgDropdownFieldTheme copyWith({
    Color? menuItemBackground,
    EdgeInsets? menuItemPadding,
    EdgeInsets? menuItemPrefixPadding,
    TextStyle? menuItemSubtitleStyle,
    EdgeInsets? menuItemSuffixPadding,
    TextStyle? menuItemTitleStyle,
  }) {
    return YgDropdownFieldTheme(
      menuItemBackground: menuItemBackground ?? this.menuItemBackground,
      menuItemPadding: menuItemPadding ?? this.menuItemPadding,
      menuItemPrefixPadding:
          menuItemPrefixPadding ?? this.menuItemPrefixPadding,
      menuItemSubtitleStyle:
          menuItemSubtitleStyle ?? this.menuItemSubtitleStyle,
      menuItemSuffixPadding:
          menuItemSuffixPadding ?? this.menuItemSuffixPadding,
      menuItemTitleStyle: menuItemTitleStyle ?? this.menuItemTitleStyle,
    );
  }

  @override
  YgDropdownFieldTheme lerp(
      covariant ThemeExtension<YgDropdownFieldTheme>? other, double t) {
    if (other is! YgDropdownFieldTheme) return this as YgDropdownFieldTheme;
    return YgDropdownFieldTheme(
      menuItemBackground:
          Color.lerp(menuItemBackground, other.menuItemBackground, t)!,
      menuItemPadding: t < 0.5 ? menuItemPadding : other.menuItemPadding,
      menuItemPrefixPadding:
          t < 0.5 ? menuItemPrefixPadding : other.menuItemPrefixPadding,
      menuItemSubtitleStyle: TextStyle.lerp(
          menuItemSubtitleStyle, other.menuItemSubtitleStyle, t)!,
      menuItemSuffixPadding:
          t < 0.5 ? menuItemSuffixPadding : other.menuItemSuffixPadding,
      menuItemTitleStyle:
          TextStyle.lerp(menuItemTitleStyle, other.menuItemTitleStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgDropdownFieldTheme &&
            const DeepCollectionEquality()
                .equals(menuItemBackground, other.menuItemBackground) &&
            const DeepCollectionEquality()
                .equals(menuItemPadding, other.menuItemPadding) &&
            const DeepCollectionEquality()
                .equals(menuItemPrefixPadding, other.menuItemPrefixPadding) &&
            const DeepCollectionEquality()
                .equals(menuItemSubtitleStyle, other.menuItemSubtitleStyle) &&
            const DeepCollectionEquality()
                .equals(menuItemSuffixPadding, other.menuItemSuffixPadding) &&
            const DeepCollectionEquality()
                .equals(menuItemTitleStyle, other.menuItemTitleStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(menuItemBackground),
      const DeepCollectionEquality().hash(menuItemPadding),
      const DeepCollectionEquality().hash(menuItemPrefixPadding),
      const DeepCollectionEquality().hash(menuItemSubtitleStyle),
      const DeepCollectionEquality().hash(menuItemSuffixPadding),
      const DeepCollectionEquality().hash(menuItemTitleStyle),
    );
  }
}
