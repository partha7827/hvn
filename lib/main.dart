import 'package:flutter/material.dart';
import 'package:highvibe/ensure_meeting_permission.dart';

void main() {
  runApp(HighVibeApp());
}

class HighVibeApp extends StatelessWidget {
  const HighVibeApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HighVibe',
      home: EnsureMeetingPermission(),
    );
  }
}