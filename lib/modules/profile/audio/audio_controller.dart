import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/models/audio/audio.dart';
import 'package:highvibe/models/options_model/options_model.dart';
import 'package:highvibe/models/user/user.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:highvibe/values/constants.dart';
import 'package:mobx/mobx.dart';

part 'audio_controller.g.dart';

class AudioController = _AudioControllerBase with _$AudioController;

abstract class _AudioControllerBase with Store {
  final FirestoreService store = Modular.get<FirestoreService>();
  final AppController currentUserStore = Modular.get<AppController>();

  @observable
  ObservableFuture<List<Audio>> audios;

  final String userId;
  _AudioControllerBase(this.userId);
  User get currentUser => currentUserStore.currentUser;
  final List<OptionsModel> optionsModelList = List<OptionsModel>.from([]);

  @action
  void loadAudios() {
    audios = ObservableFuture(
      store.audioCollection
          .where('userId', isEqualTo: userId)
          .getDocuments()
          .then((s) => Audio.parseListOfAudios(s).toList()),
    );
  }

  @action
  void loadOptionsList() {
    if (currentUserStore.currentUser.id == userId) {
      // current user
      optionsModelList.add(
        OptionsModel(
          id: edit,
          text: 'Edit',
          widget: Image.asset(
            'assets/ic_highlight.png',
            width: 24,
            height: 24,
          ),
        ),
      );

      optionsModelList.add(
        OptionsModel(
          id: addToPlaylist,
          text: 'Add to playlist',
          widget: Image.asset(
            'assets/ic_add_to_playlist.png',
            width: 24,
            height: 24,
          ),
        ),
      );

      optionsModelList.add(
        OptionsModel(
          id: addWayPoints,
          text: 'Add WayPoints',
          widget: Image.asset(
            'assets/ic_waypoint.png',
            width: 24,
            height: 24,
          ),
        ),
      );

      optionsModelList.add(
        OptionsModel(
          id: addToFavorites,
          text: 'Add to Favorites',
          widget: SvgPicture.asset('assets/ic_favorite.svg'),
        ),
      );

      optionsModelList.add(
        OptionsModel(
          id: delete,
          text: 'Delete',
          widget: Image.asset(
            'assets/ic_delete.png',
            width: 24,
            height: 24,
          ),
        ),
      );

      optionsModelList.add(
        OptionsModel(
          id: share,
          text: 'Share',
          widget: SvgPicture.asset('assets/ic_share.svg'),
        ),
      );
    } else {
      // other user
      optionsModelList.add(
        OptionsModel(
          id: addToPlaylist,
          text: 'Add to playlist',
          widget: Image.asset(
            'assets/ic_add_to_playlist.png',
            width: 24,
            height: 24,
          ),
        ),
      );

      optionsModelList.add(
        OptionsModel(
          id: addToFavorites,
          text: 'Add to Favorites',
          widget: SvgPicture.asset('assets/ic_favorite.svg'),
        ),
      );

      optionsModelList.add(
        OptionsModel(
          id: share,
          text: 'Share',
          widget: SvgPicture.asset('assets/ic_share.svg'),
        ),
      );
    }
  }
}
