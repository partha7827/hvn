// GENERATED CODE - DO NOT MODIFY BY HAND

part of playlist;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PlayList> _$playListSerializer = new _$PlayListSerializer();

class _$PlayListSerializer implements StructuredSerializer<PlayList> {
  @override
  final Iterable<Type> types = const [PlayList, _$PlayList];
  @override
  final String wireName = 'PlayList';

  @override
  Iterable<Object> serialize(Serializers serializers, PlayList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'coverUrlPath',
      serializers.serialize(object.coverUrlPath,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'privacy',
      serializers.serialize(object.privacy,
          specifiedType: const FullType(Privacy)),
      'audioFiles',
      serializers.serialize(object.audioFiles,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Audio)])),
    ];

    return result;
  }

  @override
  PlayList deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PlayListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'coverUrlPath':
          result.coverUrlPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'privacy':
          result.privacy = serializers.deserialize(value,
              specifiedType: const FullType(Privacy)) as Privacy;
          break;
        case 'audioFiles':
          result.audioFiles.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Audio)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$PlayList extends PlayList {
  @override
  final String coverUrlPath;
  @override
  final String description;
  @override
  final String title;
  @override
  final Privacy privacy;
  @override
  final BuiltList<Audio> audioFiles;

  factory _$PlayList([void Function(PlayListBuilder) updates]) =>
      (new PlayListBuilder()..update(updates)).build();

  _$PlayList._(
      {this.coverUrlPath,
      this.description,
      this.title,
      this.privacy,
      this.audioFiles})
      : super._() {
    if (coverUrlPath == null) {
      throw new BuiltValueNullFieldError('PlayList', 'coverUrlPath');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('PlayList', 'description');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('PlayList', 'title');
    }
    if (privacy == null) {
      throw new BuiltValueNullFieldError('PlayList', 'privacy');
    }
    if (audioFiles == null) {
      throw new BuiltValueNullFieldError('PlayList', 'audioFiles');
    }
  }

  @override
  PlayList rebuild(void Function(PlayListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlayListBuilder toBuilder() => new PlayListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PlayList &&
        coverUrlPath == other.coverUrlPath &&
        description == other.description &&
        title == other.title &&
        privacy == other.privacy &&
        audioFiles == other.audioFiles;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, coverUrlPath.hashCode), description.hashCode),
                title.hashCode),
            privacy.hashCode),
        audioFiles.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PlayList')
          ..add('coverUrlPath', coverUrlPath)
          ..add('description', description)
          ..add('title', title)
          ..add('privacy', privacy)
          ..add('audioFiles', audioFiles))
        .toString();
  }
}

class PlayListBuilder implements Builder<PlayList, PlayListBuilder> {
  _$PlayList _$v;

  String _coverUrlPath;
  String get coverUrlPath => _$this._coverUrlPath;
  set coverUrlPath(String coverUrlPath) => _$this._coverUrlPath = coverUrlPath;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  Privacy _privacy;
  Privacy get privacy => _$this._privacy;
  set privacy(Privacy privacy) => _$this._privacy = privacy;

  ListBuilder<Audio> _audioFiles;
  ListBuilder<Audio> get audioFiles =>
      _$this._audioFiles ??= new ListBuilder<Audio>();
  set audioFiles(ListBuilder<Audio> audioFiles) =>
      _$this._audioFiles = audioFiles;

  PlayListBuilder();

  PlayListBuilder get _$this {
    if (_$v != null) {
      _coverUrlPath = _$v.coverUrlPath;
      _description = _$v.description;
      _title = _$v.title;
      _privacy = _$v.privacy;
      _audioFiles = _$v.audioFiles?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PlayList other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PlayList;
  }

  @override
  void update(void Function(PlayListBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PlayList build() {
    _$PlayList _$result;
    try {
      _$result = _$v ??
          new _$PlayList._(
              coverUrlPath: coverUrlPath,
              description: description,
              title: title,
              privacy: privacy,
              audioFiles: audioFiles.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'audioFiles';
        audioFiles.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PlayList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
