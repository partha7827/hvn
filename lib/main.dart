import 'package:flutter/material.dart';
import 'package:highvibe/provider/bottom_navigation_provider.dart';
import 'package:highvibe/ui/home/home_page.dart';
import 'package:highvibe/values/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home: ChangeNotifierProvider(
        child: HomePage(),
        create: (_) => BottomNavigationProvider(),
      ),
    );
  }
}
