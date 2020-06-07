import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/modules/playlist/playlist_controller.dart';
import 'package:highvibe/modules/playlist/widgets/widgets.dart'
    show PlaylistTile;
import 'package:highvibe/widgets/gradient_raised_button.dart';
import 'package:highvibe/widgets/header_row.dart';
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
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Add to Playlist',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Modular.to.pop()),
      ),
      body: ResponsiveSafeArea(
        builder: (context, size) {
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const HeaderRow(title: 'Playlist'),
                          SizedBox(
                            height: 20,
                            width: 120,
                            child: SvgPicture.asset('assets/new_playlist.svg'),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    child: SearchBar(
                      shrinkWrap: true,
                      icon: const Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Icon(
                          Icons.search,
                          color: Color(0xFF8E8F99),
                        ),
                      ),
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                        color: Color(0xFF8E8F99),
                        fontSize: 18,
                      ),
                      iconActiveColor: Colors.white,
                      textStyle: const TextStyle(color: Colors.white),
                      cancellationWidget: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                      //suggestions: ,
                      onItemFound: (item, index) {
                        return Container();
                      },
                      onSearch: _findPlaylists,
                    ),
                  ),
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

  Future<List<PlaylistTile>> _findPlaylists(String text) async {}
}
