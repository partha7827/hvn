import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hvn/modules/home/home_module.dart';
import 'package:hvn/modules/profile/profile_module.dart';
import 'package:hvn/values/themes.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(50.0),
        ),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _bottomBarItem(
              title: 'Home',
              asset: 'assets/ic_home.svg',
              onPressed: () => HomeModule.toHome(),
              selected: false //Modular.actualRoute == HomeModule.HOME,
            ),
            _bottomBarItem(
              title: 'Profile',
              asset: 'assets/ic_profile.svg',
              onPressed: () => ProfileModule.toProfile(),
              selected: false //Modular.actualRoute == ProfileModule.profileRoute,
            ),
          ],
        ),
      ),
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
