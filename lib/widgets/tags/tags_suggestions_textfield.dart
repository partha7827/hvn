import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:highvibe/widgets/tags/tags_text_field_view_model.dart';

class TagsSuggestionTextField extends StatefulWidget {
  final TagsTextFieldViewModel tagsTextField;
  final TextEditingController textEditingController;
  final OnSubmittedCallback onSubmitted;

  TagsSuggestionTextField({
    @required this.tagsTextField,
    @required this.textEditingController,
    @required this.onSubmitted,
    Key key,
  })  : assert(tagsTextField != null),
        super(key: key);

  @override
  _TagsSuggestionTextFieldState createState() =>
      _TagsSuggestionTextFieldState();
}

class _TagsSuggestionTextFieldState extends State<TagsSuggestionTextField> {
  List<String> _matches = [];
  String _hintText;
  String _helperText;
  bool _helperCheck = true;
  List<String> _suggestions;
  bool _constraintSuggestion;
  double _fontSize;
  InputDecoration _inputDecoration;

  @override
  Widget build(BuildContext context) {
    _hintText = widget.tagsTextField.helperText ?? '';
    _helperText = widget.tagsTextField.helperText ?? 'no matches';
    _suggestions = widget.tagsTextField.suggestions;
    _constraintSuggestion = widget.tagsTextField.constraintSuggestion;
    _inputDecoration = widget.tagsTextField.inputDecoration;
    _fontSize = widget.tagsTextField.textStyle.fontSize;

    return SizedBox(
      height: widget.tagsTextField.height,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Visibility(
            visible: _suggestions != null,
            child: Container(
              padding: _inputDecoration != null
                  ? _inputDecoration.contentPadding
                  : const EdgeInsets.fromLTRB(15, 11, 0, 11),
              child: Text(
                _matches.isNotEmpty ? (_matches.first) : '',
                softWrap: false,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  height: widget.tagsTextField.textStyle.height,
                  fontSize: _fontSize,
                  color: widget.tagsTextField.suggestionTextColor ??
                      const Color(0xFF8E8F99),
                ),
              ),
            ),
          ),
          TextField(
            controller: widget.textEditingController,
            enabled: widget.tagsTextField.enabled,
            autofocus: widget.tagsTextField.autofocus,
            keyboardType:
                widget.tagsTextField.keyboardType ?? TextInputType.text,
            textCapitalization: widget.tagsTextField.textCapitalization ??
                TextCapitalization.none,
            maxLength: widget.tagsTextField.maxLength,
            maxLines: widget.tagsTextField.maxLines,
            autocorrect: widget.tagsTextField.autocorrect,
            style: widget.tagsTextField.textStyle,
            decoration: InputDecoration(
              hintText: _hintText,
              helperText:
                  _helperCheck || _suggestions == null ? null : _helperText,
              hintStyle: const TextStyle(color: Color(0xFF8E8F99)),
              border: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF525366),
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              contentPadding: const EdgeInsets.fromLTRB(15, 11, 0, 11),
            ),
            onChanged: (str) => _checkOnChanged(str),
            onSubmitted: (str) => _onSubmitted(str),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void _checkOnChanged(String str) {
    if (_suggestions != null) {
      _matches =
          _suggestions.where((String sgt) => sgt.startsWith(str)).toList();

      if (str.isEmpty) _matches = [];

      if (_matches.length > 1) _matches.removeWhere((String mtc) => mtc == str);

      setState(() {
        _helperCheck =
            _matches.isNotEmpty || str.isEmpty || !_constraintSuggestion
                ? true
                : false;
        _matches.sort((a, b) => a.compareTo(b));
      });
    }

    if (widget.tagsTextField.onChanged != null) {
      widget.tagsTextField.onChanged(str);
    }
  }

  void _onSubmitted(String str) {
    final onSubmitted = widget.onSubmitted;

    if (_suggestions != null && _matches.isNotEmpty) str = _matches.first;

    if (widget.tagsTextField.lowerCase) str = str.toLowerCase();

    str = str.trim();

    if (_suggestions != null) {
      if (_matches.isNotEmpty || !_constraintSuggestion) {
        if (onSubmitted != null) onSubmitted(str);
        setState(() {
          _matches = [];
        });
        widget.textEditingController.clear();
      }
    } else if (str.isNotEmpty) {
      if (onSubmitted != null) onSubmitted(str);
      widget.textEditingController.clear();
    }
  }
}
