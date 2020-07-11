import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_chip.dart';
import 'package:highvibe/widgets/gradient_outline_button.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';

class StartingBell extends StatefulWidget {
  @override
  _StartingBellState createState() => _StartingBellState();
}

class _StartingBellState extends State<StartingBell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Starting Bell'),
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CupertinoTheme(
            data: const CupertinoThemeData(),
            child: CupertinoTimerPicker(
              mode: CupertinoTimerPickerMode.hm,
              onTimerDurationChanged: (duration) {},
            ),
          ),
          const Divider(
            color: hintTextColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  Strings.count,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 24.0,
                      height: 24.0,
                      child: OutlineButton(
                        highlightedBorderColor: accentColor,
                        splashColor: hintTextColor,
                        padding: const EdgeInsets.all(0.0),
                        borderSide: const BorderSide(color: hintTextColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: const Icon(
                          Icons.remove,
                          size: 20.0,
                          color: accentColor,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        '2',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 24.0,
                      height: 24.0,
                      child: OutlineButton(
                        highlightedBorderColor: accentColor,
                        splashColor: hintTextColor,
                        padding: const EdgeInsets.all(0.0),
                        borderSide: const BorderSide(color: hintTextColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 20.0,
                          color: accentColor,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const Divider(
            color: hintTextColor,
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              Strings.sound,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: <Widget>[
                GradientChip(
                  label: Strings.rain,
                  selected: false,
                  onSelected: (value) {},
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GradientChip(
                    label: Strings.wind,
                    selected: true,
                    onSelected: (value) {},
                  ),
                ),
                GradientChip(
                  label: Strings.waves,
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: GradientOutlineButton(
              icon: const Icon(
                Icons.close,
                color: accentColor,
              ),
              label: const Text(
                Strings.cancel,
                style: TextStyle(
                  color: accentColor,
                  fontSize: 16,
                ),
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: GradientRaisedButton(
              onPressed: () {},
              icon: Icons.done,
              label: Strings.done,
            ),
          ),
        ],
      ),
    );
  }
}
