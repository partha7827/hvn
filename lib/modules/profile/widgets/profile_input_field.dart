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
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$title',
            style: TextStyle(
              color: Color(0xFF525366),
              fontSize: 14,
            ),
          ),
          Theme(
            data: new ThemeData(
              primaryColor: Colors.white24,
            ),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                border: UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white24)),
                hintText: '$hintText',
                hintStyle: TextStyle(
                  color: Color(0xFF525366),
                ),
              ),
              maxLines: maxLines,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
              validator: validator,
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
