import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:highvibe/widgets/tags/tag_item_remove_button_view_model.dart';

typedef OnLongPressedCallback = void Function();
typedef OnPressedCallback = void Function();

class TagItem extends StatefulWidget {
  final String title;
  final double textScaleFactor;
  final bool active;
  final bool pressEnabled;
  final ItemTagsRemoveButtonViewModel removeButton;
  final TextStyle textStyle;
  final MainAxisAlignment alignment;
  final BorderRadius borderRadius;
  final BoxBorder border;
  final EdgeInsets padding;
  final double elevation;
  final bool singleItem;
  final TextOverflow textOverflow;
  final Color backgroundColor;
  final Color activeColor;
  final Color highlightColor;
  final Color splashColor;
  final Color colorShowDuplicate;
  final OnPressedCallback onPressed;
  final OnLongPressedCallback onLongPressed;

  const TagItem({
    @required this.title,
    @required this.removeButton,
    this.textScaleFactor,
    this.active = true,
    this.pressEnabled = false,
    this.textStyle = const TextStyle(fontSize: 14, color: Colors.white),
    this.alignment = MainAxisAlignment.center,
    this.borderRadius,
    this.border,
    this.padding = const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
    this.elevation = 5,
    this.singleItem = false,
    this.textOverflow = TextOverflow.fade,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.blueGrey,
    this.highlightColor,
    this.splashColor,
    this.colorShowDuplicate = Colors.red,
    this.onPressed,
    this.onLongPressed,
    Key key,
  })  : assert(title != null),
        super(key: key);

  @override
  _TagItemState createState() => _TagItemState();
}

class _TagItemState extends State<TagItem> {
  final double _initBorderRadius = 5;

  TextAlign get _textAlignment {
    switch (widget.alignment) {
      case MainAxisAlignment.spaceBetween:
      case MainAxisAlignment.start:
        return TextAlign.start;
        break;
      case MainAxisAlignment.end:
        return TextAlign.end;
        break;
      case MainAxisAlignment.spaceAround:
      case MainAxisAlignment.spaceEvenly:
      case MainAxisAlignment.center:
        return TextAlign.center;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final fontSize = widget.textStyle.fontSize;
    return Material(
      color: widget.backgroundColor,
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
            borderRadius:
                widget.borderRadius ?? BorderRadius.circular(_initBorderRadius),
          ),
          padding: widget.padding * (fontSize / 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Text(
                  widget.title,
                  softWrap: false,
                  textAlign: _textAlignment,
                  overflow: widget.textOverflow,
                  textScaleFactor: widget.textScaleFactor,
                  style: widget.textStyle,
                ),
              ),
              Flexible(
                flex: 0,
                child: FittedBox(
                  alignment: Alignment.centerRight,
                  fit: BoxFit.fill,
                  child: GestureDetector(
                    child: Container(
                      margin: widget.removeButton.margin ??
                          const EdgeInsets.only(left: 5),
                      padding: (widget.removeButton.padding ??
                              const EdgeInsets.all(2)) *
                          (widget.textStyle.fontSize / 14),
                      decoration: BoxDecoration(
                        color:
                            widget.removeButton.backgroundColor ?? Colors.black,
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
                    onTap: () => widget.removeButton.onDelete(),
                  ),
                ),
              )
            ],
          ),
        ),
        onTap: () => widget.onPressed(),
        onLongPress: () => widget.onLongPressed(),
      ),
    );
  }
}
