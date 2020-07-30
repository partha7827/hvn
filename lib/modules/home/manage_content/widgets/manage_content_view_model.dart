import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:highvibe/modules/home/resources/resources.dart';

part 'manage_content_view_model.g.dart';

class ManageContentViewModel extends EnumClass {
  static const ManageContentViewModel displayContetItems = _$displayContetItems;
  static const ManageContentViewModel uploadAudioItem = _$uploadAudioItem;
  static const ManageContentViewModel editAudioItem = _$editAudioItem;

  static BuiltSet<ManageContentViewModel> get values =>
      _$manageContentViewModelValues;

  const ManageContentViewModel._(String name) : super(name);

  String render() {
    switch (this) {
      case displayContetItems:
        return ManageContentStrings.myContent;
      case uploadAudioItem:
        return UploadContentStrings.uploadContent;
      case editAudioItem:
        return EditContentStrings.editTittle;
      default:
        return 'Unknow State';
    }
  }

  static ManageContentViewModel valueOf(String name) =>
      _$manageContentViewModelValueOf(name);
}
