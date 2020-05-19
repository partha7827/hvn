// GENERATED CODE - DO NOT MODIFY BY HAND

part of snippet;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Snippet> _$snippetSerializer = new _$SnippetSerializer();

class _$SnippetSerializer implements StructuredSerializer<Snippet> {
  @override
  final Iterable<Type> types = const [Snippet, _$Snippet];
  @override
  final String wireName = 'Snippet';

  @override
  Iterable<Object> serialize(Serializers serializers, Snippet object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'publishedAt',
      serializers.serialize(object.publishedAt,
          specifiedType: const FullType(DateTime)),
      'tags',
      serializers.serialize(object.tags,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'videoThumbnail',
      serializers.serialize(object.videoThumbnail,
          specifiedType: const FullType(Thumbnail)),
    ];

    return result;
  }

  @override
  Snippet deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SnippetBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'publishedAt':
          result.publishedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'videoThumbnail':
          result.videoThumbnail.replace(serializers.deserialize(value,
              specifiedType: const FullType(Thumbnail)) as Thumbnail);
          break;
      }
    }

    return result.build();
  }
}

class _$Snippet extends Snippet {
  @override
  final String title;
  @override
  final String description;
  @override
  final DateTime publishedAt;
  @override
  final BuiltList<String> tags;
  @override
  final Thumbnail videoThumbnail;

  factory _$Snippet([void Function(SnippetBuilder) updates]) =>
      (new SnippetBuilder()..update(updates)).build();

  _$Snippet._(
      {this.title,
      this.description,
      this.publishedAt,
      this.tags,
      this.videoThumbnail})
      : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('Snippet', 'title');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('Snippet', 'description');
    }
    if (publishedAt == null) {
      throw new BuiltValueNullFieldError('Snippet', 'publishedAt');
    }
    if (tags == null) {
      throw new BuiltValueNullFieldError('Snippet', 'tags');
    }
    if (videoThumbnail == null) {
      throw new BuiltValueNullFieldError('Snippet', 'videoThumbnail');
    }
  }

  @override
  Snippet rebuild(void Function(SnippetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SnippetBuilder toBuilder() => new SnippetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Snippet &&
        title == other.title &&
        description == other.description &&
        publishedAt == other.publishedAt &&
        tags == other.tags &&
        videoThumbnail == other.videoThumbnail;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, title.hashCode), description.hashCode),
                publishedAt.hashCode),
            tags.hashCode),
        videoThumbnail.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Snippet')
          ..add('title', title)
          ..add('description', description)
          ..add('publishedAt', publishedAt)
          ..add('tags', tags)
          ..add('videoThumbnail', videoThumbnail))
        .toString();
  }
}

class SnippetBuilder implements Builder<Snippet, SnippetBuilder> {
  _$Snippet _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  DateTime _publishedAt;
  DateTime get publishedAt => _$this._publishedAt;
  set publishedAt(DateTime publishedAt) => _$this._publishedAt = publishedAt;

  ListBuilder<String> _tags;
  ListBuilder<String> get tags => _$this._tags ??= new ListBuilder<String>();
  set tags(ListBuilder<String> tags) => _$this._tags = tags;

  ThumbnailBuilder _videoThumbnail;
  ThumbnailBuilder get videoThumbnail =>
      _$this._videoThumbnail ??= new ThumbnailBuilder();
  set videoThumbnail(ThumbnailBuilder videoThumbnail) =>
      _$this._videoThumbnail = videoThumbnail;

  SnippetBuilder() {
    Snippet._initializeBuilder(this);
  }

  SnippetBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _description = _$v.description;
      _publishedAt = _$v.publishedAt;
      _tags = _$v.tags?.toBuilder();
      _videoThumbnail = _$v.videoThumbnail?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Snippet other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Snippet;
  }

  @override
  void update(void Function(SnippetBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Snippet build() {
    _$Snippet _$result;
    try {
      _$result = _$v ??
          new _$Snippet._(
              title: title,
              description: description,
              publishedAt: publishedAt,
              tags: tags.build(),
              videoThumbnail: videoThumbnail.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'tags';
        tags.build();
        _$failedField = 'videoThumbnail';
        videoThumbnail.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Snippet', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
