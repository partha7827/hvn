import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/modules/profile/widgets/profile_input_field.dart';
import 'package:highvibe/values/themes.dart';
import 'edit_audio_controller.dart';

class EditAudioPage extends StatefulWidget {
  const EditAudioPage();

  @override
  _EditAudioPageState createState() => _EditAudioPageState();
}

class _EditAudioPageState
    extends ModularState<EditAudioPage, EditAudioController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Modular.to.pop(),
        ),
        title: const Text(
          'Edit Audio',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.check, color: Colors.white),
            onPressed: () async {
              await controller.updateAudio();
              Modular.to.pop();
            },
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
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Observer(
                            builder: (BuildContext context) => Image.network(
                              controller.coverUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final file = await FilePicker.getFile(
                            type: FileType.image,
                          );

                          if (file != null) {
                            await controller.updateCover(file);
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
                  controller: controller.titleController,
                  title: 'Title',
                  maxLines: 1,
                  validator: (String value) =>
                      value.isEmpty ? 'Title is Empty' : null,
                ),
                ProfileInputField(
                  controller: controller.subtitleController,
                  title: 'Subtitle',
                  maxLines: 1,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
