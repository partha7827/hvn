import 'package:flutter/material.dart';
import 'package:highvibe/widgets/tags/tags_data_list.dart';

class InheritedTagsDataList extends InheritedWidget {
  final List<TagsDataList> list;
  final bool symmetry;
  final int itemCount;

  const InheritedTagsDataList({
    this.list,
    this.symmetry,
    this.itemCount,
    Widget child,
    Key key,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedTagsDataList old) => false;

  static InheritedTagsDataList of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();
}
