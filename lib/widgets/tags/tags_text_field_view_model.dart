import 'package:flutter/material.dart';

typedef OnChangedCallback = void Function(String string);
typedef OnSubmittedCallback = void Function(String string);

class TagsTextFieldViewModel {
  final double width;
  final bool enabled;
  final bool duplicates;
  final TextStyle textStyle;
  final InputDecoration inputDecoration;
  final bool autocorrect;
  final List<String> suggestions;

  /// Allows you to insert tags not present in the list of suggestions
  final bool constraintSuggestion;
  final bool lowerCase;
  final bool autofocus;
  final String hintText;
  final Color hintTextColor;
  final Color suggestionTextColor;
  final String helperText;
  final TextStyle helperTextStyle;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final int maxLength;
  final OnSubmittedCallback onSubmitted;
  final OnChangedCallback onChanged;

  const TagsTextFieldViewModel({
    this.lowerCase = false,
    this.textStyle = const TextStyle(fontSize: 14),
    this.width = 200,
    this.enabled = true,
    this.duplicates = false,
    this.suggestions,
    this.constraintSuggestion = true,
    this.autocorrect,
    this.autofocus,
    this.hintText,
    this.hintTextColor,
    this.suggestionTextColor,
    this.helperText,
    this.helperTextStyle,
    this.keyboardType,
    this.textCapitalization,
    this.maxLength,
    this.inputDecoration,
    this.onSubmitted,
    this.onChanged,
  });
}
