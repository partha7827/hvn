import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart' show User;
import 'package:highvibe/services/store_service.dart';
import 'package:highvibe/store/current_user_store.dart';
import 'package:highvibe/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'current_user_controller.g.dart';

class CurrentUserController = _CurrentUserControllerBase
    with _$CurrentUserController;

abstract class _CurrentUserControllerBase with Store {
  final store = Modular.get<StoreService>();
  final currentUserStore = Modular.get<CurrentUserStore>();

  final nameController = TextEditingController();
  final statusController = TextEditingController();

  User get currentUser => currentUserStore.currentUser;

  @action
  Future<void> init() async {
    when((_) => currentUserStore.authState == AuthState.unauthenticated, () {
      Modular.to.pushReplacementNamed("/login");
    });
  }

  @action
  Future<void> updateUserInfo() async {
    final name = nameController.text;
    final status = statusController.text;
    if (name == currentUser.name && status == currentUser.status) {
      return;
    }
    currentUser.rebuild((b) => b
      ..name = name
      ..status = status);
    await store.updateUserInfo(currentUser);
  }

  @action
  Future<void> changeProfilePic() async {
    final img = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      try {
        String url = await uploadFile(img, "avatar");
        currentUser.rebuild((b) => b..photoUrl = url);

        await store.updateUserInfo(currentUser);
      } catch (e) {}
    }
  }

  @action
  Future<void> uploadAudio() async {
    final audio = await FilePicker.getFile(type: FileType.audio);

    final audioUrl = await storage.uploadUserAudio(audio, currentUser.id);

    await store.addUserAudio(
      currentUser.id,
      AudioModel.fromUser(
        currentUser,
        fileUrl: audioUrl,
      ),
    );
  }

  @action
  Future<void> logout() async {
    await currentUserStore.logout();
  }
}
