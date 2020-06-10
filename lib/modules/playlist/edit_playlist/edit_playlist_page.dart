import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/models/playlist/playlist.dart';
import 'package:highvibe/modules/playlist/edit_playlist/edit_playlist_page_controller.dart';
import 'package:highvibe/modules/playlist/resources/resources.dart';
import 'package:highvibe/modules/playlist/widgets/widgets.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'package:highvibe/widgets/responsive_safe_area.dart';

class EditPlaylistPage extends StatefulWidget {
  final PlayList playlist;

  EditPlaylistPage({
    @required this.playlist,
    Key key,
  }) : super(key: key);

  @override
  _EditPlayListPageState createState() => _EditPlayListPageState();
}

class _EditPlayListPageState
    extends ModularState<EditPlaylistPage, EditPlaylistController>
    with SingleTickerProviderStateMixin {
  TextEditingController _titleTextEditingController;
  TextEditingController _descriptionTextEditingController;

  TabController _tabController;
  bool get _isPrivate => widget.playlist.privacy == Privacy.private;

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
          return TabBarView(
            controller: _tabController,
            children: [
              _editPlaylist(),
              _audioFiles(),
            ],
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
    _titleTextEditingController = TextEditingController(
      text: widget.playlist.title,
    );
    _descriptionTextEditingController = TextEditingController(
      text: widget.playlist.desscription,
    );
    _tabController = TabController(vsync: this, length: 2);
  }

  Widget _audioFiles() {
    if (widget.playlist.audioFiles.isNotEmpty) {
      return ListView.builder(
        itemCount: widget.playlist.audioFiles.length,
        itemBuilder: (context, index) {
          return PlaylistAudioItemTile(
            audioFile: widget.playlist.audioFiles.toList()[index],
          );
        },
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

  void _deleteCover() {
    print('_deleteCover');
    setState(() => widget.playlist.rebuild((b) => b..coverUrlPath = ''));
    widget.playlist.rebuild((b) => b..coverUrlPath = 'dddd');
    print('${widget.playlist.coverUrlPath}');
  }

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
            child: widget.playlist.coverUrlPath.isEmpty
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
                        child: CachedNetworkImage(
                          imageUrl: widget.playlist.coverUrlPath,
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
            controller: _titleTextEditingController,
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
            onSubmitted: (title) {
              widget.playlist.rebuild((b) => b..title = title);
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
            controller: _descriptionTextEditingController,
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
            onSubmitted: (description) {
              widget.playlist.rebuild((b) => b..desscription = description);
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
          GradientRaisedButton(
            label: PlaylistStrings.save,
            onPressed: () => _showSuccessDialog(),
          ),
        ],
      ),
    );
  }

  Future<void> _selectCover() async {
    try {
      final file = await FilePicker.getFile(type: FileType.image);
      if (file != null) {
        setState(() {
          widget.playlist.rebuild((b) => b..coverUrlPath = file.path);
        });
      }
    } catch (error) {
      print(error);
    }
  }

  void _showSuccessDialog() {
    widget.playlist.rebuild(
      (b) => b
        ..coverUrlPath =
            'https://takelessons.com/blog/wp-content/uploads/2020/03/flute-for-beginners.jpg',
    );

    showDialog(
      context: context,
      builder: (_) => const PlaylistModalAlert(
        title: PlaylistStrings.newPlaylistSuccessTitle,
        subTitle: PlaylistStrings.newPlaylistSuccessSubTitle,
      ),
    );
  }

  void _togglePrivacy() {
    if (widget.playlist.privacy == Privacy.public) {
      setState(() {
        widget.playlist.rebuild((b) => b..privacy = Privacy.private);
      });
    } else {
      setState(() {
        widget.playlist.rebuild((b) => b..privacy = Privacy.public);
      });
    }
  }
}
