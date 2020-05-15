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
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(DateTime)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'isRecommended',
      serializers.serialize(object.isRecommended,
          specifiedType: const FullType(bool)),
      'isVisible',
      serializers.serialize(object.isVisible,
          specifiedType: const FullType(bool)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
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
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Tag extends Tag {
  @override
  final DateTime createdAt;
  @override
  final String id;
  @override
  final bool isRecommended;
  @override
  final bool isVisible;
  @override
  final String name;

  factory _$Tag([void Function(TagBuilder) updates]) =>
      (new TagBuilder()..update(updates)).build();

  _$Tag._(
      {this.createdAt, this.id, this.isRecommended, this.isVisible, this.name})
      : super._() {
    if (createdAt == null) {
      throw new BuiltValueNullFieldError('Tag', 'createdAt');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('Tag', 'id');
    }
    if (isRecommended == null) {
      throw new BuiltValueNullFieldError('Tag', 'isRecommended');
    }
    if (isVisible == null) {
      throw new BuiltValueNullFieldError('Tag', 'isVisible');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Tag', 'name');
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
        createdAt == other.createdAt &&
        id == other.id &&
        isRecommended == other.isRecommended &&
        isVisible == other.isVisible &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, createdAt.hashCode), id.hashCode),
                isRecommended.hashCode),
            isVisible.hashCode),
        name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Tag')
          ..add('createdAt', createdAt)
          ..add('id', id)
          ..add('isRecommended', isRecommended)
          ..add('isVisible', isVisible)
          ..add('name', name))
        .toString();
  }
}

class TagBuilder implements Builder<Tag, TagBuilder> {
  _$Tag _$v;

  DateTime _createdAt;
  DateTime get createdAt => _$this._createdAt;
  set createdAt(DateTime createdAt) => _$this._createdAt = createdAt;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  bool _isRecommended;
  bool get isRecommended => _$this._isRecommended;
  set isRecommended(bool isRecommended) =>
      _$this._isRecommended = isRecommended;

  bool _isVisible;
  bool get isVisible => _$this._isVisible;
  set isVisible(bool isVisible) => _$this._isVisible = isVisible;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  TagBuilder();

  TagBuilder get _$this {
    if (_$v != null) {
      _createdAt = _$v.createdAt;
      _id = _$v.id;
      _isRecommended = _$v.isRecommended;
      _isVisible = _$v.isVisible;
      _name = _$v.name;
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
            createdAt: createdAt,
            id: id,
            isRecommended: isRecommended,
            isVisible: isVisible,
            name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
