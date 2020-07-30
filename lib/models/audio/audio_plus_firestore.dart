import 'dart:convert';

import 'package:highvibe/models/audio/audio.dart';

extension AudioPlusFirestore on Audio {
  Map<String, Object> toMap() {
    return json.decode(toJson());
  }

  static Audio fromMap(Map<String, Object> data, String documentId) {
    return Audio.fromJson(json.encode(data));
  }
}
