import 'dart:io';

import 'package:flutter/material.dart';
import 'package:highvibe/services/storage_service.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart' show User;
import 'package:highvibe/models/serializer/serializer.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/services/firestore_service.dart';

part 'edit_profile_controller.g.dart';

class EditProfileController = _EditProfileControllerBase
    with _$EditProfileController;

abstract class _EditProfileControllerBase with Store {
  final FirestoreService firestore = Modular.get<FirestoreService>();
  final StorageService storage = Modular.get<StorageService>();
  final AppController app = Modular.get<AppController>();

  User get currentUser => app.currentUser;
  set currentUser(User user) => app.currentUser = user;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey formKey = GlobalKey<FormState>();

  @observable
  bool inProgress = false;

  @observable
  String photoUrl;

  @action
  void init() {
    nameController.text = currentUser.name;
    bioController.text = currentUser.bio;
    photoUrl = currentUser.photoUrl;
  }

  @action
  Future<User> updateUserInfo() async {
    inProgress = true;

    final name = nameController.text;
    final bio = bioController.text;

    if (name == currentUser.name && bio == currentUser.bio) return null;

    currentUser = currentUser.rebuild((b) => b
      ..name = name
      ..bio = bio);

    try {
      await firestore.userCollection
          .document(currentUser.id)
          .updateData(serializers.serialize(currentUser));

      return currentUser;
    } catch (e) {
      rethrow;
    } finally {
      inProgress = false;
    }
  }

  @action
  Future<User> updateUserAvatar(File file) async {
    inProgress = true;

    try {
      photoUrl = await storage.uploadAvatar(file, currentUser.id);

      currentUser = currentUser.rebuild((b) => b..photoUrl = photoUrl);

      await firestore.userCollection
          .document(currentUser.id)
          .updateData(serializers.serialize(currentUser));

      return currentUser;
    } catch (e) {
      rethrow;
    } finally {
      inProgress = false;
    }
  }
}