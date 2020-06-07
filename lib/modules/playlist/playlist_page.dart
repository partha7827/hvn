import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/playlist/playlist_controller.dart';
import 'package:highvibe/widgets/responsive_safe_area.dart';

class PlaylistPage extends StatefulWidget {
  @override
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState
    extends ModularState<PlaylistPage, PlaylistController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveSafeArea(builder: (context, size) {
        return Container(
          color: Colors.red,
        );
      }),
    );
  }
}
