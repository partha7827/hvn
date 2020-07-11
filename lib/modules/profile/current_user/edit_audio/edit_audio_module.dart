import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/audio/audio.dart';
import 'edit_audio_controller.dart';
import 'edit_audio_page.dart';

class EditAudioModule extends WidgetModule {
  final Audio audio;
  EditAudioModule(this.audio);

  @override
  List<Bind<Object>> get binds => [
        Bind((i) => EditAudioController(audio)),
      ];

  @override
  Widget get view => const EditAudioPage();
}