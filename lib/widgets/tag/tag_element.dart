abstract class TagElement {
  String text;
}

/// Represents an element containing a hastag #
class HashTagElement extends TagElement {
  final String tag;

  HashTagElement(this.tag);

  @override
  String toString() {
    return 'HashTagElement: $tag';
  }
}

/// Represents an element containing a link
class LinkElement extends TagElement {
  final String url;

  LinkElement(this.url);

  @override
  String toString() {
    return 'LinkElement: $url';
  }
}

class TextElement extends TagElement {
  @override
  final String text;

  TextElement(this.text);

  @override
  String toString() {
    return 'TextElement: $text';
  }
}

/// Represents an element containing a @
class UserTagElement extends TagElement {
  final String userTag;

  UserTagElement(this.userTag);

  @override
  String toString() {
    return 'HashTagElement: $userTag';
  }
}
