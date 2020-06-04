import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  const InputTextWidget(
      {Key key,
      this.title = '',
      this.hintText = '',
      this.maxLines,
      this.validator,
      this.controller})
      : super(key: key);

  final String title, hintText;
  final int maxLines;
  final TextEditingController controller;
  final Function validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$title',
            style: const TextStyle(
              color: Color(0xFF525366),
              fontSize: 14,
            ),
          ),
          Theme(
            data: ThemeData(
              primaryColor: Colors.white24,
            ),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
                border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white24)),
                hintText: '$hintText',
                hintStyle: const TextStyle(
                  color: Color(0xFF525366),
                ),
              ),
              maxLines: maxLines,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
              validator: validator,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
