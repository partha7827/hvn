import 'package:highvibe/widgets/tag/tag_element.dart';
import 'package:flutter/material.dart' show required;

class TagsHelpers {
  static final _linkRegex = RegExp(
    r'(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)',
    caseSensitive: false,
  );
  static final _tagRegex = RegExp(
    r'\B#\w*[a-zA-Z]+\w*',
    caseSensitive: false,
  );
  static final _userTagRegex = RegExp(
    r'\B@\w*[a-zA-Z]+\w*',
    caseSensitive: false,
  );

  /// Transforms [text] into a list of [TagElement]
  static List<TagElement> tagify({@required String text}) {
    final sentences = text.split('\n');
    final span = <TagElement>[];
    sentences.forEach(
      (sentence) {
        final words = sentence.split(',');
        words.forEach(
          (word) {
            if (_linkRegex.hasMatch(word)) {
              span.add(LinkElement(word));
            } else if (_tagRegex.hasMatch(word)) {
              span.add(HashTagElement(word));
            } else if (_userTagRegex.hasMatch(word)) {
              span.add(UserTagElement(word));
            } else {
              span.add(TextElement(word));
            }
            span.add(TextElement(' '));
          },
        );
        if (words.isNotEmpty) {
          span.removeLast();
        }
        span.add(TextElement('\n'));
      },
    );
    if (sentences.isNotEmpty) {
      span.removeLast();
    }
    return span;
  }
}
