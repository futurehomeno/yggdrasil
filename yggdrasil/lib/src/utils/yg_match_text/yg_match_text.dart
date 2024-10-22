import 'package:flutter/material.dart';

import 'yg_formatted_text.dart';
import 'yg_text_match.dart';

/// Renders a YgFormatted text.
///
/// Accepts a [style] which is applied to all text which does is not in range of
/// a match. Any text inside a match gets styled using [matchedStyle].
class YgMatchText extends StatelessWidget {
  const YgMatchText({
    super.key,
    required this.text,
    required this.style,
    required this.matchedStyle,
  });

  final YgFormattedText text;
  final TextStyle style;
  final TextStyle matchedStyle;

  @override
  Widget build(BuildContext context) {
    if (this.text.matches.isEmpty) {
      return Text(
        this.text.text,
        style: style,
      );
    }

    final String text = this.text.text;
    final List<TextSpan> parts = <TextSpan>[];
    final List<YgTextMatch> matches = List<YgTextMatch>.of(this.text.matches);
    matches.sort((YgTextMatch a, YgTextMatch b) => a.start.compareTo(b.start));

    int matchStart = 0;
    int matchEnd = 0;
    for (final YgTextMatch match in matches) {
      // Ignore matches with zero or negative length.
      if (match.start >= match.end || match.end < 0) {
        continue;
      }

      if (match.start > matchEnd) {
        // There is a gap between the current match and the previous one.

        // If this is not the first match, add previous match
        if (matchEnd > 0) {
          final String string = text.substring(matchStart, matchEnd);
          parts.add(TextSpan(
            text: string,
            style: matchedStyle,
          ));
        }

        // If this match does not start at zero, add normal text between the
        // previous and current match.
        if (match.start > 0) {
          final String string = text.substring(matchEnd, match.start);
          parts.add(TextSpan(
            text: string,
          ));
        }

        // If the start is more than the already defined start, update it. If
        // not, we don't need to update it. Only can happen for first valid match.
        if (match.start > matchStart) {
          matchStart = match.start;
        }

        matchEnd = match.end;
        if (matchEnd >= text.length) {
          // This match matches till the end of the text or further. We don't
          // have to check any other matches.
          break;
        }
      } else if (match.end > matchEnd) {
        // There is overlap with the previous match, and this match ends later,
        // so we update were the current match ends.
        matchEnd = match.end;
      }
    }

    if (matchEnd <= 0) {
      // There were no valid matches.
      parts.add(TextSpan(
        text: text,
      ));
    } else if (matchEnd >= text.length) {
      // The last match ends at the end of or outside of the text.
      final String string = text.substring(matchStart, text.length);
      parts.add(TextSpan(
        text: string,
        style: matchedStyle,
      ));
    } else {
      final String matchedString = text.substring(matchStart, matchEnd);
      parts.add(TextSpan(
        text: matchedString,
        style: matchedStyle,
      ));

      final String remainingString = text.substring(matchEnd, text.length);
      parts.add(TextSpan(
        text: remainingString,
      ));
    }

    return Text.rich(
      TextSpan(
        children: parts,
        style: style,
      ),
    );
  }
}
