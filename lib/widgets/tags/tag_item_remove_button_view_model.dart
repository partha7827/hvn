import 'package:flutter/material.dart';

typedef OnDeletedCallback = void Function();

class ItemTagsRemoveButtonViewModel {
  final IconData icon;
  final double size;
  final Color backgroundColor;
  final Color color;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final OnDeletedCallback onDelete;

  ItemTagsRemoveButtonViewModel({
    this.icon,
    this.size,
    this.backgroundColor,
    this.color,
    this.borderRadius,
    this.padding,
    this.margin,
    this.onDelete,
  });
}
