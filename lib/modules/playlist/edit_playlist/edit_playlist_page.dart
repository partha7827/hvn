import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/playlist/edit_playlist/edit_playlist_page_controller.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';
import 'package:highvibe/widgets/responsive_safe_area.dart';

class EditPlayListPage extends StatefulWidget {
  EditPlayListPage({Key key}) : super(key: key);

  @override
  _EditPlayListPageState createState() => _EditPlayListPageState();
}

class _EditPlayListPageState
    extends ModularState<EditPlayListPage, EditPlaylistController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Edit Playlist',
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
