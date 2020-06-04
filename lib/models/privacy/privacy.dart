library privacy;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:highvibe/models/serializer/serializer.dart';

part 'privacy.g.dart';

class Privacy extends EnumClass {
  static const Privacy public = _$public;
  static const Privacy private = _$private;

  static Serializer<Privacy> get serializer => _$privacySerializer;

  static BuiltSet<Privacy> get values => _$privacyValues;
  const Privacy._(String name) : super(name);

  String serialize() {
    return serializers.serializeWith(Privacy.serializer, this);
  }

  static Privacy deserialize(String string) {
    return serializers.deserializeWith(Privacy.serializer, string);
  }

  static Privacy valueOf(String name) => _$privacyValueOf(name);
}
