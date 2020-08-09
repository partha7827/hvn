import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:highvibe/widgets/tags/inherited_tags_data_list.dart';
import 'package:highvibe/widgets/tags/tag_item_interface.dart';
import 'package:highvibe/widgets/tags/tag_item_remove_button_view_model.dart';
import 'package:highvibe/widgets/tags/tags_data_list.dart';

typedef OnLongPressedCallback = void Function(TagItemInterface item);
typedef OnPressedCallback = void Function(TagItemInterface item);

class TagItem extends StatefulWidget {
  final int index;
  final String title;
  final double textScaleFactor;
  final bool active;
  final bool pressEnabled;
  final Object customData;
  final ItemTagsRemoveButtonViewModel removeButton;
  final TextStyle textStyle;
  final MainAxisAlignment alignment;
  final BorderRadius borderRadius;
  final BoxBorder border;
  final EdgeInsets padding;
  final double elevation;
  final bool singleItem;
  final TextOverflow textOverflow;
  final Color textColor;
  final Color textActiveColor;
  final Color backgroundColor;
  final Color activeColor;
  final Color highlightColor;
  final Color splashColor;
  final Color colorShowDuplicate;
  final OnPressedCallback onPressed;
  final OnLongPressedCallback onLongPressed;

  const TagItem({
    @required this.index,
    @required this.title,
    @required this.removeButton,
    this.textScaleFactor,
    this.active = true,
    this.pressEnabled = true,
    this.customData,
    this.textStyle = const TextStyle(fontSize: 14),
    this.alignment = MainAxisAlignment.center,
    this.borderRadius,
    this.border,
    this.padding = const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
    this.elevation = 5,
    this.singleItem = false,
    this.textOverflow = TextOverflow.fade,
    this.textColor = Colors.black,
    this.textActiveColor = Colors.white,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.blueGrey,
    this.highlightColor,
    this.splashColor,
    this.colorShowDuplicate = Colors.red,
    this.onPressed,
    this.onLongPressed,
    Key key,
  })  : assert(index != null),
        assert(title != null),
        super(key: key);

  @override
  _TagItemState createState() => _TagItemState();
}

class _TagItemState extends State<TagItem> {
  final double _initBorderRadius = 50;
  InheritedTagsDataList _dataListInherited;
  TagsDataList _dataList;

  Widget get _combine {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          flex: 0,
          child: FittedBox(
            alignment: Alignment.centerRight,
            fit: BoxFit.fill,
            child: GestureDetector(
              child: Container(
                margin: widget.removeButton.margin ??
                    const EdgeInsets.only(left: 5),
                padding:
                    (widget.removeButton.padding ?? const EdgeInsets.all(2)) *
                        (widget.textStyle.fontSize / 14),
                decoration: BoxDecoration(
                  color: widget.removeButton.backgroundColor ?? Colors.black,
                  borderRadius: widget.removeButton.borderRadius ??
                      BorderRadius.circular(_initBorderRadius),
                ),
                child: widget.removeButton.padding ??
                    Icon(
                      Icons.clear,
                      color: widget.removeButton.color ?? Colors.white,
                      size: (widget.removeButton.size ?? 12) *
                          (widget.textStyle.fontSize / 14),
                    ),
              ),
              onTap: () {
                if (widget.removeButton.onDelete()) {
                  _dataListInherited.list.removeAt(widget.index);
                }
              },
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _setDataList();

    final fontSize = widget.textStyle.fontSize;
    var color = _dataList.active ? widget.activeColor : widget.backgroundColor;

    if (_dataList.showDuplicate) color = widget.colorShowDuplicate;

    return Material(
      color: color,
      borderRadius:
          widget.borderRadius ?? BorderRadius.circular(_initBorderRadius),
      elevation: widget.elevation,
      child: InkWell(
        borderRadius:
            widget.borderRadius ?? BorderRadius.circular(_initBorderRadius),
        highlightColor:
            widget.pressEnabled ? widget.highlightColor : Colors.transparent,
        splashColor:
            widget.pressEnabled ? widget.splashColor : Colors.transparent,
        child: Container(
            decoration: BoxDecoration(
              border: widget.border ??
                  Border.all(color: widget.activeColor, width: 0.5),
              borderRadius: widget.borderRadius ??
                  BorderRadius.circular(_initBorderRadius),
            ),
            padding: widget.padding * (fontSize / 14),
            child: _combine),
        onTap: widget.pressEnabled
            ? () {
                if (widget.singleItem) {
                  _singleItem(_dataListInherited, _dataList);
                  _dataList.active = true;
                } else {
                  _dataList.active = !_dataList.active;
                }

                if (widget.onPressed != null) {
                  widget.onPressed(
                    TagItemInterface(
                      index: widget.index,
                      title: _dataList.title,
                      active: _dataList.active,
                      customData: widget.customData,
                    ),
                  );
                }
              }
            : null,
        onLongPress: widget.onLongPressed != null
            ? () => widget.onLongPressed(
                  TagItemInterface(
                    index: widget.index,
                    title: _dataList.title,
                    active: _dataList.active,
                    customData: widget.customData,
                  ),
                )
            : null,
      ),
    );
  }

  @override
  void dispose() {
    _dataList.removeListener(_didValueChange);
    super.dispose();
  }

  void _didValueChange() => setState(() {});

  void _setDataList() {
    _dataListInherited = InheritedTagsDataList.of(context);

    if (_dataListInherited.list.length < _dataListInherited.itemCount) {
      _dataListInherited.list.length = _dataListInherited.itemCount;
    }

    if (_dataListInherited.list.length > (widget.index + 1) &&
        _dataListInherited.list.elementAt(widget.index) != null &&
        _dataListInherited.list.elementAt(widget.index).title != widget.title) {
      _dataListInherited.list.removeAt(widget.index);

      if (_dataListInherited.list.elementAt(widget.index) != null &&
          _dataListInherited.list.elementAt(widget.index).title !=
              widget.title) {
        _dataListInherited.list.removeRange(
          widget.index,
          _dataListInherited.list.length,
        );
      }
    }

    if (_dataListInherited.list.length < (widget.index + 1)) {
      _dataListInherited.list.insert(
        widget.index,
        TagsDataList(
          title: widget.title,
          index: widget.index,
          active: widget.singleItem ? false : widget.active,
          customData: widget.customData,
        ),
      );
    } else if (_dataListInherited.list.elementAt(widget.index) == null) {
      _dataListInherited.list[widget.index] = TagsDataList(
        title: widget.title,
        active: widget.singleItem ? false : widget.active,
        customData: widget.customData,
      );
    }

    // removes items that have been orphaned
    if (_dataListInherited.itemCount == widget.index + 1 &&
        _dataListInherited.list.length > _dataListInherited.itemCount) {
      _dataListInherited.list
          .removeRange(widget.index + 1, _dataListInherited.list.length);
    }

    if (_dataList != null) _dataList.removeListener(_didValueChange);

    _dataList = _dataListInherited.list.elementAt(widget.index);
    _dataList.addListener(_didValueChange);
  }

  /// Single item selection
  void _singleItem(InheritedTagsDataList dataSetIn, TagsDataList dataSet) {
    dataSetIn.list
        .where((tg) => tg.active)
        .where((tg2) => tg2 != dataSet)
        .forEach((tg) => tg.active = false);
  }
}
