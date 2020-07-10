import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'edit_audio_controller.dart';
import 'edit_audio_page.dart';

class EditAudioModule extends WidgetModule {
  final String audioId;
  EditAudioModule(this.audioId);

  @override
  List<Bind<Object>> get binds => [
        Bind((i) => EditAudioController(audioId)),
      ];

  @override
  Widget get view => const EditAudioPage();
}