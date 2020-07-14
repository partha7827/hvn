import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/modules/profile/widgets/profile_input_field.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/splash_widget.dart';
import 'edit_profile_controller.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage();

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState
    extends ModularState<EditProfilePage, EditProfileController> {
  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Modular.to.pop()),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          Observer(
            builder: (_) => controller.inProgress
                ? SizedBox.fromSize(
                    size: const Size(15, 15), child: const SplashWidget())
                : IconButton(
                    icon: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      try {
                        await controller.updateUserInfo();
                        Modular.to.pop();
                      } catch (e) {
                        showSnackBarMsg(
                            controller.scaffoldKey.currentState, e.toString());
                      }
                    },
                  ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: controller.formKey,
            child: ListView(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 42),
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Observer(
                            builder: (_) => Image.network(
                              controller.photoUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          try {
                            final file = await FilePicker.getFile(
                              type: FileType.image,
                            );
                            if (file != null) {
                              await controller.updateUserAvatar(file);
                            }
                          } catch (e) {
                            showSnackBarMsg(controller.scaffoldKey.currentState,
                                e.toString());
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: primaryGradient,
                          ),
                          alignment: Alignment.center,
                          height: 36,
                          width: 36,
                          child: SvgPicture.asset('assets/ic_camera.svg'),
                        ),
                      ),
                    ],
                  ),
                ),
                ProfileInputField(
                  controller: controller.nameController,
                  title: 'Full Name',
                  maxLines: 1,
                  validator: (String value) {
                    if (value.isEmpty) return 'Full name cannot be empty';
                    return null;
                  },
                ),
                ProfileInputField(
                  title: 'About',
                  hintText: 'Tell about yourself',
                  controller: controller.bioController,
                  validator: (String value) {
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
