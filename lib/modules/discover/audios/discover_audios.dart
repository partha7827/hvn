import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/discover/audios/discover_audios_controller.dart';
import 'package:highvibe/modules/discover/audios/discover_audios_view.dart';

class DiscoverAudios extends WidgetModule {
  @override
  final List<Bind> binds = [
    Bind((i) => DiscoverAudiosController()),
  ];

  @override
  Widget get view => DiscoverAudiosView();
}