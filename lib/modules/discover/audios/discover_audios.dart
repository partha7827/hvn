import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/discover/audios/discover_audios_controller.dart';
import 'package:highvibe/modules/discover/audios/discover_audios_view.dart';

class DiscoverAudios extends WidgetModule {
  DiscoverAudios();
  
  @override
  final List<Bind<Object>> binds = [
    Bind((i) => DiscoverAudiosController()),
  ];

  @override
  Widget get view => const DiscoverAudiosView();
}
