// GENERATED CODE - DO NOT MODIFY BY HAND

part of video;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Video> _$videoSerializer = new _$VideoSerializer();

class _$VideoSerializer implements StructuredSerializer<Video> {
  @override
  final Iterable<Type> types = const [Video, _$Video];
  @override
  final String wireName = 'Video';

  @override
  Iterable<Object> serialize(Serializers serializers, Video object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'fileDetails',
      serializers.serialize(object.fileDetails,
          specifiedType: const FullType(FileDetails)),
      'snippet',
      serializers.serialize(object.snippet,
          specifiedType: const FullType(Snippet)),
    ];

    return result;
  }

  @override
  Video deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VideoBuilder();

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
        case 'fileDetails':
          result.fileDetails.replace(serializers.deserialize(value,
              specifiedType: const FullType(FileDetails)) as FileDetails);
          break;
        case 'snippet':
          result.snippet.replace(serializers.deserialize(value,
              specifiedType: const FullType(Snippet)) as Snippet);
          break;
      }
    }

    return result.build();
  }
}

class _$Video extends Video {
  @override
  final String id;
  @override
  final FileDetails fileDetails;
  @override
  final Snippet snippet;

  factory _$Video([void Function(VideoBuilder) updates]) =>
      (new VideoBuilder()..update(updates)).build();

  _$Video._({this.id, this.fileDetails, this.snippet}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Video', 'id');
    }
    if (fileDetails == null) {
      throw new BuiltValueNullFieldError('Video', 'fileDetails');
    }
    if (snippet == null) {
      throw new BuiltValueNullFieldError('Video', 'snippet');
    }
  }

  @override
  Video rebuild(void Function(VideoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoBuilder toBuilder() => new VideoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Video &&
        id == other.id &&
        fileDetails == other.fileDetails &&
        snippet == other.snippet;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, id.hashCode), fileDetails.hashCode), snippet.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Video')
          ..add('id', id)
          ..add('fileDetails', fileDetails)
          ..add('snippet', snippet))
        .toString();
  }
}

class VideoBuilder implements Builder<Video, VideoBuilder> {
  _$Video _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  FileDetailsBuilder _fileDetails;
  FileDetailsBuilder get fileDetails =>
      _$this._fileDetails ??= new FileDetailsBuilder();
  set fileDetails(FileDetailsBuilder fileDetails) =>
      _$this._fileDetails = fileDetails;

  SnippetBuilder _snippet;
  SnippetBuilder get snippet => _$this._snippet ??= new SnippetBuilder();
  set snippet(SnippetBuilder snippet) => _$this._snippet = snippet;

  VideoBuilder() {
    Video._initializeBuilder(this);
  }

  VideoBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _fileDetails = _$v.fileDetails?.toBuilder();
      _snippet = _$v.snippet?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Video other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Video;
  }

  @override
  void update(void Function(VideoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Video build() {
    _$Video _$result;
    try {
      _$result = _$v ??
          new _$Video._(
              id: id,
              fileDetails: fileDetails.build(),
              snippet: snippet.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'fileDetails';
        fileDetails.build();
        _$failedField = 'snippet';
        snippet.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Video', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
