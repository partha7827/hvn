// GENERATED CODE - DO NOT MODIFY BY HAND

part of privacy;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const Privacy _$public = const Privacy._('public');
const Privacy _$private = const Privacy._('private');

Privacy _$privacyValueOf(String name) {
  switch (name) {
    case 'public':
      return _$public;
    case 'private':
      return _$private;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<Privacy> _$privacyValues = new BuiltSet<Privacy>(const <Privacy>[
  _$public,
  _$private,
]);

Serializer<Privacy> _$privacySerializer = new _$PrivacySerializer();

class _$PrivacySerializer implements PrimitiveSerializer<Privacy> {
  @override
  final Iterable<Type> types = const <Type>[Privacy];
  @override
  final String wireName = 'Privacy';

  @override
  Object serialize(Serializers serializers, Privacy object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  Privacy deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      Privacy.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
