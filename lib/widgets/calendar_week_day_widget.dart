import 'package:flutter/material.dart';
import 'package:highvibe/values/themes.dart';

class WeekdayWidget extends StatelessWidget {
  const WeekdayWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildDay('MON'),
        _buildDay('TUE'),
        _buildDay('WED'),
        _buildDay('THU'),
        _buildDay('FRI'),
        _buildDay('SAT'),
        _buildDay('SUN'),
      ],
    );
  }

  Expanded _buildDay(String label) {
    return Expanded(
      child: Text(
        label,
        style: normal14Hint,
        textAlign: TextAlign.center,
      ),
    );
  }
}
