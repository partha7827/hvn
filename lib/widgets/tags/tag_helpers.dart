// final ValueChanged<Audio> onTap;

import 'package:highvibe/widgets/tags/tag_element.dart';

class TagsHelpers {
  static final linkRegex = RegExp(
    r'(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)',
    caseSensitive: false,
  );
  static final tagRegex = RegExp(
    r'\B#\w*[a-zA-Z]+\w*',
    caseSensitive: false,
  );
  static final userTagRegex = RegExp(
    r'\B@\w*[a-zA-Z]+\w*',
    caseSensitive: false,
  );

  /// Turns [text] into a list of [TagElement]
  List<TagElement> smartify(String text) {
    final sentences = text.split('\n');
    final span = <TagElement>[];
    sentences.forEach((sentence) {
      final words = sentence.split(' ');
      words.forEach((word) {
        if (linkRegex.hasMatch(word)) {
          span.add(LinkElement(word));
        } else if (tagRegex.hasMatch(word)) {
          span.add(HashTagElement(word));
        } else if (userTagRegex.hasMatch(word)) {
          span.add(UserTagElement(word));
        } else {
          span.add(TextElement(word));
        }
        span.add(TextElement(' '));
      });
      if (words.isNotEmpty) {
        span.removeLast();
      }
      span.add(TextElement('\n'));
    });
    if (sentences.isNotEmpty) {
      span.removeLast();
    }
    return span;
  }
}
