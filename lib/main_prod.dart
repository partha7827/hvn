import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/app_module.dart';
import 'package:highvibe/app/config/flavor_config.dart';

void main() {
  FlavorConfig(
      flavor: Flavor.PROD, values: FlavorValues(baseUrl: "prod api url"));

  runApp(ModularApp(module: AppModule()));
}
