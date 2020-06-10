import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/playlist/playlist.dart';
import 'package:highvibe/modules/playlist/create_new_playlist/create_new_playlist_page.dart';
import 'package:highvibe/modules/playlist/edit_playlist/edit_playlist_page_controller.dart';
import 'package:highvibe/modules/playlist/resources/resources.dart';
import 'package:highvibe/modules/playlist/widgets/widgets.dart';
import 'package:highvibe/widgets/responsive_safe_area.dart';

class EditPlaylistPage extends StatefulWidget {
  final PlayList playlist;

  EditPlaylistPage({@required this.playlist, Key key}) : super(key: key);

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
          return TabBarView(
            controller: _tabController,
            children: [
              CreateNewPlaylistPage(editMode: true),
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
}
