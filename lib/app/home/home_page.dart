import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/home/widgets/authors_widget.dart';
import 'package:highvibe/app/home/widgets/header_widget.dart';
import 'package:highvibe/app/home/widgets/livenow_widget.dart';
import 'package:highvibe/app/home/widgets/tools_widget.dart';
import 'package:highvibe/app/home/widgets/upcoming_events_widget.dart';
import 'package:highvibe/widgets/bottom_navigation.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          HeaderWidget(),
          LiveNowWidget(),
          AuthorsWidget(),
          UpcomingEventsWidget(),
          ToolsWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
