// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$User on _UserStoreBase, Store {
  final _$valueAtom = Atom(name: '_UserStoreBase.value');

  @override
  int get value {
    _$valueAtom.context.enforceReadPolicy(_$valueAtom);
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.context.conditionallyRunInAction(() {
      super.value = value;
      _$valueAtom.reportChanged();
    }, _$valueAtom, name: '${_$valueAtom.name}_set');
  }

  final _$nameAtom = Atom(name: '_UserStoreBase.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$statusAtom = Atom(name: '_UserStoreBase.status');

  @override
  String get status {
    _$statusAtom.context.enforceReadPolicy(_$statusAtom);
    _$statusAtom.reportObserved();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.context.conditionallyRunInAction(() {
      super.status = value;
      _$statusAtom.reportChanged();
    }, _$statusAtom, name: '${_$statusAtom.name}_set');
  }

  final _$photoUrlAtom = Atom(name: '_UserStoreBase.photoUrl');

  @override
  String get photoUrl {
    _$photoUrlAtom.context.enforceReadPolicy(_$photoUrlAtom);
    _$photoUrlAtom.reportObserved();
    return super.photoUrl;
  }

  @override
  set photoUrl(String value) {
    _$photoUrlAtom.context.conditionallyRunInAction(() {
      super.photoUrl = value;
      _$photoUrlAtom.reportChanged();
    }, _$photoUrlAtom, name: '${_$photoUrlAtom.name}_set');
  }

  final _$followingAtom = Atom(name: '_UserStoreBase.following');

  @override
  ObservableList<String> get following {
    _$followingAtom.context.enforceReadPolicy(_$followingAtom);
    _$followingAtom.reportObserved();
    return super.following;
  }

  @override
  set following(ObservableList<String> value) {
    _$followingAtom.context.conditionallyRunInAction(() {
      super.following = value;
      _$followingAtom.reportChanged();
    }, _$followingAtom, name: '${_$followingAtom.name}_set');
  }

  final _$tribesAtom = Atom(name: '_UserStoreBase.tribes');

  @override
  ObservableList<String> get tribes {
    _$tribesAtom.context.enforceReadPolicy(_$tribesAtom);
    _$tribesAtom.reportObserved();
    return super.tribes;
  }

  @override
  set tribes(ObservableList<String> value) {
    _$tribesAtom.context.conditionallyRunInAction(() {
      super.tribes = value;
      _$tribesAtom.reportChanged();
    }, _$tribesAtom, name: '${_$tribesAtom.name}_set');
  }

  final _$meditationsAtom = Atom(name: '_UserStoreBase.meditations');

  @override
  ObservableList<String> get meditations {
    _$meditationsAtom.context.enforceReadPolicy(_$meditationsAtom);
    _$meditationsAtom.reportObserved();
    return super.meditations;
  }

  @override
  set meditations(ObservableList<String> value) {
    _$meditationsAtom.context.conditionallyRunInAction(() {
      super.meditations = value;
      _$meditationsAtom.reportChanged();
    }, _$meditationsAtom, name: '${_$meditationsAtom.name}_set');
  }

  final _$karmaPointsAtom = Atom(name: '_UserStoreBase.karmaPoints');

  @override
  int get karmaPoints {
    _$karmaPointsAtom.context.enforceReadPolicy(_$karmaPointsAtom);
    _$karmaPointsAtom.reportObserved();
    return super.karmaPoints;
  }

  @override
  set karmaPoints(int value) {
    _$karmaPointsAtom.context.conditionallyRunInAction(() {
      super.karmaPoints = value;
      _$karmaPointsAtom.reportChanged();
    }, _$karmaPointsAtom, name: '${_$karmaPointsAtom.name}_set');
  }

  final _$experiencePointsAtom = Atom(name: '_UserStoreBase.experiencePoints');

  @override
  int get experiencePoints {
    _$experiencePointsAtom.context.enforceReadPolicy(_$experiencePointsAtom);
    _$experiencePointsAtom.reportObserved();
    return super.experiencePoints;
  }

  @override
  set experiencePoints(int value) {
    _$experiencePointsAtom.context.conditionallyRunInAction(() {
      super.experiencePoints = value;
      _$experiencePointsAtom.reportChanged();
    }, _$experiencePointsAtom, name: '${_$experiencePointsAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'value: ${value.toString()},name: ${name.toString()},status: ${status.toString()},photoUrl: ${photoUrl.toString()},following: ${following.toString()},tribes: ${tribes.toString()},meditations: ${meditations.toString()},karmaPoints: ${karmaPoints.toString()},experiencePoints: ${experiencePoints.toString()}';
    return '{$string}';
  }
}
