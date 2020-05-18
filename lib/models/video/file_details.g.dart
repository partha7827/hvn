// GENERATED CODE - DO NOT MODIFY BY HAND

part of file_details;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FileDetails> _$fileDetailsSerializer = new _$FileDetailsSerializer();

class _$FileDetailsSerializer implements StructuredSerializer<FileDetails> {
  @override
  final Iterable<Type> types = const [FileDetails, _$FileDetails];
  @override
  final String wireName = 'FileDetails';

  @override
  Iterable<Object> serialize(Serializers serializers, FileDetails object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'creationTime',
      serializers.serialize(object.creationTime,
          specifiedType: const FullType(DateTime)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
    ];
    if (object.bitrateBps != null) {
      result
        ..add('bitrateBps')
        ..add(serializers.serialize(object.bitrateBps,
            specifiedType: const FullType(int)));
    }
    if (object.durationMs != null) {
      result
        ..add('durationMs')
        ..add(serializers.serialize(object.durationMs,
            specifiedType: const FullType(int)));
    }
    if (object.fileName != null) {
      result
        ..add('fileName')
        ..add(serializers.serialize(object.fileName,
            specifiedType: const FullType(String)));
    }
    if (object.fileSize != null) {
      result
        ..add('fileSize')
        ..add(serializers.serialize(object.fileSize,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  FileDetails deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FileDetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'bitrateBps':
          result.bitrateBps = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'creationTime':
          result.creationTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'durationMs':
          result.durationMs = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'fileName':
          result.fileName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fileSize':
          result.fileSize = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$FileDetails extends FileDetails {
  @override
  final int bitrateBps;
  @override
  final DateTime creationTime;
  @override
  final int durationMs;
  @override
  final String fileName;
  @override
  final int fileSize;
  @override
  final String url;

  factory _$FileDetails([void Function(FileDetailsBuilder) updates]) =>
      (new FileDetailsBuilder()..update(updates)).build();

  _$FileDetails._(
      {this.bitrateBps,
      this.creationTime,
      this.durationMs,
      this.fileName,
      this.fileSize,
      this.url})
      : super._() {
    if (creationTime == null) {
      throw new BuiltValueNullFieldError('FileDetails', 'creationTime');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('FileDetails', 'url');
    }
  }

  @override
  FileDetails rebuild(void Function(FileDetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FileDetailsBuilder toBuilder() => new FileDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FileDetails &&
        bitrateBps == other.bitrateBps &&
        creationTime == other.creationTime &&
        durationMs == other.durationMs &&
        fileName == other.fileName &&
        fileSize == other.fileSize &&
        url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, bitrateBps.hashCode), creationTime.hashCode),
                    durationMs.hashCode),
                fileName.hashCode),
            fileSize.hashCode),
        url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FileDetails')
          ..add('bitrateBps', bitrateBps)
          ..add('creationTime', creationTime)
          ..add('durationMs', durationMs)
          ..add('fileName', fileName)
          ..add('fileSize', fileSize)
          ..add('url', url))
        .toString();
  }
}

class FileDetailsBuilder implements Builder<FileDetails, FileDetailsBuilder> {
  _$FileDetails _$v;

  int _bitrateBps;
  int get bitrateBps => _$this._bitrateBps;
  set bitrateBps(int bitrateBps) => _$this._bitrateBps = bitrateBps;

  DateTime _creationTime;
  DateTime get creationTime => _$this._creationTime;
  set creationTime(DateTime creationTime) =>
      _$this._creationTime = creationTime;

  int _durationMs;
  int get durationMs => _$this._durationMs;
  set durationMs(int durationMs) => _$this._durationMs = durationMs;

  String _fileName;
  String get fileName => _$this._fileName;
  set fileName(String fileName) => _$this._fileName = fileName;

  int _fileSize;
  int get fileSize => _$this._fileSize;
  set fileSize(int fileSize) => _$this._fileSize = fileSize;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  FileDetailsBuilder() {
    FileDetails._initializeBuilder(this);
  }

  FileDetailsBuilder get _$this {
    if (_$v != null) {
      _bitrateBps = _$v.bitrateBps;
      _creationTime = _$v.creationTime;
      _durationMs = _$v.durationMs;
      _fileName = _$v.fileName;
      _fileSize = _$v.fileSize;
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FileDetails other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FileDetails;
  }

  @override
  void update(void Function(FileDetailsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FileDetails build() {
    final _$result = _$v ??
        new _$FileDetails._(
            bitrateBps: bitrateBps,
            creationTime: creationTime,
            durationMs: durationMs,
            fileName: fileName,
            fileSize: fileSize,
            url: url);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
