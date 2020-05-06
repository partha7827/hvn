import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/audio_player/models/models.dart';
import 'package:highvibe/services/user_service.dart';
import 'package:highvibe/store/current_user_store.dart';
import 'package:highvibe/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'current_user_controller.g.dart';

class CurrentUserController = _CurrentUserControllerBase
    with _$CurrentUserController;

abstract class _CurrentUserControllerBase with Store {
  final userService = Modular.get<UserService>();

  final nameController = TextEditingController();
  final statusController = TextEditingController();

  User get currentUser => Modular.get<CurrentUserStore>().currentUser;

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
    await userService.updateUserInfo(currentUser);
  }

  @action
  Future<void> changeProfilePic() async {
    final img = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      try {
        String url = await uploadFile(img, "avatar");
        currentUser.rebuild((b) => b..photoUrl = url);

        await userService.updateUserInfo(currentUser);
      } catch (e) {}
    }
  }
}
