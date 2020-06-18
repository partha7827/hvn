import 'package:built_collection/built_collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart'
    show Audio, PlayList, Privacy, tempInMemoryPlaylistCollection;
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/playlist/create_new_playlist/create_new_playlist_controller.dart';
import 'package:highvibe/modules/playlist/resources/resources.dart';
import 'package:highvibe/modules/playlist/widgets/widgets.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'package:highvibe/widgets/responsive_safe_area.dart';

class CreateNewPlaylistPage extends StatefulWidget {
  final bool isPresentedAsOverlay;

  CreateNewPlaylistPage({
    @required this.isPresentedAsOverlay,
    Key key,
  }) : super(key: key);

  @override
  _CreateNewPlaylistPage createState() => _CreateNewPlaylistPage();
}

class _CreateNewPlaylistPage
    extends ModularState<CreateNewPlaylistPage, CreateNewPlaylistController> {
  String _imagePath;
  Privacy _privacy;
  bool _isPrivate;
  TextEditingController _titleTextEditingController;
  TextEditingController _descriptionTextEditingController;

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
          onPressed: () => _close(),
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
                              child: Image.asset(_imagePath, fit: BoxFit.cover),
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
                  controller: _titleTextEditingController,
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
                  controller: _descriptionTextEditingController,
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
                GradientRaisedButton(
                  label: PlaylistStrings.save,
                  onPressed: _savePlaylistAndShowSuccessDialog,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _titleTextEditingController.dispose();
    _descriptionTextEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _configure();
  }

  void _close() {
    if (widget.isPresentedAsOverlay) {
      MediaOverlays.disposeCreateNewPlaylistOverlayEntry();
    } else {
      Modular.to.maybePop();
    }
  }

  void _configure() {
    _imagePath = '';
    _privacy = Privacy.private;
    _isPrivate = true;
    _titleTextEditingController = TextEditingController(text: '');
    _descriptionTextEditingController = TextEditingController(text: '');
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

  void _savePlaylist() {
    final playlist = PlayList(
      (b) => b
        ..coverUrlPath =
            'https://takelessons.com/blog/wp-content/uploads/2020/03/flute-for-beginners.jpg'
        ..desscription = _descriptionTextEditingController.text
        ..title = _titleTextEditingController.text
        ..privacy = _privacy
        ..audioFiles = BuiltList<Audio>().toBuilder(),
    );

    tempInMemoryPlaylistCollection.add(playlist);
  }

  void _savePlaylistAndShowSuccessDialog() {
    _savePlaylist();

    final modalAlert = PlaylistModalAlert(
      title: PlaylistStrings.newPlaylistSuccessTitle,
      subTitle: PlaylistStrings.newPlaylistSuccessSubTitle,
      isPresentedAsOverlay: widget.isPresentedAsOverlay,
    );

    if (widget.isPresentedAsOverlay) {
      MediaOverlays.presentShowDialogAsOverlay(
        context: context,
        modalAlert: modalAlert,
      );
    } else {
      showDialog(context: context, builder: (_) => modalAlert);
    }
  }

  void _togglePrivacy() {
    if (_isPrivate) {
      setState(() {
        _privacy = Privacy.public;
        _isPrivate = false;
      });
    } else {
      setState(() {
        _privacy = Privacy.private;
        _isPrivate = true;
      });
    }
  }
}
