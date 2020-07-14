import 'dart:io';

import 'package:flutter/foundation.dart' show required;
import 'package:path/path.dart' as p;

final _supportedAudioTypes = ['.mp3', '.wav', '.aac', '.ogg', '.m4a', '.aiff'];
bool isAudioFile({@required File file}) {
  final fileExtension = p.extension(file.path);
  print('fileExtension => $fileExtension');
  if (_supportedAudioTypes.contains(fileExtension)) {
    return true;
  } else {
    return false;
  }
}
