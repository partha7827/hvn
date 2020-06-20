// GENERATED CODE - DO NOT MODIFY BY HAND

part of audio_file;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Audio> _$audioSerializer = new _$AudioSerializer();

class _$AudioSerializer implements StructuredSerializer<Audio> {
  @override
  final Iterable<Type> types = const [Audio, _$Audio];
  @override
  final String wireName = 'Audio';

  @override
  Iterable<Object> serialize(Serializers serializers, Audio object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
      'userName',
      serializers.serialize(object.userName,
          specifiedType: const FullType(String)),
      'userAvatar',
      serializers.serialize(object.userAvatar,
          specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'subTitle',
      serializers.serialize(object.subTitle,
          specifiedType: const FullType(String)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(String)),
      'artworkUrlPath',
      serializers.serialize(object.artworkUrlPath,
          specifiedType: const FullType(String)),
      'audioUrlPath',
      serializers.serialize(object.audioUrlPath,
          specifiedType: const FullType(String)),
      'isRecommended',
      serializers.serialize(object.isRecommended,
          specifiedType: const FullType(bool)),
      'duration',
      serializers.serialize(object.duration,
          specifiedType: const FullType(int)),
      'tags',
      serializers.serialize(object.tags,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  Audio deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AudioBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userName':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userAvatar':
          result.userAvatar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'subTitle':
          result.subTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'author':
          result.author = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'artworkUrlPath':
          result.artworkUrlPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'audioUrlPath':
          result.audioUrlPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isRecommended':
          result.isRecommended = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$Audio extends Audio {
  @override
  final String id;
  @override
  final String userId;
  @override
  final String userName;
  @override
  final String userAvatar;
  @override
  final String title;
  @override
  final String subTitle;
  @override
  final String author;
  @override
  final String artworkUrlPath;
  @override
  final String audioUrlPath;
  @override
  final bool isRecommended;
  @override
  final int duration;
  @override
  final BuiltList<String> tags;

  factory _$Audio([void Function(AudioBuilder) updates]) =>
      (new AudioBuilder()..update(updates)).build();

  _$Audio._(
      {this.id,
      this.userId,
      this.userName,
      this.userAvatar,
      this.title,
      this.subTitle,
      this.author,
      this.artworkUrlPath,
      this.audioUrlPath,
      this.isRecommended,
      this.duration,
      this.tags})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Audio', 'id');
    }
    if (userId == null) {
      throw new BuiltValueNullFieldError('Audio', 'userId');
    }
    if (userName == null) {
      throw new BuiltValueNullFieldError('Audio', 'userName');
    }
    if (userAvatar == null) {
      throw new BuiltValueNullFieldError('Audio', 'userAvatar');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('Audio', 'title');
    }
    if (subTitle == null) {
      throw new BuiltValueNullFieldError('Audio', 'subTitle');
    }
    if (author == null) {
      throw new BuiltValueNullFieldError('Audio', 'author');
    }
    if (artworkUrlPath == null) {
      throw new BuiltValueNullFieldError('Audio', 'artworkUrlPath');
    }
    if (audioUrlPath == null) {
      throw new BuiltValueNullFieldError('Audio', 'audioUrlPath');
    }
    if (isRecommended == null) {
      throw new BuiltValueNullFieldError('Audio', 'isRecommended');
    }
    if (duration == null) {
      throw new BuiltValueNullFieldError('Audio', 'duration');
    }
    if (tags == null) {
      throw new BuiltValueNullFieldError('Audio', 'tags');
    }
  }

  @override
  Audio rebuild(void Function(AudioBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AudioBuilder toBuilder() => new AudioBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Audio &&
        id == other.id &&
        userId == other.userId &&
        userName == other.userName &&
        userAvatar == other.userAvatar &&
        title == other.title &&
        subTitle == other.subTitle &&
        author == other.author &&
        artworkUrlPath == other.artworkUrlPath &&
        audioUrlPath == other.audioUrlPath &&
        isRecommended == other.isRecommended &&
        duration == other.duration &&
        tags == other.tags;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, id.hashCode),
                                                userId.hashCode),
                                            userName.hashCode),
                                        userAvatar.hashCode),
                                    title.hashCode),
                                subTitle.hashCode),
                            author.hashCode),
                        artworkUrlPath.hashCode),
                    audioUrlPath.hashCode),
                isRecommended.hashCode),
            duration.hashCode),
        tags.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Audio')
          ..add('id', id)
          ..add('userId', userId)
          ..add('userName', userName)
          ..add('userAvatar', userAvatar)
          ..add('title', title)
          ..add('subTitle', subTitle)
          ..add('author', author)
          ..add('artworkUrlPath', artworkUrlPath)
          ..add('audioUrlPath', audioUrlPath)
          ..add('isRecommended', isRecommended)
          ..add('duration', duration)
          ..add('tags', tags))
        .toString();
  }
}

class AudioBuilder implements Builder<Audio, AudioBuilder> {
  _$Audio _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  String _userName;
  String get userName => _$this._userName;
  set userName(String userName) => _$this._userName = userName;

  String _userAvatar;
  String get userAvatar => _$this._userAvatar;
  set userAvatar(String userAvatar) => _$this._userAvatar = userAvatar;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _subTitle;
  String get subTitle => _$this._subTitle;
  set subTitle(String subTitle) => _$this._subTitle = subTitle;

  String _author;
  String get author => _$this._author;
  set author(String author) => _$this._author = author;

  String _artworkUrlPath;
  String get artworkUrlPath => _$this._artworkUrlPath;
  set artworkUrlPath(String artworkUrlPath) =>
      _$this._artworkUrlPath = artworkUrlPath;

  String _audioUrlPath;
  String get audioUrlPath => _$this._audioUrlPath;
  set audioUrlPath(String audioUrlPath) => _$this._audioUrlPath = audioUrlPath;

  bool _isRecommended;
  bool get isRecommended => _$this._isRecommended;
  set isRecommended(bool isRecommended) =>
      _$this._isRecommended = isRecommended;

  int _duration;
  int get duration => _$this._duration;
  set duration(int duration) => _$this._duration = duration;

  ListBuilder<String> _tags;
  ListBuilder<String> get tags => _$this._tags ??= new ListBuilder<String>();
  set tags(ListBuilder<String> tags) => _$this._tags = tags;

  AudioBuilder() {
    Audio._initializeBuilder(this);
  }

  AudioBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _userId = _$v.userId;
      _userName = _$v.userName;
      _userAvatar = _$v.userAvatar;
      _title = _$v.title;
      _subTitle = _$v.subTitle;
      _author = _$v.author;
      _artworkUrlPath = _$v.artworkUrlPath;
      _audioUrlPath = _$v.audioUrlPath;
      _isRecommended = _$v.isRecommended;
      _duration = _$v.duration;
      _tags = _$v.tags?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Audio other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Audio;
  }

  @override
  void update(void Function(AudioBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Audio build() {
    _$Audio _$result;
    try {
      _$result = _$v ??
          new _$Audio._(
              id: id,
              userId: userId,
              userName: userName,
              userAvatar: userAvatar,
              title: title,
              subTitle: subTitle,
              author: author,
              artworkUrlPath: artworkUrlPath,
              audioUrlPath: audioUrlPath,
              isRecommended: isRecommended,
              duration: duration,
              tags: tags.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'tags';
        tags.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Audio', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
