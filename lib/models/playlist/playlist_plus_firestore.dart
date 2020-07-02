import 'dart:convert';

import 'package:highvibe/models/playlist/playlist.dart';

extension PlaylistPlusFirestore on PlayList {
  Map<String, Object> toMap() {
    return json.decode(toJson());
  }

  static PlayList fromMap(Map<String, Object> data, String documentId) {
    return PlayList.fromJson(json.encode(data));
  }
}
