// GENERATED CODE - DO NOT MODIFY BY HAND

part of audio_file;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AudioFile> _$audioFileSerializer = new _$AudioFileSerializer();

class _$AudioFileSerializer implements StructuredSerializer<AudioFile> {
  @override
  final Iterable<Type> types = const [AudioFile, _$AudioFile];
  @override
  final String wireName = 'AudioFile';

  @override
  Iterable<Object> serialize(Serializers serializers, AudioFile object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'artworkUrlPath',
      serializers.serialize(object.artworkUrlPath,
          specifiedType: const FullType(String)),
      'audioFileUrlPath',
      serializers.serialize(object.audioFileUrlPath,
          specifiedType: const FullType(String)),
      'author',
      serializers.serialize(object.author, specifiedType: const FullType(User)),
      'duration',
      serializers.serialize(object.duration,
          specifiedType: const FullType(int)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'subTitle',
      serializers.serialize(object.subTitle,
          specifiedType: const FullType(String)),
      'tags',
      serializers.serialize(object.tags,
          specifiedType: const FullType(BuiltSet, const [const FullType(Tag)])),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  AudioFile deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AudioFileBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'artworkUrlPath':
          result.artworkUrlPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'audioFileUrlPath':
          result.audioFileUrlPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'author':
          result.author.replace(serializers.deserialize(value,
              specifiedType: const FullType(User)) as User);
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'subTitle':
          result.subTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(Tag)]))
              as BuiltSet<Object>);
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AudioFile extends AudioFile {
  @override
  final String artworkUrlPath;
  @override
  final String audioFileUrlPath;
  @override
  final User author;
  @override
  final int duration;
  @override
  final String id;
  @override
  final String subTitle;
  @override
  final BuiltSet<Tag> tags;
  @override
  final String title;

  factory _$AudioFile([void Function(AudioFileBuilder) updates]) =>
      (new AudioFileBuilder()..update(updates)).build();

  _$AudioFile._(
      {this.artworkUrlPath,
      this.audioFileUrlPath,
      this.author,
      this.duration,
      this.id,
      this.subTitle,
      this.tags,
      this.title})
      : super._() {
    if (artworkUrlPath == null) {
      throw new BuiltValueNullFieldError('AudioFile', 'artworkUrlPath');
    }
    if (audioFileUrlPath == null) {
      throw new BuiltValueNullFieldError('AudioFile', 'audioFileUrlPath');
    }
    if (author == null) {
      throw new BuiltValueNullFieldError('AudioFile', 'author');
    }
    if (duration == null) {
      throw new BuiltValueNullFieldError('AudioFile', 'duration');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('AudioFile', 'id');
    }
    if (subTitle == null) {
      throw new BuiltValueNullFieldError('AudioFile', 'subTitle');
    }
    if (tags == null) {
      throw new BuiltValueNullFieldError('AudioFile', 'tags');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('AudioFile', 'title');
    }
  }

  @override
  AudioFile rebuild(void Function(AudioFileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AudioFileBuilder toBuilder() => new AudioFileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AudioFile &&
        artworkUrlPath == other.artworkUrlPath &&
        audioFileUrlPath == other.audioFileUrlPath &&
        author == other.author &&
        duration == other.duration &&
        id == other.id &&
        subTitle == other.subTitle &&
        tags == other.tags &&
        title == other.title;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc(0, artworkUrlPath.hashCode),
                                audioFileUrlPath.hashCode),
                            author.hashCode),
                        duration.hashCode),
                    id.hashCode),
                subTitle.hashCode),
            tags.hashCode),
        title.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AudioFile')
          ..add('artworkUrlPath', artworkUrlPath)
          ..add('audioFileUrlPath', audioFileUrlPath)
          ..add('author', author)
          ..add('duration', duration)
          ..add('id', id)
          ..add('subTitle', subTitle)
          ..add('tags', tags)
          ..add('title', title))
        .toString();
  }
}

class AudioFileBuilder implements Builder<AudioFile, AudioFileBuilder> {
  _$AudioFile _$v;

  String _artworkUrlPath;
  String get artworkUrlPath => _$this._artworkUrlPath;
  set artworkUrlPath(String artworkUrlPath) =>
      _$this._artworkUrlPath = artworkUrlPath;

  String _audioFileUrlPath;
  String get audioFileUrlPath => _$this._audioFileUrlPath;
  set audioFileUrlPath(String audioFileUrlPath) =>
      _$this._audioFileUrlPath = audioFileUrlPath;

  UserBuilder _author;
  UserBuilder get author => _$this._author ??= new UserBuilder();
  set author(UserBuilder author) => _$this._author = author;

  int _duration;
  int get duration => _$this._duration;
  set duration(int duration) => _$this._duration = duration;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _subTitle;
  String get subTitle => _$this._subTitle;
  set subTitle(String subTitle) => _$this._subTitle = subTitle;

  SetBuilder<Tag> _tags;
  SetBuilder<Tag> get tags => _$this._tags ??= new SetBuilder<Tag>();
  set tags(SetBuilder<Tag> tags) => _$this._tags = tags;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  AudioFileBuilder();

  AudioFileBuilder get _$this {
    if (_$v != null) {
      _artworkUrlPath = _$v.artworkUrlPath;
      _audioFileUrlPath = _$v.audioFileUrlPath;
      _author = _$v.author?.toBuilder();
      _duration = _$v.duration;
      _id = _$v.id;
      _subTitle = _$v.subTitle;
      _tags = _$v.tags?.toBuilder();
      _title = _$v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AudioFile other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AudioFile;
  }

  @override
  void update(void Function(AudioFileBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AudioFile build() {
    _$AudioFile _$result;
    try {
      _$result = _$v ??
          new _$AudioFile._(
              artworkUrlPath: artworkUrlPath,
              audioFileUrlPath: audioFileUrlPath,
              author: author.build(),
              duration: duration,
              id: id,
              subTitle: subTitle,
              tags: tags.build(),
              title: title);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'author';
        author.build();

        _$failedField = 'tags';
        tags.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AudioFile', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
