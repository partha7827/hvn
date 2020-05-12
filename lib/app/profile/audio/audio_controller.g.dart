// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AudioController on _AudioControllerBase, Store {
  final _$readyFilesAtom = Atom(name: '_AudioControllerBase.readyFiles');

  @override
  bool get readyFiles {
    _$readyFilesAtom.context.enforceReadPolicy(_$readyFilesAtom);
    _$readyFilesAtom.reportObserved();
    return super.readyFiles;
  }

  @override
  set readyFiles(bool value) {
    _$readyFilesAtom.context.conditionallyRunInAction(() {
      super.readyFiles = value;
      _$readyFilesAtom.reportChanged();
    }, _$readyFilesAtom, name: '${_$readyFilesAtom.name}_set');
  }

  final _$audioFilesAtom = Atom(name: '_AudioControllerBase.audioFiles');

  @override
  List<AudioFile> get audioFiles {
    _$audioFilesAtom.context.enforceReadPolicy(_$audioFilesAtom);
    _$audioFilesAtom.reportObserved();
    return super.audioFiles;
  }

  @override
  set audioFiles(List<AudioFile> value) {
    _$audioFilesAtom.context.conditionallyRunInAction(() {
      super.audioFiles = value;
      _$audioFilesAtom.reportChanged();
    }, _$audioFilesAtom, name: '${_$audioFilesAtom.name}_set');
  }

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  @override
  String toString() {
    final string =
        'readyFiles: ${readyFiles.toString()},audioFiles: ${audioFiles.toString()}';
    return '{$string}';
  }
}
