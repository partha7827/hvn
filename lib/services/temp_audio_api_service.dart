import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:highvibe/app/audio_player/models/models.dart';
import 'package:http/http.dart' as http;

class TempAudioApiService {
  final _baseUrl = 'https://api-flutter-audio-player.herokuapp.com';
  final http.Client client;

  TempAudioApiService({
    HttpClient client,
  }) : client = client ?? http.Client();

  Future<BuiltList<AudioFile>> getAllAudioFiles() async {
    final response = await client.get('$_baseUrl/tunes');
    print('Api Service: fetch AudioFile: ${response.statusCode}');
    if (response.statusCode == 200) {
      return compute(AudioFile.parseListOfAudioFiles, response.body);
    } else {
      throw NetworkError(response.statusCode.toString());
    }
  }

  // id: 610dff69-bd9e-4b65-b290-32d6dd05cf61
  Future<AudioFile> getAudioFilebyId({@required String id}) async {
    final response = await client.get('$_baseUrl/tunes/$id');
    print('Api Service: fetch AudioFile: ${response.statusCode}');
    if (response.statusCode == 200) {
      return AudioFile.fromJson(response.body);
    } else {
      throw NetworkError(response.statusCode.toString());
    }
  }
}

class NetworkError implements Exception {
  final String message;
  NetworkError(this.message);
}
