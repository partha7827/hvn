import 'package:flutter/material.dart';
import 'package:highvibe/widgets/tags/tags_data_list.dart';
import 'package:highvibe/widgets/tags/tag_item_interface.dart';
import 'package:highvibe/widgets/tags/inherited_tags_data_list.dart';
import 'package:highvibe/widgets/tags/tags_suggestions_textfield.dart';
import 'package:highvibe/widgets/tags/tags_text_field_view_model.dart';

typedef ItemBuilder = Widget Function(int index);

class Tags extends StatefulWidget {
  ///specific number of columns
  final int columns;

  ///numer of item List
  final int itemCount;

  /// imposes the same width and the same number of columns for each row
  final bool symmetry;

  /// ability to scroll tags horizontally
  final bool horizontalScroll;

  /// horizontal spacing of  the [TagItem]
  final double heightHorizontalScroll;

  /// horizontal spacing of  the [TagItem]
  final double spacing;

  /// vertical spacing of  the [TagItem]
  final double runSpacing;

  /// horizontal alignment of  the [TagItem]
  final WrapAlignment alignment;

  /// vertical alignment of  the [TagItem]
  final WrapAlignment runAlignment;

  /// direction of  the [TagItem]
  final Axis direction;

  /// Iterate [TagItemInterface] from the lower
  /// to the upper direction or vice versa
  final VerticalDirection verticalDirection;

  /// Text direction of  the [TagItem]
  final TextDirection textDirection;

  /// Generates a list of [TagItem].
  final ItemBuilder itemBuilder;
  final TagsTextFieldViewModel textField;

  final TextEditingController textEditingController;

  Tags({
    this.textEditingController,
    this.columns,
    this.itemCount = 0,
    this.symmetry = false,
    this.horizontalScroll = false,
    this.heightHorizontalScroll = 60,
    this.spacing = 6,
    this.runSpacing = 14,
    this.alignment = WrapAlignment.center,
    this.runAlignment = WrapAlignment.center,
    this.direction = Axis.horizontal,
    this.verticalDirection = VerticalDirection.down,
    this.textDirection = TextDirection.ltr,
    this.itemBuilder,
    this.textField,
    Key key,
  })  : assert(itemCount >= 0),
        assert(alignment != null),
        assert(runAlignment != null),
        assert(direction != null),
        assert(verticalDirection != null),
        assert(textDirection != null),
        super(key: key);

  @override
  TagsState createState() => TagsState();
}

class TagsState extends State<Tags> {
  final GlobalKey _containerKey = GlobalKey();
  Orientation _orientation = Orientation.portrait;
  double _width = 0;
  final List<TagsDataList> _list = [];
  List<TagItemInterface> get getAllItem => _list.toList();

  @override
  Widget build(BuildContext context) {
    // essential to avoid infinite loop of addPostFrameCallback
    if (widget.symmetry &&
        (MediaQuery.of(context).orientation != _orientation || _width == 0)) {
      _orientation = MediaQuery.of(context).orientation;
      _getWidthContext();
    }

    return InheritedTagsDataList(
      list: _list,
      symmetry: widget.symmetry,
      itemCount: widget.itemCount,
      child: Container(
        height: widget.heightHorizontalScroll,
        color: Colors.transparent,
        child: ListView(
          padding: const EdgeInsets.all(0),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: _buildItems(),
        ),
      ),
    );
  }

  List<Widget> _buildItems() {
    final Widget textField = widget.textField != null
        ? Container(
            alignment: Alignment.center,
            width: widget.symmetry ? _calculateWidth() : widget.textField.width,
            child: TagsSuggestionTextField(
              textEditingController: widget.textEditingController,
              tagsTextField: widget.textField,
              onSubmitted: (str) {
                if (!widget.textField.duplicates) {
                  final lst = _list.where((l) => l.title == str).toList();
                  if (lst.isNotEmpty) {
                    lst.forEach((d) => d.showDuplicate = true);
                    return;
                  }
                }

                if (widget.textField.onSubmitted != null) {
                  widget.textField.onSubmitted(str);
                }
              },
            ),
          )
        : null;

    final finalList = <Widget>[];

    var itemList = List.generate(
      widget.itemCount,
      (i) {
        final item = widget.itemBuilder(i);
        if (widget.symmetry) {
          return Container(width: _calculateWidth(), child: item);
        } else if (widget.horizontalScroll) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: widget.spacing),
            alignment: Alignment.center,
            child: item,
          );
        }

        return item;
      },
    );

    if (widget.horizontalScroll && widget.textDirection == TextDirection.rtl) {
      itemList = itemList.reversed.toList();
    }

    if (textField == null) {
      finalList.addAll(itemList);
      return finalList;
    }

    if (widget.horizontalScroll &&
        widget.verticalDirection == VerticalDirection.up) {
      finalList.add(textField);
      finalList.addAll(itemList);
    } else {
      finalList.addAll(itemList);
      finalList.add(textField);
    }

    return finalList;
  }

  void _getWidthContext() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final keyContext = _containerKey.currentContext;
      if (keyContext != null) {
        final RenderBox box = keyContext.findRenderObject();
        final size = box.size;
        setState(() {
          _width = size.width;
        });
      }
    });
  }

  double _calculateWidth() {
    final columns = widget.columns ?? 0;
    final margin = widget.spacing.round();
    final subtraction = columns * margin;
    final width = (_width > 1) ? (_width - subtraction) / columns : _width;
    return width;
  }
}
