// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'progress_percentage_indicator_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class ProgressPercentageIndicatorTheme extends ThemeExtension<ProgressPercentageIndicatorTheme> {
  const ProgressPercentageIndicatorTheme({
    required this.contentSpacing,
    required this.percentageTextStyle,
    required this.progressBarHeight,
    required this.remainingSubtitleTextStyle,
    required this.shimmerColor,
    required this.subtitleTextStyle,
    required this.timeRemainingTextStyle,
    required this.titleTextStyle,
  });

  final double contentSpacing;
  final TextStyle percentageTextStyle;
  final double progressBarHeight;
  final TextStyle remainingSubtitleTextStyle;
  final Color shimmerColor;
  final TextStyle subtitleTextStyle;
  final TextStyle timeRemainingTextStyle;
  final TextStyle titleTextStyle;

  static final ProgressPercentageIndicatorTheme consumerLight = ProgressPercentageIndicatorTheme(
    contentSpacing: _$ProgressPercentageIndicatorTheme.contentSpacing[0],
    percentageTextStyle: _$ProgressPercentageIndicatorTheme.percentageTextStyle[0],
    progressBarHeight: _$ProgressPercentageIndicatorTheme.progressBarHeight[0],
    remainingSubtitleTextStyle: _$ProgressPercentageIndicatorTheme.remainingSubtitleTextStyle[0],
    shimmerColor: _$ProgressPercentageIndicatorTheme.shimmerColor[0],
    subtitleTextStyle: _$ProgressPercentageIndicatorTheme.subtitleTextStyle[0],
    timeRemainingTextStyle: _$ProgressPercentageIndicatorTheme.timeRemainingTextStyle[0],
    titleTextStyle: _$ProgressPercentageIndicatorTheme.titleTextStyle[0],
  );

  static final ProgressPercentageIndicatorTheme consumerDark = ProgressPercentageIndicatorTheme(
    contentSpacing: _$ProgressPercentageIndicatorTheme.contentSpacing[1],
    percentageTextStyle: _$ProgressPercentageIndicatorTheme.percentageTextStyle[1],
    progressBarHeight: _$ProgressPercentageIndicatorTheme.progressBarHeight[1],
    remainingSubtitleTextStyle: _$ProgressPercentageIndicatorTheme.remainingSubtitleTextStyle[1],
    shimmerColor: _$ProgressPercentageIndicatorTheme.shimmerColor[1],
    subtitleTextStyle: _$ProgressPercentageIndicatorTheme.subtitleTextStyle[1],
    timeRemainingTextStyle: _$ProgressPercentageIndicatorTheme.timeRemainingTextStyle[1],
    titleTextStyle: _$ProgressPercentageIndicatorTheme.titleTextStyle[1],
  );

  static final ProgressPercentageIndicatorTheme professionalLight = ProgressPercentageIndicatorTheme(
    contentSpacing: _$ProgressPercentageIndicatorTheme.contentSpacing[2],
    percentageTextStyle: _$ProgressPercentageIndicatorTheme.percentageTextStyle[2],
    progressBarHeight: _$ProgressPercentageIndicatorTheme.progressBarHeight[2],
    remainingSubtitleTextStyle: _$ProgressPercentageIndicatorTheme.remainingSubtitleTextStyle[2],
    shimmerColor: _$ProgressPercentageIndicatorTheme.shimmerColor[2],
    subtitleTextStyle: _$ProgressPercentageIndicatorTheme.subtitleTextStyle[2],
    timeRemainingTextStyle: _$ProgressPercentageIndicatorTheme.timeRemainingTextStyle[2],
    titleTextStyle: _$ProgressPercentageIndicatorTheme.titleTextStyle[2],
  );

  static final ProgressPercentageIndicatorTheme professionalDark = ProgressPercentageIndicatorTheme(
    contentSpacing: _$ProgressPercentageIndicatorTheme.contentSpacing[3],
    percentageTextStyle: _$ProgressPercentageIndicatorTheme.percentageTextStyle[3],
    progressBarHeight: _$ProgressPercentageIndicatorTheme.progressBarHeight[3],
    remainingSubtitleTextStyle: _$ProgressPercentageIndicatorTheme.remainingSubtitleTextStyle[3],
    shimmerColor: _$ProgressPercentageIndicatorTheme.shimmerColor[3],
    subtitleTextStyle: _$ProgressPercentageIndicatorTheme.subtitleTextStyle[3],
    timeRemainingTextStyle: _$ProgressPercentageIndicatorTheme.timeRemainingTextStyle[3],
    titleTextStyle: _$ProgressPercentageIndicatorTheme.titleTextStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  ProgressPercentageIndicatorTheme copyWith({
    double? contentSpacing,
    TextStyle? percentageTextStyle,
    double? progressBarHeight,
    TextStyle? remainingSubtitleTextStyle,
    Color? shimmerColor,
    TextStyle? subtitleTextStyle,
    TextStyle? timeRemainingTextStyle,
    TextStyle? titleTextStyle,
  }) {
    return ProgressPercentageIndicatorTheme(
      contentSpacing: contentSpacing ?? this.contentSpacing,
      percentageTextStyle: percentageTextStyle ?? this.percentageTextStyle,
      progressBarHeight: progressBarHeight ?? this.progressBarHeight,
      remainingSubtitleTextStyle: remainingSubtitleTextStyle ?? this.remainingSubtitleTextStyle,
      shimmerColor: shimmerColor ?? this.shimmerColor,
      subtitleTextStyle: subtitleTextStyle ?? this.subtitleTextStyle,
      timeRemainingTextStyle: timeRemainingTextStyle ?? this.timeRemainingTextStyle,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
    );
  }

  @override
  ProgressPercentageIndicatorTheme lerp(
      covariant ThemeExtension<ProgressPercentageIndicatorTheme>? other, double t) {
    if (other is! ProgressPercentageIndicatorTheme) return this as ProgressPercentageIndicatorTheme;
    return ProgressPercentageIndicatorTheme(
      contentSpacing: t < 0.5 ? contentSpacing : other.contentSpacing,
      percentageTextStyle: TextStyle.lerp(percentageTextStyle, other.percentageTextStyle, t)!,
      progressBarHeight: t < 0.5 ? progressBarHeight : other.progressBarHeight,
      remainingSubtitleTextStyle:
          TextStyle.lerp(remainingSubtitleTextStyle, other.remainingSubtitleTextStyle, t)!,
      shimmerColor: Color.lerp(shimmerColor, other.shimmerColor, t)!,
      subtitleTextStyle: TextStyle.lerp(subtitleTextStyle, other.subtitleTextStyle, t)!,
      timeRemainingTextStyle: TextStyle.lerp(timeRemainingTextStyle, other.timeRemainingTextStyle, t)!,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProgressPercentageIndicatorTheme &&
            const DeepCollectionEquality().equals(contentSpacing, other.contentSpacing) &&
            const DeepCollectionEquality().equals(percentageTextStyle, other.percentageTextStyle) &&
            const DeepCollectionEquality().equals(progressBarHeight, other.progressBarHeight) &&
            const DeepCollectionEquality().equals(remainingSubtitleTextStyle, other.remainingSubtitleTextStyle) &&
            const DeepCollectionEquality().equals(shimmerColor, other.shimmerColor) &&
            const DeepCollectionEquality().equals(subtitleTextStyle, other.subtitleTextStyle) &&
            const DeepCollectionEquality().equals(timeRemainingTextStyle, other.timeRemainingTextStyle) &&
            const DeepCollectionEquality().equals(titleTextStyle, other.titleTextStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(contentSpacing),
      const DeepCollectionEquality().hash(percentageTextStyle),
      const DeepCollectionEquality().hash(progressBarHeight),
      const DeepCollectionEquality().hash(remainingSubtitleTextStyle),
      const DeepCollectionEquality().hash(shimmerColor),
      const DeepCollectionEquality().hash(subtitleTextStyle),
      const DeepCollectionEquality().hash(timeRemainingTextStyle),
      const DeepCollectionEquality().hash(titleTextStyle),
    );
  }
}
