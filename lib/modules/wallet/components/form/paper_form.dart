import 'package:flutter/cupertino.dart';

class PaperForm extends StatelessWidget {
  PaperForm({this.children, this.padding = 8, this.actionButtons});

  final List<Widget> children;
  final List<Widget> actionButtons;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...children,
            ..._buildButtons(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildButtons() {
    if (actionButtons == null) return [Container()];

    return [
      const SizedBox(height: 15),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: actionButtons,
      )
    ];
  }
}
