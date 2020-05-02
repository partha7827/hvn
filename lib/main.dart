import 'package:flutter/material.dart';
import 'package:high_vibe_mobile/ui/pages/auth/face/face_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FacePage()
    );
  }
}

