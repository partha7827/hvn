import 'package:flutter/material.dart';

typedef OnChangedCallback = void Function(String string);
typedef OnSubmittedCallback = void Function(String string);

class TagsTextFieldViewModel {
  final bool autocorrect;
  final bool autofocus;

  /// Allows you to insert tags not present in the list of suggestions
  final bool constraintSuggestion;
  final bool duplicates;
  final bool enabled;
  final bool lowerCase;
  final Color hintTextColor;
  final Color suggestionTextColor;
  final double width;
  final double height;
  final InputDecoration inputDecoration;
  final int maxLength;
  final List<String> suggestions;
  final OnChangedCallback onChanged;
  final OnSubmittedCallback onSubmitted;
  final String helperText;
  final String hintText;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final TextStyle helperTextStyle;
  final TextStyle textStyle;
  final int maxLines;

  const TagsTextFieldViewModel({
    this.autocorrect = false,
    this.autofocus = false,
    this.constraintSuggestion = false,
    this.duplicates = false,
    this.enabled = true,
    this.helperText,
    this.helperTextStyle,
    this.hintText,
    this.hintTextColor,
    this.inputDecoration,
    this.keyboardType,
    this.lowerCase = false,
    this.maxLength,
    this.onChanged,
    this.onSubmitted,
    this.suggestions,
    this.suggestionTextColor,
    this.textCapitalization,
    this.textStyle = const TextStyle(
      fontSize: 14,
      color: Colors.white,
      height: 1.3,
    ),
    this.width = 200,
    this.height = 40,
    this.maxLines = 1,
  });
}
