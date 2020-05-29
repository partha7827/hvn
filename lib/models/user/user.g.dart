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
      'account',
      serializers.serialize(object.account,
          specifiedType: const FullType(String)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
      'chatId',
      serializers.serialize(object.chatId,
          specifiedType: const FullType(String)),
      'liveId',
      serializers.serialize(object.liveId,
          specifiedType: const FullType(String)),
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'photoUrl',
      serializers.serialize(object.photoUrl,
          specifiedType: const FullType(String)),
      'bio',
      serializers.serialize(object.bio, specifiedType: const FullType(String)),
      'experiencePoints',
      serializers.serialize(object.experiencePoints,
          specifiedType: const FullType(int)),
      'karmaPoints',
      serializers.serialize(object.karmaPoints,
          specifiedType: const FullType(int)),
      'isLive',
      serializers.serialize(object.isLive, specifiedType: const FullType(bool)),
      'isOnline',
      serializers.serialize(object.isOnline,
          specifiedType: const FullType(bool)),
      'isRecommended',
      serializers.serialize(object.isRecommended,
          specifiedType: const FullType(bool)),
      'isAuthor',
      serializers.serialize(object.isAuthor,
          specifiedType: const FullType(bool)),
      'accountCreationTime',
      serializers.serialize(object.accountCreationTime,
          specifiedType: const FullType(DateTime)),
      'badges',
      serializers.serialize(object.badges,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
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
      'scheduled',
      serializers.serialize(object.scheduled,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'videos',
      serializers.serialize(object.videos,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'audios',
      serializers.serialize(object.audios,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'tags',
      serializers.serialize(object.tags,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

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
        case 'account':
          result.account = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'chatId':
          result.chatId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'liveId':
          result.liveId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photoUrl':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bio':
          result.bio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'experiencePoints':
          result.experiencePoints = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'karmaPoints':
          result.karmaPoints = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'isLive':
          result.isLive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isOnline':
          result.isOnline = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isRecommended':
          result.isRecommended = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isAuthor':
          result.isAuthor = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'accountCreationTime':
          result.accountCreationTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'badges':
          result.badges.replace(serializers.deserialize(value,
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
        case 'scheduled':
          result.scheduled.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'videos':
          result.videos.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'audios':
          result.audios.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
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
  final String account;
  @override
  final String address;
  @override
  final String chatId;
  @override
  final String liveId;
  @override
  final String status;
  @override
  final String email;
  @override
  final String name;
  @override
  final String photoUrl;
  @override
  final String bio;
  @override
  final int experiencePoints;
  @override
  final int karmaPoints;
  @override
  final bool isLive;
  @override
  final bool isOnline;
  @override
  final bool isRecommended;
  @override
  final bool isAuthor;
  @override
  final DateTime accountCreationTime;
  @override
  final BuiltList<String> badges;
  @override
  final BuiltList<String> featured;
  @override
  final BuiltList<String> followers;
  @override
  final BuiltList<String> following;
  @override
  final BuiltList<String> scheduled;
  @override
  final BuiltList<String> videos;
  @override
  final BuiltList<String> audios;
  @override
  final BuiltList<String> tags;

  factory _$User([void Function(UserBuilder) updates]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._(
      {this.id,
      this.account,
      this.address,
      this.chatId,
      this.liveId,
      this.status,
      this.email,
      this.name,
      this.photoUrl,
      this.bio,
      this.experiencePoints,
      this.karmaPoints,
      this.isLive,
      this.isOnline,
      this.isRecommended,
      this.isAuthor,
      this.accountCreationTime,
      this.badges,
      this.featured,
      this.followers,
      this.following,
      this.scheduled,
      this.videos,
      this.audios,
      this.tags})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('User', 'id');
    }
    if (account == null) {
      throw new BuiltValueNullFieldError('User', 'account');
    }
    if (address == null) {
      throw new BuiltValueNullFieldError('User', 'address');
    }
    if (chatId == null) {
      throw new BuiltValueNullFieldError('User', 'chatId');
    }
    if (liveId == null) {
      throw new BuiltValueNullFieldError('User', 'liveId');
    }
    if (status == null) {
      throw new BuiltValueNullFieldError('User', 'status');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('User', 'email');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('User', 'name');
    }
    if (photoUrl == null) {
      throw new BuiltValueNullFieldError('User', 'photoUrl');
    }
    if (bio == null) {
      throw new BuiltValueNullFieldError('User', 'bio');
    }
    if (experiencePoints == null) {
      throw new BuiltValueNullFieldError('User', 'experiencePoints');
    }
    if (karmaPoints == null) {
      throw new BuiltValueNullFieldError('User', 'karmaPoints');
    }
    if (isLive == null) {
      throw new BuiltValueNullFieldError('User', 'isLive');
    }
    if (isOnline == null) {
      throw new BuiltValueNullFieldError('User', 'isOnline');
    }
    if (isRecommended == null) {
      throw new BuiltValueNullFieldError('User', 'isRecommended');
    }
    if (isAuthor == null) {
      throw new BuiltValueNullFieldError('User', 'isAuthor');
    }
    if (accountCreationTime == null) {
      throw new BuiltValueNullFieldError('User', 'accountCreationTime');
    }
    if (badges == null) {
      throw new BuiltValueNullFieldError('User', 'badges');
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
    if (scheduled == null) {
      throw new BuiltValueNullFieldError('User', 'scheduled');
    }
    if (videos == null) {
      throw new BuiltValueNullFieldError('User', 'videos');
    }
    if (audios == null) {
      throw new BuiltValueNullFieldError('User', 'audios');
    }
    if (tags == null) {
      throw new BuiltValueNullFieldError('User', 'tags');
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
        account == other.account &&
        address == other.address &&
        chatId == other.chatId &&
        liveId == other.liveId &&
        status == other.status &&
        email == other.email &&
        name == other.name &&
        photoUrl == other.photoUrl &&
        bio == other.bio &&
        experiencePoints == other.experiencePoints &&
        karmaPoints == other.karmaPoints &&
        isLive == other.isLive &&
        isOnline == other.isOnline &&
        isRecommended == other.isRecommended &&
        isAuthor == other.isAuthor &&
        accountCreationTime == other.accountCreationTime &&
        badges == other.badges &&
        featured == other.featured &&
        followers == other.followers &&
        following == other.following &&
        scheduled == other.scheduled &&
        videos == other.videos &&
        audios == other.audios &&
        tags == other.tags;
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
                                                                            $jc($jc($jc($jc($jc($jc($jc(0, id.hashCode), account.hashCode), address.hashCode), chatId.hashCode), liveId.hashCode), status.hashCode),
                                                                                email.hashCode),
                                                                            name.hashCode),
                                                                        photoUrl.hashCode),
                                                                    bio.hashCode),
                                                                experiencePoints.hashCode),
                                                            karmaPoints.hashCode),
                                                        isLive.hashCode),
                                                    isOnline.hashCode),
                                                isRecommended.hashCode),
                                            isAuthor.hashCode),
                                        accountCreationTime.hashCode),
                                    badges.hashCode),
                                featured.hashCode),
                            followers.hashCode),
                        following.hashCode),
                    scheduled.hashCode),
                videos.hashCode),
            audios.hashCode),
        tags.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('id', id)
          ..add('account', account)
          ..add('address', address)
          ..add('chatId', chatId)
          ..add('liveId', liveId)
          ..add('status', status)
          ..add('email', email)
          ..add('name', name)
          ..add('photoUrl', photoUrl)
          ..add('bio', bio)
          ..add('experiencePoints', experiencePoints)
          ..add('karmaPoints', karmaPoints)
          ..add('isLive', isLive)
          ..add('isOnline', isOnline)
          ..add('isRecommended', isRecommended)
          ..add('isAuthor', isAuthor)
          ..add('accountCreationTime', accountCreationTime)
          ..add('badges', badges)
          ..add('featured', featured)
          ..add('followers', followers)
          ..add('following', following)
          ..add('scheduled', scheduled)
          ..add('videos', videos)
          ..add('audios', audios)
          ..add('tags', tags))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _account;
  String get account => _$this._account;
  set account(String account) => _$this._account = account;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _chatId;
  String get chatId => _$this._chatId;
  set chatId(String chatId) => _$this._chatId = chatId;

  String _liveId;
  String get liveId => _$this._liveId;
  set liveId(String liveId) => _$this._liveId = liveId;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  String _bio;
  String get bio => _$this._bio;
  set bio(String bio) => _$this._bio = bio;

  int _experiencePoints;
  int get experiencePoints => _$this._experiencePoints;
  set experiencePoints(int experiencePoints) =>
      _$this._experiencePoints = experiencePoints;

  int _karmaPoints;
  int get karmaPoints => _$this._karmaPoints;
  set karmaPoints(int karmaPoints) => _$this._karmaPoints = karmaPoints;

  bool _isLive;
  bool get isLive => _$this._isLive;
  set isLive(bool isLive) => _$this._isLive = isLive;

  bool _isOnline;
  bool get isOnline => _$this._isOnline;
  set isOnline(bool isOnline) => _$this._isOnline = isOnline;

  bool _isRecommended;
  bool get isRecommended => _$this._isRecommended;
  set isRecommended(bool isRecommended) =>
      _$this._isRecommended = isRecommended;

  bool _isAuthor;
  bool get isAuthor => _$this._isAuthor;
  set isAuthor(bool isAuthor) => _$this._isAuthor = isAuthor;

  DateTime _accountCreationTime;
  DateTime get accountCreationTime => _$this._accountCreationTime;
  set accountCreationTime(DateTime accountCreationTime) =>
      _$this._accountCreationTime = accountCreationTime;

  ListBuilder<String> _badges;
  ListBuilder<String> get badges =>
      _$this._badges ??= new ListBuilder<String>();
  set badges(ListBuilder<String> badges) => _$this._badges = badges;

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

  ListBuilder<String> _scheduled;
  ListBuilder<String> get scheduled =>
      _$this._scheduled ??= new ListBuilder<String>();
  set scheduled(ListBuilder<String> scheduled) => _$this._scheduled = scheduled;

  ListBuilder<String> _videos;
  ListBuilder<String> get videos =>
      _$this._videos ??= new ListBuilder<String>();
  set videos(ListBuilder<String> videos) => _$this._videos = videos;

  ListBuilder<String> _audios;
  ListBuilder<String> get audios =>
      _$this._audios ??= new ListBuilder<String>();
  set audios(ListBuilder<String> audios) => _$this._audios = audios;

  ListBuilder<String> _tags;
  ListBuilder<String> get tags => _$this._tags ??= new ListBuilder<String>();
  set tags(ListBuilder<String> tags) => _$this._tags = tags;

  UserBuilder() {
    User._initializeBuilder(this);
  }

  UserBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _account = _$v.account;
      _address = _$v.address;
      _chatId = _$v.chatId;
      _liveId = _$v.liveId;
      _status = _$v.status;
      _email = _$v.email;
      _name = _$v.name;
      _photoUrl = _$v.photoUrl;
      _bio = _$v.bio;
      _experiencePoints = _$v.experiencePoints;
      _karmaPoints = _$v.karmaPoints;
      _isLive = _$v.isLive;
      _isOnline = _$v.isOnline;
      _isRecommended = _$v.isRecommended;
      _isAuthor = _$v.isAuthor;
      _accountCreationTime = _$v.accountCreationTime;
      _badges = _$v.badges?.toBuilder();
      _featured = _$v.featured?.toBuilder();
      _followers = _$v.followers?.toBuilder();
      _following = _$v.following?.toBuilder();
      _scheduled = _$v.scheduled?.toBuilder();
      _videos = _$v.videos?.toBuilder();
      _audios = _$v.audios?.toBuilder();
      _tags = _$v.tags?.toBuilder();
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
              account: account,
              address: address,
              chatId: chatId,
              liveId: liveId,
              status: status,
              email: email,
              name: name,
              photoUrl: photoUrl,
              bio: bio,
              experiencePoints: experiencePoints,
              karmaPoints: karmaPoints,
              isLive: isLive,
              isOnline: isOnline,
              isRecommended: isRecommended,
              isAuthor: isAuthor,
              accountCreationTime: accountCreationTime,
              badges: badges.build(),
              featured: featured.build(),
              followers: followers.build(),
              following: following.build(),
              scheduled: scheduled.build(),
              videos: videos.build(),
              audios: audios.build(),
              tags: tags.build());
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
        _$failedField = 'videos';
        videos.build();
        _$failedField = 'audios';
        audios.build();
        _$failedField = 'tags';
        tags.build();
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
