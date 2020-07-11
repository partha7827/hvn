import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/playlist/edit_playlist/edit_playlist_page_controller.dart';
import 'package:highvibe/modules/playlist/resources/resources.dart';
import 'package:highvibe/modules/playlist/widgets/widgets.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'package:highvibe/widgets/responsive_safe_area.dart';

class EditPlaylistPage extends StatefulWidget {
  EditPlaylistPage({Key key}) : super(key: key);

  @override
  _EditPlayListPageState createState() => _EditPlayListPageState();
}

class _EditPlayListPageState
    extends ModularState<EditPlaylistPage, EditPlaylistController>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color(0xFF212140),
        title: const Text(
          PlaylistStrings.editPlaylist,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Modular.to.pop()),
        bottom: TabBar(
          controller: _tabController,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(width: 2, color: Color(0xFF66CCCC)),
            insets: EdgeInsets.symmetric(horizontal: 30),
          ),
          tabs: <Tab>[
            const Tab(text: PlaylistStrings.information),
            const Tab(text: PlaylistStrings.tracks),
          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
      ),
      body: ResponsiveSafeArea(
        builder: (context, size) {
          return Observer(
            builder: (_) => TabBarView(
              controller: _tabController,
              children: [
                _editPlaylist(),
                _audioFilesListView(),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    controller.init();
  }

  Widget _audioFilesListView() {
    if (controller.audioItems.isNotEmpty) {
      return Observer(
        builder: (_) => ReorderableListView(
          children: [
            for (final item in controller.audioItems)
              PlaylistAudioItemTile(
                key: ValueKey(item),
                audioFile: item,
                onDelete: (item) => controller.removeAudioItem(item),
              ),
          ],
          onReorder: controller.handleListReorder,
        ),
      );
    } else {
      return Center(
        child: Container(
          child: const Text(
            PlaylistStrings.noAudio,
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      );
    }
  }

<<<<<<< HEAD
  void _handleListReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    setState(() {
      final oldItem = _audioItems.removeAt(oldIndex);
      _audioItems.insert(newIndex, oldItem);
    });
  }

  void _configure() {
    _audioItems = widget.playlist.audioFiles.toList();
    _imagePath = widget.playlist.coverUrlPath;
    _privacy = widget.playlist.privacy;
    _isPrivate = widget.playlist.privacy == Privacy.private;
    _titleTextEditingController = TextEditingController(
      text: widget.playlist.title,
    );
    _descriptionTextEditingController = TextEditingController(
      text: widget.playlist.description,
    );
    _tabController = TabController(vsync: this, length: 2);
  }

=======
>>>>>>> master
  Widget _editPlaylist() {
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
            child: controller.playlistCoverPath.isEmpty
                ? GestureDetector(
                    onTap: () async => controller.selectPlaylistCover(),
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
                        child: _imageWidget(),
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: GestureDetector(
                          onTap: () => controller.deletePlaylistCover(),
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
            controller: controller.titleTextEditingController,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF525366), width: 1),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF525366), width: 1),
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
            controller: controller.descriptionTextEditingController,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF525366), width: 1),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF525366), width: 1),
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
                icon: !controller.isPrivate
                    ? PlaylistImageAssets.radioButtonActive
                    : PlaylistImageAssets.radioButtonNotActive,
                onPressed: () => controller.togglePrivacy(),
              ),
              const Text(
                PlaylistStrings.public,
                style: TextStyle(color: Color(0xFF8E8F99)),
              ),
              const SizedBox(width: 20),
              IconButton(
                icon: controller.isPrivate
                    ? PlaylistImageAssets.radioButtonActive
                    : PlaylistImageAssets.radioButtonNotActive,
                onPressed: () => controller.togglePrivacy(),
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
            onPressed: () => _updatePlaylistAndShowSuccessDialog(
              context: context,
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageWidget() {
    if (Uri.parse(controller.playlistCoverPath).isAbsolute) {
      return CachedNetworkImage(
        imageUrl: controller.playlistCoverPath,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        controller.playlistCoverPath,
        fit: BoxFit.cover,
      );
    }
  }

<<<<<<< HEAD
  void _showSuccessDialog() {
    final updatePlaylist = PlayList(
      (b) => b
        ..coverUrlPath = _imagePath
        ..description = _descriptionTextEditingController.text
        ..title = _titleTextEditingController.text
        ..privacy = _privacy
        ..audioFiles = BuiltList<Audio>.from(_audioItems).toBuilder(),
    );

    tempInMemoryPlaylistCollection.remove(widget.playlist);
    tempInMemoryPlaylistCollection.add(updatePlaylist);

    showDialog(
=======
  Future<void> _updatePlaylistAndShowSuccessDialog({
    @required BuildContext context,
  }) async {
    await progressDialog(context: context).show();
    await controller.savePlaylist();
    await progressDialog(context: context).hide();
    showSuccessDialog(
>>>>>>> master
      context: context,
      isPresentedAsOverlay: false,
      title: PlaylistStrings.newPlaylistSuccessTitle,
      subTitle: PlaylistStrings.audioAddedSuccessSubTitle,
    );
  }
}
