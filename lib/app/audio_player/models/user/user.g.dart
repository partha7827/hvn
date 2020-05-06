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
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
      'account',
      serializers.serialize(object.account,
          specifiedType: const FullType(String)),
      'chatId',
      serializers.serialize(object.chatId,
          specifiedType: const FullType(String)),
      'videoId',
      serializers.serialize(object.videoId,
          specifiedType: const FullType(String)),
      'lastTimeSeen',
      serializers.serialize(object.lastTimeSeen,
          specifiedType: const FullType(DateTime)),
      'accountCreationTime',
      serializers.serialize(object.accountCreationTime,
          specifiedType: const FullType(DateTime)),
      'followers',
      serializers.serialize(object.followers,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'following',
      serializers.serialize(object.following,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'uploads',
      serializers.serialize(object.uploads,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'featured',
      serializers.serialize(object.featured,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'badges',
      serializers.serialize(object.badges,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'scheduled',
      serializers.serialize(object.scheduled,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'isLive',
      serializers.serialize(object.isLive, specifiedType: const FullType(bool)),
      'isOnline',
      serializers.serialize(object.isOnline,
          specifiedType: const FullType(bool)),
    ];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.status != null) {
      result
        ..add('status')
        ..add(serializers.serialize(object.status,
            specifiedType: const FullType(String)));
    }
    if (object.photoUrl != null) {
      result
        ..add('photoUrl')
        ..add(serializers.serialize(object.photoUrl,
            specifiedType: const FullType(String)));
    }
    if (object.info != null) {
      result
        ..add('info')
        ..add(serializers.serialize(object.info,
            specifiedType: const FullType(String)));
    }
    if (object.playlist != null) {
      result
        ..add('playlist')
        ..add(serializers.serialize(object.playlist,
            specifiedType: const FullType(String)));
    }
    if (object.karmaPoints != null) {
      result
        ..add('karmaPoints')
        ..add(serializers.serialize(object.karmaPoints,
            specifiedType: const FullType(int)));
    }
    if (object.experiencePoints != null) {
      result
        ..add('experiencePoints')
        ..add(serializers.serialize(object.experiencePoints,
            specifiedType: const FullType(int)));
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
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'account':
          result.account = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'chatId':
          result.chatId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'videoId':
          result.videoId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastTimeSeen':
          result.lastTimeSeen = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'accountCreationTime':
          result.accountCreationTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photoUrl':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'info':
          result.info = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'playlist':
          result.playlist = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'karmaPoints':
          result.karmaPoints = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'experiencePoints':
          result.experiencePoints = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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
        case 'uploads':
          result.uploads.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'featured':
          result.featured.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'badges':
          result.badges.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'scheduled':
          result.scheduled.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'isLive':
          result.isLive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isOnline':
          result.isOnline = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$User extends User {
  @override
  final String id;
  @override
  final String email;
  @override
  final String address;
  @override
  final String account;
  @override
  final String chatId;
  @override
  final String videoId;
  @override
  final DateTime lastTimeSeen;
  @override
  final DateTime accountCreationTime;
  @override
  final String name;
  @override
  final String status;
  @override
  final String photoUrl;
  @override
  final String info;
  @override
  final String playlist;
  @override
  final int karmaPoints;
  @override
  final int experiencePoints;
  @override
  final BuiltList<String> followers;
  @override
  final BuiltList<String> following;
  @override
  final BuiltList<String> uploads;
  @override
  final BuiltList<String> featured;
  @override
  final BuiltList<String> badges;
  @override
  final BuiltList<String> scheduled;
  @override
  final bool isLive;
  @override
  final bool isOnline;

  factory _$User([void Function(UserBuilder) updates]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._(
      {this.id,
      this.email,
      this.address,
      this.account,
      this.chatId,
      this.videoId,
      this.lastTimeSeen,
      this.accountCreationTime,
      this.name,
      this.status,
      this.photoUrl,
      this.info,
      this.playlist,
      this.karmaPoints,
      this.experiencePoints,
      this.followers,
      this.following,
      this.uploads,
      this.featured,
      this.badges,
      this.scheduled,
      this.isLive,
      this.isOnline})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('User', 'id');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('User', 'email');
    }
    if (address == null) {
      throw new BuiltValueNullFieldError('User', 'address');
    }
    if (account == null) {
      throw new BuiltValueNullFieldError('User', 'account');
    }
    if (chatId == null) {
      throw new BuiltValueNullFieldError('User', 'chatId');
    }
    if (videoId == null) {
      throw new BuiltValueNullFieldError('User', 'videoId');
    }
    if (lastTimeSeen == null) {
      throw new BuiltValueNullFieldError('User', 'lastTimeSeen');
    }
    if (accountCreationTime == null) {
      throw new BuiltValueNullFieldError('User', 'accountCreationTime');
    }
    if (followers == null) {
      throw new BuiltValueNullFieldError('User', 'followers');
    }
    if (following == null) {
      throw new BuiltValueNullFieldError('User', 'following');
    }
    if (uploads == null) {
      throw new BuiltValueNullFieldError('User', 'uploads');
    }
    if (featured == null) {
      throw new BuiltValueNullFieldError('User', 'featured');
    }
    if (badges == null) {
      throw new BuiltValueNullFieldError('User', 'badges');
    }
    if (scheduled == null) {
      throw new BuiltValueNullFieldError('User', 'scheduled');
    }
    if (isLive == null) {
      throw new BuiltValueNullFieldError('User', 'isLive');
    }
    if (isOnline == null) {
      throw new BuiltValueNullFieldError('User', 'isOnline');
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
        id == other.id &&
        email == other.email &&
        address == other.address &&
        account == other.account &&
        chatId == other.chatId &&
        videoId == other.videoId &&
        lastTimeSeen == other.lastTimeSeen &&
        accountCreationTime == other.accountCreationTime &&
        name == other.name &&
        status == other.status &&
        photoUrl == other.photoUrl &&
        info == other.info &&
        playlist == other.playlist &&
        karmaPoints == other.karmaPoints &&
        experiencePoints == other.experiencePoints &&
        followers == other.followers &&
        following == other.following &&
        uploads == other.uploads &&
        featured == other.featured &&
        badges == other.badges &&
        scheduled == other.scheduled &&
        isLive == other.isLive &&
        isOnline == other.isOnline;
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
                                                                            $jc($jc($jc($jc($jc(0, id.hashCode), email.hashCode), address.hashCode), account.hashCode),
                                                                                chatId.hashCode),
                                                                            videoId.hashCode),
                                                                        lastTimeSeen.hashCode),
                                                                    accountCreationTime.hashCode),
                                                                name.hashCode),
                                                            status.hashCode),
                                                        photoUrl.hashCode),
                                                    info.hashCode),
                                                playlist.hashCode),
                                            karmaPoints.hashCode),
                                        experiencePoints.hashCode),
                                    followers.hashCode),
                                following.hashCode),
                            uploads.hashCode),
                        featured.hashCode),
                    badges.hashCode),
                scheduled.hashCode),
            isLive.hashCode),
        isOnline.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('id', id)
          ..add('email', email)
          ..add('address', address)
          ..add('account', account)
          ..add('chatId', chatId)
          ..add('videoId', videoId)
          ..add('lastTimeSeen', lastTimeSeen)
          ..add('accountCreationTime', accountCreationTime)
          ..add('name', name)
          ..add('status', status)
          ..add('photoUrl', photoUrl)
          ..add('info', info)
          ..add('playlist', playlist)
          ..add('karmaPoints', karmaPoints)
          ..add('experiencePoints', experiencePoints)
          ..add('followers', followers)
          ..add('following', following)
          ..add('uploads', uploads)
          ..add('featured', featured)
          ..add('badges', badges)
          ..add('scheduled', scheduled)
          ..add('isLive', isLive)
          ..add('isOnline', isOnline))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _account;
  String get account => _$this._account;
  set account(String account) => _$this._account = account;

  String _chatId;
  String get chatId => _$this._chatId;
  set chatId(String chatId) => _$this._chatId = chatId;

  String _videoId;
  String get videoId => _$this._videoId;
  set videoId(String videoId) => _$this._videoId = videoId;

  DateTime _lastTimeSeen;
  DateTime get lastTimeSeen => _$this._lastTimeSeen;
  set lastTimeSeen(DateTime lastTimeSeen) =>
      _$this._lastTimeSeen = lastTimeSeen;

  DateTime _accountCreationTime;
  DateTime get accountCreationTime => _$this._accountCreationTime;
  set accountCreationTime(DateTime accountCreationTime) =>
      _$this._accountCreationTime = accountCreationTime;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  String _info;
  String get info => _$this._info;
  set info(String info) => _$this._info = info;

  String _playlist;
  String get playlist => _$this._playlist;
  set playlist(String playlist) => _$this._playlist = playlist;

  int _karmaPoints;
  int get karmaPoints => _$this._karmaPoints;
  set karmaPoints(int karmaPoints) => _$this._karmaPoints = karmaPoints;

  int _experiencePoints;
  int get experiencePoints => _$this._experiencePoints;
  set experiencePoints(int experiencePoints) =>
      _$this._experiencePoints = experiencePoints;

  ListBuilder<String> _followers;
  ListBuilder<String> get followers =>
      _$this._followers ??= new ListBuilder<String>();
  set followers(ListBuilder<String> followers) => _$this._followers = followers;

  ListBuilder<String> _following;
  ListBuilder<String> get following =>
      _$this._following ??= new ListBuilder<String>();
  set following(ListBuilder<String> following) => _$this._following = following;

  ListBuilder<String> _uploads;
  ListBuilder<String> get uploads =>
      _$this._uploads ??= new ListBuilder<String>();
  set uploads(ListBuilder<String> uploads) => _$this._uploads = uploads;

  ListBuilder<String> _featured;
  ListBuilder<String> get featured =>
      _$this._featured ??= new ListBuilder<String>();
  set featured(ListBuilder<String> featured) => _$this._featured = featured;

  ListBuilder<String> _badges;
  ListBuilder<String> get badges =>
      _$this._badges ??= new ListBuilder<String>();
  set badges(ListBuilder<String> badges) => _$this._badges = badges;

  ListBuilder<String> _scheduled;
  ListBuilder<String> get scheduled =>
      _$this._scheduled ??= new ListBuilder<String>();
  set scheduled(ListBuilder<String> scheduled) => _$this._scheduled = scheduled;

  bool _isLive;
  bool get isLive => _$this._isLive;
  set isLive(bool isLive) => _$this._isLive = isLive;

  bool _isOnline;
  bool get isOnline => _$this._isOnline;
  set isOnline(bool isOnline) => _$this._isOnline = isOnline;

  UserBuilder();

  UserBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _email = _$v.email;
      _address = _$v.address;
      _account = _$v.account;
      _chatId = _$v.chatId;
      _videoId = _$v.videoId;
      _lastTimeSeen = _$v.lastTimeSeen;
      _accountCreationTime = _$v.accountCreationTime;
      _name = _$v.name;
      _status = _$v.status;
      _photoUrl = _$v.photoUrl;
      _info = _$v.info;
      _playlist = _$v.playlist;
      _karmaPoints = _$v.karmaPoints;
      _experiencePoints = _$v.experiencePoints;
      _followers = _$v.followers?.toBuilder();
      _following = _$v.following?.toBuilder();
      _uploads = _$v.uploads?.toBuilder();
      _featured = _$v.featured?.toBuilder();
      _badges = _$v.badges?.toBuilder();
      _scheduled = _$v.scheduled?.toBuilder();
      _isLive = _$v.isLive;
      _isOnline = _$v.isOnline;
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
              id: id,
              email: email,
              address: address,
              account: account,
              chatId: chatId,
              videoId: videoId,
              lastTimeSeen: lastTimeSeen,
              accountCreationTime: accountCreationTime,
              name: name,
              status: status,
              photoUrl: photoUrl,
              info: info,
              playlist: playlist,
              karmaPoints: karmaPoints,
              experiencePoints: experiencePoints,
              followers: followers.build(),
              following: following.build(),
              uploads: uploads.build(),
              featured: featured.build(),
              badges: badges.build(),
              scheduled: scheduled.build(),
              isLive: isLive,
              isOnline: isOnline);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'followers';
        followers.build();
        _$failedField = 'following';
        following.build();
        _$failedField = 'uploads';
        uploads.build();
        _$failedField = 'featured';
        featured.build();
        _$failedField = 'badges';
        badges.build();
        _$failedField = 'scheduled';
        scheduled.build();
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
