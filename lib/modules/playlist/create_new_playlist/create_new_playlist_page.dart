import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/playlist/create_new_playlist/create_new_playlist_controller.dart';
import 'package:highvibe/modules/playlist/resources/resources.dart';
import 'package:highvibe/modules/playlist/widgets/widgets.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'package:highvibe/widgets/responsive_safe_area.dart';

class CreateNewPlaylistPage extends StatefulWidget {
  CreateNewPlaylistPage({Key key}) : super(key: key);

  @override
  _CreateNewPlaylistPage createState() => _CreateNewPlaylistPage();
}

class _CreateNewPlaylistPage
    extends ModularState<CreateNewPlaylistPage, CreateNewPlaylistController> {
  bool _isPrivate = false;
  String _imagePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          PlaylistStrings.createNew,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Modular.to.pop(),
        ),
      ),
      body: ResponsiveSafeArea(
        builder: (context, size) {
          return Container(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
            child: ListView(
              children: [
                Container(
                  height: 190,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF525366),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: _imagePath.isEmpty
                      ? GestureDetector(
                          onTap: () async => _selectCover(),
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Positioned(
                                top: 60,
                                child: PlaylistImageAssets.selectImage,
                              ),
                              const Positioned(
                                top: 120,
                                child: Text(
                                  PlaylistStrings.selectCover,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Stack(
                          fit: StackFit.expand,
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                _imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 12,
                              right: 12,
                              child: GestureDetector(
                                onTap: () => _deleteCover(),
                                child: PlaylistImageAssets.deletePlaylistCover,
                              ),
                            ),
                          ],
                        ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    PlaylistStrings.playlistName,
                    style: TextStyle(color: Color(0xFF525366)),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF525366), width: 1),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF525366), width: 1),
                    ),
                    hintText: PlaylistStrings.enterPlaylistName,
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  style: const TextStyle(color: Colors.white),
                  onSubmitted: (name) {
                    print(name);
                  },
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    PlaylistStrings.description,
                    style: TextStyle(color: Color(0xFF525366)),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF525366), width: 1),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF525366), width: 1),
                    ),
                    hintText: PlaylistStrings.enterDescription,
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  style: const TextStyle(color: Colors.white),
                  onSubmitted: (description) {
                    print(description);
                  },
                ),
                const SizedBox(height: 30),
                const HeaderRow(title: PlaylistStrings.privacy),
                Row(
                  children: [
                    IconButton(
                      icon: !_isPrivate
                          ? PlaylistImageAssets.radioButtonActive
                          : PlaylistImageAssets.radioButtonNotActive,
                      onPressed: () => _togglePrivacy(),
                    ),
                    const Text(
                      PlaylistStrings.public,
                      style: TextStyle(color: Color(0xFF8E8F99)),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: _isPrivate
                          ? PlaylistImageAssets.radioButtonActive
                          : PlaylistImageAssets.radioButtonNotActive,
                      onPressed: () => _togglePrivacy(),
                    ),
                    const Text(
                      PlaylistStrings.private,
                      style: TextStyle(color: Color(0xFF8E8F99)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const PlaylistAudioItemTile(),
                const PlaylistAudioItemTile(),
                const SizedBox(height: 20),
                GradientRaisedButton(
                  label: PlaylistStrings.save,
                  onPressed: () => _showSuccessDialog(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (_) => const PlaylistModalAlert(
        title: PlaylistStrings.newPlaylistSuccessTitle,
        subTitle: PlaylistStrings.newPlaylistSuccessSubTitle,
      ),
    );
  }

  void _deleteCover() {
    setState(() => _imagePath = '');
  }

  Future<void> _selectCover() async {
    try {
      final file = await FilePicker.getFile(type: FileType.image);
      if (file != null) {
        setState(() {
          _imagePath = file.path;
        });
      }
    } catch (error) {
      print(error);
    }
  }

  void _togglePrivacy() {
    if (_isPrivate) {
      setState(() => _isPrivate = false);
    } else {
      setState(() => _isPrivate = true);
    }
  }
}
