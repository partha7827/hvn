import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/app_module.dart';
import 'package:highvibe/app/config/flavor_config.dart';

void main() {
  FlavorConfig(
      flavor: Flavor.DEV, values: FlavorValues(baseUrl: "dev api url"));

  runApp(ModularApp(module: AppModule()));
}
