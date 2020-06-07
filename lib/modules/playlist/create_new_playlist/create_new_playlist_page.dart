import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/playlist/create_new_playlist/create_new_playlist_controller.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';
import 'package:highvibe/widgets/responsive_safe_area.dart';

class CreateNewPlaylistPage extends StatefulWidget {
  CreateNewPlaylistPage({Key key}) : super(key: key);

  @override
  _CreateNewPlaylistPage createState() => _CreateNewPlaylistPage();
}

class _CreateNewPlaylistPage
    extends ModularState<CreateNewPlaylistPage, CreateNewPlaylistController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Create New Playlist',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ResponsiveSafeArea(
        builder: (context, size) {
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: 8,
                    child: GradientRaisedButton(
                      label: 'Save',
                      onPressed: () => print('Save'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
