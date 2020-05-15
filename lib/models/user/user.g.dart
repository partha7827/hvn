// GENERATED CODE - DO NOT MODIFY BY HAND

part of user;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<User> _$userSerializer = new _$UserSerializer();

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable<Object> serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'account',
      serializers.serialize(object.account,
          specifiedType: const FullType(String)),
      'accountCreationTime',
      serializers.serialize(object.accountCreationTime,
          specifiedType: const FullType(DateTime)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
      'badges',
      serializers.serialize(object.badges,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'chatId',
      serializers.serialize(object.chatId,
          specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'experiencePoints',
      serializers.serialize(object.experiencePoints,
          specifiedType: const FullType(int)),
      'featured',
      serializers.serialize(object.featured,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'followers',
      serializers.serialize(object.followers,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'following',
      serializers.serialize(object.following,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'info',
      serializers.serialize(object.info, specifiedType: const FullType(String)),
      'isLive',
      serializers.serialize(object.isLive, specifiedType: const FullType(bool)),
      'isOnline',
      serializers.serialize(object.isOnline,
          specifiedType: const FullType(bool)),
      'karmaPoints',
      serializers.serialize(object.karmaPoints,
          specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'photoUrl',
      serializers.serialize(object.photoUrl,
          specifiedType: const FullType(String)),
      'scheduled',
      serializers.serialize(object.scheduled,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
      'uploads',
      serializers.serialize(object.uploads,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'videoId',
      serializers.serialize(object.videoId,
          specifiedType: const FullType(String)),
    ];
    if (object.playlist != null) {
      result
        ..add('playlist')
        ..add(serializers.serialize(object.playlist,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'account':
          result.account = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'accountCreationTime':
          result.accountCreationTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'badges':
          result.badges.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'chatId':
          result.chatId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'experiencePoints':
          result.experiencePoints = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'featured':
          result.featured.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'followers':
          result.followers.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'following':
          result.following.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'info':
          result.info = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isLive':
          result.isLive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isOnline':
          result.isOnline = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'karmaPoints':
          result.karmaPoints = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photoUrl':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'playlist':
          result.playlist = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'scheduled':
          result.scheduled.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uploads':
          result.uploads.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'videoId':
          result.videoId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$User extends User {
  @override
  final String account;
  @override
  final DateTime accountCreationTime;
  @override
  final String address;
  @override
  final BuiltList<String> badges;
  @override
  final String chatId;
  @override
  final String email;
  @override
  final int experiencePoints;
  @override
  final BuiltList<String> featured;
  @override
  final BuiltList<String> followers;
  @override
  final BuiltList<String> following;
  @override
  final String id;
  @override
  final String info;
  @override
  final bool isLive;
  @override
  final bool isOnline;
  @override
  final int karmaPoints;
  @override
  final String name;
  @override
  final String photoUrl;
  @override
  final String playlist;
  @override
  final BuiltList<String> scheduled;
  @override
  final String status;
  @override
  final BuiltList<String> uploads;
  @override
  final String videoId;

  factory _$User([void Function(UserBuilder) updates]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._(
      {this.account,
      this.accountCreationTime,
      this.address,
      this.badges,
      this.chatId,
      this.email,
      this.experiencePoints,
      this.featured,
      this.followers,
      this.following,
      this.id,
      this.info,
      this.isLive,
      this.isOnline,
      this.karmaPoints,
      this.name,
      this.photoUrl,
      this.playlist,
      this.scheduled,
      this.status,
      this.uploads,
      this.videoId})
      : super._() {
    if (account == null) {
      throw new BuiltValueNullFieldError('User', 'account');
    }
    if (accountCreationTime == null) {
      throw new BuiltValueNullFieldError('User', 'accountCreationTime');
    }
    if (address == null) {
      throw new BuiltValueNullFieldError('User', 'address');
    }
    if (badges == null) {
      throw new BuiltValueNullFieldError('User', 'badges');
    }
    if (chatId == null) {
      throw new BuiltValueNullFieldError('User', 'chatId');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('User', 'email');
    }
    if (experiencePoints == null) {
      throw new BuiltValueNullFieldError('User', 'experiencePoints');
    }
    if (featured == null) {
      throw new BuiltValueNullFieldError('User', 'featured');
    }
    if (followers == null) {
      throw new BuiltValueNullFieldError('User', 'followers');
    }
    if (following == null) {
      throw new BuiltValueNullFieldError('User', 'following');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('User', 'id');
    }
    if (info == null) {
      throw new BuiltValueNullFieldError('User', 'info');
    }
    if (isLive == null) {
      throw new BuiltValueNullFieldError('User', 'isLive');
    }
    if (isOnline == null) {
      throw new BuiltValueNullFieldError('User', 'isOnline');
    }
    if (karmaPoints == null) {
      throw new BuiltValueNullFieldError('User', 'karmaPoints');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('User', 'name');
    }
    if (photoUrl == null) {
      throw new BuiltValueNullFieldError('User', 'photoUrl');
    }
    if (scheduled == null) {
      throw new BuiltValueNullFieldError('User', 'scheduled');
    }
    if (status == null) {
      throw new BuiltValueNullFieldError('User', 'status');
    }
    if (uploads == null) {
      throw new BuiltValueNullFieldError('User', 'uploads');
    }
    if (videoId == null) {
      throw new BuiltValueNullFieldError('User', 'videoId');
    }
  }

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        account == other.account &&
        accountCreationTime == other.accountCreationTime &&
        address == other.address &&
        badges == other.badges &&
        chatId == other.chatId &&
        email == other.email &&
        experiencePoints == other.experiencePoints &&
        featured == other.featured &&
        followers == other.followers &&
        following == other.following &&
        id == other.id &&
        info == other.info &&
        isLive == other.isLive &&
        isOnline == other.isOnline &&
        karmaPoints == other.karmaPoints &&
        name == other.name &&
        photoUrl == other.photoUrl &&
        playlist == other.playlist &&
        scheduled == other.scheduled &&
        status == other.status &&
        uploads == other.uploads &&
        videoId == other.videoId;
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
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc(0, account.hashCode), accountCreationTime.hashCode), address.hashCode),
                                                                                badges.hashCode),
                                                                            chatId.hashCode),
                                                                        email.hashCode),
                                                                    experiencePoints.hashCode),
                                                                featured.hashCode),
                                                            followers.hashCode),
                                                        following.hashCode),
                                                    id.hashCode),
                                                info.hashCode),
                                            isLive.hashCode),
                                        isOnline.hashCode),
                                    karmaPoints.hashCode),
                                name.hashCode),
                            photoUrl.hashCode),
                        playlist.hashCode),
                    scheduled.hashCode),
                status.hashCode),
            uploads.hashCode),
        videoId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('account', account)
          ..add('accountCreationTime', accountCreationTime)
          ..add('address', address)
          ..add('badges', badges)
          ..add('chatId', chatId)
          ..add('email', email)
          ..add('experiencePoints', experiencePoints)
          ..add('featured', featured)
          ..add('followers', followers)
          ..add('following', following)
          ..add('id', id)
          ..add('info', info)
          ..add('isLive', isLive)
          ..add('isOnline', isOnline)
          ..add('karmaPoints', karmaPoints)
          ..add('name', name)
          ..add('photoUrl', photoUrl)
          ..add('playlist', playlist)
          ..add('scheduled', scheduled)
          ..add('status', status)
          ..add('uploads', uploads)
          ..add('videoId', videoId))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User _$v;

  String _account;
  String get account => _$this._account;
  set account(String account) => _$this._account = account;

  DateTime _accountCreationTime;
  DateTime get accountCreationTime => _$this._accountCreationTime;
  set accountCreationTime(DateTime accountCreationTime) =>
      _$this._accountCreationTime = accountCreationTime;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  ListBuilder<String> _badges;
  ListBuilder<String> get badges =>
      _$this._badges ??= new ListBuilder<String>();
  set badges(ListBuilder<String> badges) => _$this._badges = badges;

  String _chatId;
  String get chatId => _$this._chatId;
  set chatId(String chatId) => _$this._chatId = chatId;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  int _experiencePoints;
  int get experiencePoints => _$this._experiencePoints;
  set experiencePoints(int experiencePoints) =>
      _$this._experiencePoints = experiencePoints;

  ListBuilder<String> _featured;
  ListBuilder<String> get featured =>
      _$this._featured ??= new ListBuilder<String>();
  set featured(ListBuilder<String> featured) => _$this._featured = featured;

  ListBuilder<String> _followers;
  ListBuilder<String> get followers =>
      _$this._followers ??= new ListBuilder<String>();
  set followers(ListBuilder<String> followers) => _$this._followers = followers;

  ListBuilder<String> _following;
  ListBuilder<String> get following =>
      _$this._following ??= new ListBuilder<String>();
  set following(ListBuilder<String> following) => _$this._following = following;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _info;
  String get info => _$this._info;
  set info(String info) => _$this._info = info;

  bool _isLive;
  bool get isLive => _$this._isLive;
  set isLive(bool isLive) => _$this._isLive = isLive;

  bool _isOnline;
  bool get isOnline => _$this._isOnline;
  set isOnline(bool isOnline) => _$this._isOnline = isOnline;

  int _karmaPoints;
  int get karmaPoints => _$this._karmaPoints;
  set karmaPoints(int karmaPoints) => _$this._karmaPoints = karmaPoints;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  String _playlist;
  String get playlist => _$this._playlist;
  set playlist(String playlist) => _$this._playlist = playlist;

  ListBuilder<String> _scheduled;
  ListBuilder<String> get scheduled =>
      _$this._scheduled ??= new ListBuilder<String>();
  set scheduled(ListBuilder<String> scheduled) => _$this._scheduled = scheduled;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  ListBuilder<String> _uploads;
  ListBuilder<String> get uploads =>
      _$this._uploads ??= new ListBuilder<String>();
  set uploads(ListBuilder<String> uploads) => _$this._uploads = uploads;

  String _videoId;
  String get videoId => _$this._videoId;
  set videoId(String videoId) => _$this._videoId = videoId;

  UserBuilder() {
    User._initializeBuilder(this);
  }

  UserBuilder get _$this {
    if (_$v != null) {
      _account = _$v.account;
      _accountCreationTime = _$v.accountCreationTime;
      _address = _$v.address;
      _badges = _$v.badges?.toBuilder();
      _chatId = _$v.chatId;
      _email = _$v.email;
      _experiencePoints = _$v.experiencePoints;
      _featured = _$v.featured?.toBuilder();
      _followers = _$v.followers?.toBuilder();
      _following = _$v.following?.toBuilder();
      _id = _$v.id;
      _info = _$v.info;
      _isLive = _$v.isLive;
      _isOnline = _$v.isOnline;
      _karmaPoints = _$v.karmaPoints;
      _name = _$v.name;
      _photoUrl = _$v.photoUrl;
      _playlist = _$v.playlist;
      _scheduled = _$v.scheduled?.toBuilder();
      _status = _$v.status;
      _uploads = _$v.uploads?.toBuilder();
      _videoId = _$v.videoId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    _$User _$result;
    try {
      _$result = _$v ??
          new _$User._(
              account: account,
              accountCreationTime: accountCreationTime,
              address: address,
              badges: badges.build(),
              chatId: chatId,
              email: email,
              experiencePoints: experiencePoints,
              featured: featured.build(),
              followers: followers.build(),
              following: following.build(),
              id: id,
              info: info,
              isLive: isLive,
              isOnline: isOnline,
              karmaPoints: karmaPoints,
              name: name,
              photoUrl: photoUrl,
              playlist: playlist,
              scheduled: scheduled.build(),
              status: status,
              uploads: uploads.build(),
              videoId: videoId);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'badges';
        badges.build();

        _$failedField = 'featured';
        featured.build();
        _$failedField = 'followers';
        followers.build();
        _$failedField = 'following';
        following.build();

        _$failedField = 'scheduled';
        scheduled.build();

        _$failedField = 'uploads';
        uploads.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'User', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
