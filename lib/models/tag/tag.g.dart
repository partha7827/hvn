// GENERATED CODE - DO NOT MODIFY BY HAND

part of tag;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Tag> _$tagSerializer = new _$TagSerializer();

class _$TagSerializer implements StructuredSerializer<Tag> {
  @override
  final Iterable<Type> types = const [Tag, _$Tag];
  @override
  final String wireName = 'Tag';

  @override
  Iterable<Object> serialize(Serializers serializers, Tag object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'isRecommended',
      serializers.serialize(object.isRecommended,
          specifiedType: const FullType(bool)),
      'isVisible',
      serializers.serialize(object.isVisible,
          specifiedType: const FullType(bool)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  Tag deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TagBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isRecommended':
          result.isRecommended = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isVisible':
          result.isVisible = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$Tag extends Tag {
  @override
  final String id;
  @override
  final String name;
  @override
  final bool isRecommended;
  @override
  final bool isVisible;
  @override
  final DateTime createdAt;

  factory _$Tag([void Function(TagBuilder) updates]) =>
      (new TagBuilder()..update(updates)).build();

  _$Tag._(
      {this.id, this.name, this.isRecommended, this.isVisible, this.createdAt})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Tag', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Tag', 'name');
    }
    if (isRecommended == null) {
      throw new BuiltValueNullFieldError('Tag', 'isRecommended');
    }
    if (isVisible == null) {
      throw new BuiltValueNullFieldError('Tag', 'isVisible');
    }
    if (createdAt == null) {
      throw new BuiltValueNullFieldError('Tag', 'createdAt');
    }
  }

  @override
  Tag rebuild(void Function(TagBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TagBuilder toBuilder() => new TagBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Tag &&
        id == other.id &&
        name == other.name &&
        isRecommended == other.isRecommended &&
        isVisible == other.isVisible &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, id.hashCode), name.hashCode),
                isRecommended.hashCode),
            isVisible.hashCode),
        createdAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Tag')
          ..add('id', id)
          ..add('name', name)
          ..add('isRecommended', isRecommended)
          ..add('isVisible', isVisible)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class TagBuilder implements Builder<Tag, TagBuilder> {
  _$Tag _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  bool _isRecommended;
  bool get isRecommended => _$this._isRecommended;
  set isRecommended(bool isRecommended) =>
      _$this._isRecommended = isRecommended;

  bool _isVisible;
  bool get isVisible => _$this._isVisible;
  set isVisible(bool isVisible) => _$this._isVisible = isVisible;

  DateTime _createdAt;
  DateTime get createdAt => _$this._createdAt;
  set createdAt(DateTime createdAt) => _$this._createdAt = createdAt;

  TagBuilder() {
    Tag._initializeBuilder(this);
  }

  TagBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _isRecommended = _$v.isRecommended;
      _isVisible = _$v.isVisible;
      _createdAt = _$v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Tag other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Tag;
  }

  @override
  void update(void Function(TagBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Tag build() {
    final _$result = _$v ??
        new _$Tag._(
            id: id,
            name: name,
            isRecommended: isRecommended,
            isVisible: isVisible,
            createdAt: createdAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
