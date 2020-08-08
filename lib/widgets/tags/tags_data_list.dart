import 'package:flutter/material.dart';
import 'package:highvibe/widgets/tags/tag_item_interface.dart';

class TagsDataList extends ValueNotifier<Object> implements TagItemInterface {
  @override
  final String title;

  @override
  final Object customData;

  @override
  final int index;

  bool _showDuplicate;
  bool _active;

  TagsDataList({
    @required this.title,
    this.index,
    bool highlights = false,
    bool active = true,
    this.customData,
  })  : _showDuplicate = highlights,
        _active = active,
        super(active);

  @override
  bool get active => _active;

  set active(bool a) {
    _active = a;
    // rebuild only the specific Item that changes its value
    notifyListeners();
  }

  bool get showDuplicate {
    final val = _showDuplicate;
    _showDuplicate = false;
    return val;
  }

  set showDuplicate(bool a) {
    _showDuplicate = a;
    // rebuild only the specific Item that changes its value
    notifyListeners();
  }
}
