// import 'package:flutter/material.dart';
// import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

// class YgAnimatedDefaultTextStyle<T extends Enum> extends YgAnimatedWidget<T> {
//   const YgAnimatedDefaultTextStyle({
//     super.key,
//     required this.textStyle,
//     required super.controller,
//     required super.curve,
//     required super.duration,
//     required this.child,
//     this.textAlign,
//     this.softWrap = true,
//     this.overflow = TextOverflow.clip,
//     this.maxLines,
//     this.textWidthBasis = TextWidthBasis.parent,
//     this.textHeightBehavior,
//   });

//   /// The widget below this widget in the tree.
//   ///
//   /// {@macro flutter.widgets.ProxyWidget.child}
//   final Widget child;

//   /// The target text style.
//   ///
//   /// The text style must not be null.
//   ///
//   /// When this property is changed, the style will be animated over [duration] time.

//   final YgTextStyleProperty<T> textStyle;

//   /// How the text should be aligned horizontally.
//   ///
//   /// This property takes effect immediately when changed, it is not animated.
//   final TextAlign? textAlign;

//   /// Whether the text should break at soft line breaks.
//   ///
//   /// This property takes effect immediately when changed, it is not animated.
//   ///
//   /// See [DefaultTextStyle.softWrap] for more details.
//   final bool softWrap;

//   /// How visual overflow should be handled.
//   ///
//   /// This property takes effect immediately when changed, it is not animated.
//   final TextOverflow overflow;

//   /// An optional maximum number of lines for the text to span, wrapping if necessary.
//   ///
//   /// This property takes effect immediately when changed, it is not animated.
//   ///
//   /// See [DefaultTextStyle.maxLines] for more details.
//   final int? maxLines;

//   /// The strategy to use when calculating the width of the Text.
//   ///
//   /// See [TextWidthBasis] for possible values and their implications.
//   final TextWidthBasis textWidthBasis;

//   /// {@macro dart.ui.textHeightBehavior}
//   final TextHeightBehavior? textHeightBehavior;

//   @override
//   State<YgAnimatedDefaultTextStyle<T>> createState() => _YgAnimatedDefaultTextStyleState<T>();
  
//   @override
//   Set<YgDynamicAnimatedProperty<T>> get animatedProperties => <YgDynamicAnimatedProperty<T>>{

//   };
// }

// class _YgAnimatedDefaultTextStyleState<T extends Enum> extends YgAnimatedWidgetState<T, YgAnimatedDefaultTextStyle<T>> {
//   late final YgAnimatedProperty<T, TextStyle> _textStyle = createAnimatedProperty(widget.textStyle);

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTextStyle(
//       style: _textStyle.value,
//       textAlign: widget.textAlign,
//       softWrap: widget.softWrap,
//       overflow: widget.overflow,
//       maxLines: widget.maxLines,
//       textWidthBasis: widget.textWidthBasis,
//       textHeightBehavior: widget.textHeightBehavior,
//       child: widget.child,
//     );
//   }
// }
