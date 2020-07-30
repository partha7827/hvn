import 'package:flutter/material.dart';

class UploadContentTextfield extends StatelessWidget {
  final VoidCallback onEditingComplete;
  final String hintText;
  final TextEditingController textEditingController;
  final int maxLines;
  final double height;

  const UploadContentTextfield({
    @required this.onEditingComplete,
    @required this.textEditingController,
    @required this.hintText,
    this.maxLines = 1,
    this.height = 40,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        controller: textEditingController,
        maxLines: maxLines,
        onEditingComplete: onEditingComplete,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
          height: 1.3,
        ),
        decoration: InputDecoration(
          hintText: hintText,
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
      ),
    );
  }
}
