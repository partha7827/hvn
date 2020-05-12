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
      'creationAt',
      serializers.serialize(object.creationAt,
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
        case 'creationAt':
          result.creationAt = serializers.deserialize(value,
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
  final DateTime creationAt;
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
      {this.creationAt, this.id, this.isRecommended, this.isVisible, this.name})
      : super._() {
    if (creationAt == null) {
      throw new BuiltValueNullFieldError('Tag', 'creationAt');
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
        creationAt == other.creationAt &&
        id == other.id &&
        isRecommended == other.isRecommended &&
        isVisible == other.isVisible &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, creationAt.hashCode), id.hashCode),
                isRecommended.hashCode),
            isVisible.hashCode),
        name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Tag')
          ..add('creationAt', creationAt)
          ..add('id', id)
          ..add('isRecommended', isRecommended)
          ..add('isVisible', isVisible)
          ..add('name', name))
        .toString();
  }
}

class TagBuilder implements Builder<Tag, TagBuilder> {
  _$Tag _$v;

  DateTime _creationAt;
  DateTime get creationAt => _$this._creationAt;
  set creationAt(DateTime creationAt) => _$this._creationAt = creationAt;

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
      _creationAt = _$v.creationAt;
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
            creationAt: creationAt,
            id: id,
            isRecommended: isRecommended,
            isVisible: isVisible,
            name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
