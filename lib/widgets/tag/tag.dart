import 'package:flutter/material.dart';
import 'package:highvibe/widgets/tag/tag_element.dart';
import 'package:highvibe/widgets/tag/tag_helpers.dart';
import 'package:highvibe/widgets/tag/tag_text_span.dart';

class Tag extends StatelessWidget {
  /// Text to be linkified
  final String text;

  /// Style for non-link text
  final TextStyle style;

  /// Style of link text
  final TextStyle linkStyle;

  /// Style of HashTag text
  final TextStyle tagStyle;

  /// Callback for tapping a link
  final ValueChanged<String> onLinkTap;

  /// Callback for tapping a hashtag
  final ValueChanged<String> onTagTap;

  /// Callback for tapping a user tag
  final ValueChanged<String> onUserTagTap;

  const Tag({
    this.text,
    this.style,
    this.linkStyle,
    this.tagStyle,
    this.onLinkTap,
    this.onTagTap,
    this.onUserTagTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final elements = TagsHelpers.tagify(text: text);
    return Container(
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.red),
          children: [
            ...elements.map<TextSpan>(
              (element) {
                if (element is HashTagElement) {
                  return TagTextSpan(
                    text: element.tag,
                    style: tagStyle,
                    onPressed: () => _onTagClick(element.tag),
                  );
                } else if (element is UserTagElement) {
                  return TagTextSpan(
                    text: element.userTag,
                    style: tagStyle,
                    onPressed: () => _onUserTagTap(element.userTag),
                  );
                } else if (element is LinkElement) {
                  return TagTextSpan(
                    text: element.url,
                    style: tagStyle,
                    onPressed: () => _onLinkTap(element.url),
                  );
                } else {
                  return TextSpan(text: element.text, style: style);
                }
              },
            ),
            const WidgetSpan(child: Icon(Icons.close, size: 12)),
          ],
        ),
      ),
    );
  }

  void _onTagClick(String tag) {
    if (onTagTap != null) {
      onTagTap(tag);
    }
  }

  void _onLinkTap(String url) {
    if (onLinkTap != null) {
      onLinkTap(url);
    }
  }

  void _onUserTagTap(String userTag) {
    if (onUserTagTap != null) {
      onUserTagTap(userTag);
    }
  }
}
