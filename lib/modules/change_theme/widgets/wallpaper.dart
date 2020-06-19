import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';

class WallpaperList extends StatefulWidget {
  final List<dynamic> wallpapers = [
    'assets/theme_1.png',
    'assets/theme_2.png',
    'assets/theme_3.png',
    'assets/theme_4.png',
    'assets/theme_5.png',
    'assets/theme_6.png',
  ];

  @override
  _WallpaperListState createState() => _WallpaperListState();
}

class _WallpaperListState extends State<WallpaperList> {
  int selectedThemeIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        GridView.builder(
          itemCount: widget.wallpapers.length,
          itemBuilder: (BuildContext context, int index) {
            return getWallpaper(context, index);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 0.6),
        ),
        Container(
          height: 48,
          margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: primaryGradient,
          ),
          child: InkWell(
            onTap: () {
              print('apply clicked..!!');
            },
            child: Center(
              child: Text(
                Strings.apply,
                style: normal16White,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getWallpaper(BuildContext context, int index) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          GestureDetector(
            onTap: () {
              selectedThemeIndex = index;
              setState(() {});
            },
            child: Container(
                width: 98,
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child:
                    Image.asset(widget.wallpapers[index], fit: BoxFit.cover)),
          ),
          Container(
            width: 32,
            height: 32,
            margin: const EdgeInsets.only(
              bottom: 8,
              right: 8,
            ),
            alignment: Alignment.bottomRight,
            child: selectedThemeIndex > -1 && selectedThemeIndex == index
                ? Image.asset('assets/ic_active.png')
                : SvgPicture.asset('assets/ic_inactive_selector.svg'),
          ),
        ],
      ),
    );
  }
}
