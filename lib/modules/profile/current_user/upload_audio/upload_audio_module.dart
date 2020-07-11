import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'upload_audio_controller.dart';
import 'upload_audio_page.dart';

class UploadAudioModule extends WidgetModule {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => UploadAudioController()),
      ];

  @override
  Widget get view => const UploadAudioPage();
}