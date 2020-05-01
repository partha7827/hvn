import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/provider/bottom_navigation_provider.dart';
import 'package:highvibe/ui/discover/discover.dart';
import 'package:highvibe/ui/live/live.dart';
import 'package:highvibe/ui/profile/profile.dart';
import 'package:highvibe/values/themes.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _screens = [
    Home(),
    Discover(),
    Live(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationProvider>(context);
    return Scaffold(
      body: _screens[provider.currentIndex],
//      bottomNavigationBar: Padding(
//        padding: const EdgeInsets.all(20.0),
//        child: Container(
//          decoration: BoxDecoration(
//            color: secondaryColor,
//            borderRadius: BorderRadius.circular(50.0),
//          ),
//          height: 60,
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              _bottomBarItem(
//                title: 'Home',
//                asset: 'assets/ic_home.svg',
//                onPressed: () => provider.currentIndex = 0,
//                selected: provider.currentIndex == 0,
//              ),
//              _bottomBarItem(
//                title: 'Discover',
//                asset: 'assets/ic_discover.svg',
//                onPressed: () => provider.currentIndex = 1,
//                selected: provider.currentIndex == 1,
//              ),
//              _bottomBarItem(
//                title: 'Live  ',
//                asset: 'assets/ic_live.svg',
//                onPressed: () => provider.currentIndex = 2,
//                selected: provider.currentIndex == 2,
//              ),
//              _bottomBarItem(
//                title: 'Profile',
//                asset: 'assets/ic_profile.svg',
//                onPressed: () => provider.currentIndex = 3,
//                selected: provider.currentIndex == 3,
//              ),
//            ],
//          ),
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.add),
//        onPressed: () {
//          Navigator.push(
//            context,
//            MaterialPageRoute(
//              builder: (_) => MeditationTimer(),
//            ),
//          );
//        },
//      ),
    );
  }

  _bottomBarItem({
    String title,
    String asset,
    Function onPressed,
    bool selected,
  }) {
    return Container(
      width: 60.0,
      child: Material(
        borderRadius: BorderRadius.circular(50.0),
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: SvgPicture.asset(
                  asset,
                  color: selected ? accentColor : Colors.white,
                ),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: selected ? accentColor : Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
