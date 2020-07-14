// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Message> _$messageSerializer = new _$MessageSerializer();

class _$MessageSerializer implements StructuredSerializer<Message> {
  @override
  final Iterable<Type> types = const [Message, _$Message];
  @override
  final String wireName = 'Message';

  @override
  Iterable<Object> serialize(Serializers serializers, Message object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'chatId',
      serializers.serialize(object.chatId,
          specifiedType: const FullType(String)),
      'authorId',
      serializers.serialize(object.authorId,
          specifiedType: const FullType(String)),
      'authorName',
      serializers.serialize(object.authorName,
          specifiedType: const FullType(String)),
      'authorPhotoUrl',
      serializers.serialize(object.authorPhotoUrl,
          specifiedType: const FullType(String)),
      'content',
      serializers.serialize(object.content,
          specifiedType: const FullType(String)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  Message deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MessageBuilder();

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
        case 'chatId':
          result.chatId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'authorId':
          result.authorId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'authorName':
          result.authorName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'authorPhotoUrl':
          result.authorPhotoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$Message extends Message {
  @override
  final String id;
  @override
  final String chatId;
  @override
  final String authorId;
  @override
  final String authorName;
  @override
  final String authorPhotoUrl;
  @override
  final String content;
  @override
  final DateTime createdAt;

  factory _$Message([void Function(MessageBuilder) updates]) =>
      (new MessageBuilder()..update(updates)).build();

  _$Message._(
      {this.id,
      this.chatId,
      this.authorId,
      this.authorName,
      this.authorPhotoUrl,
      this.content,
      this.createdAt})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Message', 'id');
    }
    if (chatId == null) {
      throw new BuiltValueNullFieldError('Message', 'chatId');
    }
    if (authorId == null) {
      throw new BuiltValueNullFieldError('Message', 'authorId');
    }
    if (authorName == null) {
      throw new BuiltValueNullFieldError('Message', 'authorName');
    }
    if (authorPhotoUrl == null) {
      throw new BuiltValueNullFieldError('Message', 'authorPhotoUrl');
    }
    if (content == null) {
      throw new BuiltValueNullFieldError('Message', 'content');
    }
    if (createdAt == null) {
      throw new BuiltValueNullFieldError('Message', 'createdAt');
    }
  }

  @override
  Message rebuild(void Function(MessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageBuilder toBuilder() => new MessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Message &&
        id == other.id &&
        chatId == other.chatId &&
        authorId == other.authorId &&
        authorName == other.authorName &&
        authorPhotoUrl == other.authorPhotoUrl &&
        content == other.content &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), chatId.hashCode),
                        authorId.hashCode),
                    authorName.hashCode),
                authorPhotoUrl.hashCode),
            content.hashCode),
        createdAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Message')
          ..add('id', id)
          ..add('chatId', chatId)
          ..add('authorId', authorId)
          ..add('authorName', authorName)
          ..add('authorPhotoUrl', authorPhotoUrl)
          ..add('content', content)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class MessageBuilder implements Builder<Message, MessageBuilder> {
  _$Message _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _chatId;
  String get chatId => _$this._chatId;
  set chatId(String chatId) => _$this._chatId = chatId;

  String _authorId;
  String get authorId => _$this._authorId;
  set authorId(String authorId) => _$this._authorId = authorId;

  String _authorName;
  String get authorName => _$this._authorName;
  set authorName(String authorName) => _$this._authorName = authorName;

  String _authorPhotoUrl;
  String get authorPhotoUrl => _$this._authorPhotoUrl;
  set authorPhotoUrl(String authorPhotoUrl) =>
      _$this._authorPhotoUrl = authorPhotoUrl;

  String _content;
  String get content => _$this._content;
  set content(String content) => _$this._content = content;

  DateTime _createdAt;
  DateTime get createdAt => _$this._createdAt;
  set createdAt(DateTime createdAt) => _$this._createdAt = createdAt;

  MessageBuilder() {
    Message._initializeBuilder(this);
  }

  MessageBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _chatId = _$v.chatId;
      _authorId = _$v.authorId;
      _authorName = _$v.authorName;
      _authorPhotoUrl = _$v.authorPhotoUrl;
      _content = _$v.content;
      _createdAt = _$v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Message other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Message;
  }

  @override
  void update(void Function(MessageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Message build() {
    final _$result = _$v ??
        new _$Message._(
            id: id,
            chatId: chatId,
            authorId: authorId,
            authorName: authorName,
            authorPhotoUrl: authorPhotoUrl,
            content: content,
            createdAt: createdAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
