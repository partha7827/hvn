import 'package:flutter/material.dart';
import 'package:highvibe/widgets/tags/tags_text_field_view_model.dart';

class TagsSuggestionTextField extends StatefulWidget {
  final TagsTextFieldViewModel tagsTextField;
  final OnSubmittedCallback onSubmitted;

  TagsSuggestionTextField({
    @required this.tagsTextField,
    this.onSubmitted,
    Key key,
  })  : assert(tagsTextField != null),
        super(key: key);

  @override
  _TagsSuggestionTextFieldState createState() =>
      _TagsSuggestionTextFieldState();
}

class _TagsSuggestionTextFieldState extends State<TagsSuggestionTextField> {
  final _controller = TextEditingController();

  List<String> _matches = [];
  String _helperText;
  bool _helperCheck = true;

  List<String> _suggestions;
  bool _constraintSuggestion;
  double _fontSize;
  InputDecoration _inputDecoration;

  InputDecoration get _initialInputDecoration {
    final input = _inputDecoration ??
        InputDecoration(
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
              vertical: 6 * (_fontSize / 14), horizontal: 6 * (_fontSize / 14)),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey[300],
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Colors.blueGrey[400].withOpacity(0.3)),
          ),
          border: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Colors.blueGrey[400].withOpacity(0.3)),
          ),
        );

    return input.copyWith(
      helperText: _helperCheck || _suggestions == null ? null : _helperText,
      helperStyle: widget.tagsTextField.helperTextStyle,
      hintText: widget.tagsTextField.hintText ?? 'Add a tag',
      hintStyle: TextStyle(color: widget.tagsTextField.hintTextColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    _helperText = widget.tagsTextField.helperText ?? 'no matches';
    _suggestions = widget.tagsTextField.suggestions;
    _constraintSuggestion = widget.tagsTextField.constraintSuggestion;
    _inputDecoration = widget.tagsTextField.inputDecoration;
    _fontSize = widget.tagsTextField.textStyle.fontSize;

    return Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        Visibility(
          visible: _suggestions != null,
          child: Container(
            padding: _inputDecoration != null
                ? _inputDecoration.contentPadding
                : EdgeInsets.symmetric(
                    vertical: 6 * (_fontSize / 14),
                    horizontal: 6 * (_fontSize / 14)),
            child: Text(
              _matches.isNotEmpty ? (_matches.first) : '',
              softWrap: false,
              overflow: TextOverflow.fade,
              style: TextStyle(
                height: widget.tagsTextField.textStyle.height ?? 1,
                fontSize: _fontSize ?? 12,
                color: widget.tagsTextField.suggestionTextColor ?? Colors.red,
              ),
            ),
          ),
        ),
        TextField(
          controller: _controller,
          enabled: widget.tagsTextField.enabled,
          autofocus: widget.tagsTextField.autofocus ?? true,
          keyboardType: widget.tagsTextField.keyboardType ?? TextInputType.text,
          textCapitalization: widget.tagsTextField.textCapitalization ??
              TextCapitalization.none,
          maxLength: widget.tagsTextField.maxLength ?? 50,
          maxLines: 1,
          autocorrect: widget.tagsTextField.autocorrect ?? false,
          style: widget.tagsTextField.textStyle.copyWith(
            height: widget.tagsTextField.textStyle.height == null ? 1 : null,
          ),
          decoration: _initialInputDecoration,
          onChanged: (str) => _checkOnChanged(str),
          onSubmitted: (str) => _onSubmitted(str),
        )
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
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
        _controller.clear();
      }
    } else if (str.isNotEmpty) {
      if (onSubmitted != null) onSubmitted(str);
      _controller.clear();
    }
  }
}
