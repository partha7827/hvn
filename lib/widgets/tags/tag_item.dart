import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:highvibe/widgets/tags/tag_item_remove_button_view_model.dart';

typedef OnLongPressedCallback = void Function();
typedef OnPressedCallback = void Function();

class TagItem extends StatelessWidget {
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
    this.textStyle = const TextStyle(fontSize: 12, color: Colors.white),
    this.alignment = MainAxisAlignment.center,
    this.borderRadius,
    this.border,
    this.padding = const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
    this.elevation = 5,
    this.textOverflow = TextOverflow.fade,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.blueGrey,
    this.highlightColor,
    this.splashColor,
    this.colorShowDuplicate = Colors.red,
    this.onPressed,
    this.onLongPressed,
    Key key,
  }) : super(key: key);

  TextAlign get _textAlignment {
    switch (alignment) {
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
    final _initBorderRadius = 5.0;
    final fontSize = textStyle.fontSize;
    return Material(
      color: backgroundColor,
      borderRadius: borderRadius ?? BorderRadius.circular(_initBorderRadius),
      elevation: elevation,
      child: InkWell(
        borderRadius: borderRadius ?? BorderRadius.circular(_initBorderRadius),
        highlightColor: pressEnabled ? highlightColor : Colors.transparent,
        splashColor: pressEnabled ? splashColor : Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            border: border ?? Border.all(color: activeColor, width: 0.5),
            borderRadius:
                borderRadius ?? BorderRadius.circular(_initBorderRadius),
          ),
          padding: padding * (fontSize / 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 2,
                child: Text(
                  title,
                  softWrap: false,
                  textAlign: _textAlignment,
                  overflow: textOverflow,
                  textScaleFactor: textScaleFactor,
                  style: textStyle,
                ),
              ),
              Flexible(
                flex: 0,
                child: FittedBox(
                  alignment: Alignment.centerRight,
                  fit: BoxFit.fill,
                  child: GestureDetector(
                    child: Container(
                      margin:
                          removeButton.margin ?? const EdgeInsets.only(left: 5),
                      padding:
                          (removeButton.padding ?? const EdgeInsets.all(2)) *
                              (textStyle.fontSize / 14),
                      decoration: BoxDecoration(
                        color: removeButton.backgroundColor ?? Colors.black,
                        borderRadius: removeButton.borderRadius ??
                            BorderRadius.circular(_initBorderRadius),
                      ),
                      child: removeButton.padding ??
                          Icon(
                            Icons.clear,
                            color: removeButton.color ?? Colors.white,
                            size: (removeButton.size ?? 12) *
                                (textStyle.fontSize / 14),
                          ),
                    ),
                    onTap: () => removeButton.onDelete(),
                  ),
                ),
              )
            ],
          ),
        ),
        onTap: () => onPressed(),
        onLongPress: () => onLongPressed(),
      ),
    );
  }
}
