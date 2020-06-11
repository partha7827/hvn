import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/models/fab_icon/fab_icon_model.dart';
import 'package:highvibe/values/themes.dart';

class FabWithIcons extends StatefulWidget {
  const FabWithIcons({
    this.icons,
    this.onIconTapped,
  });

  final List<FabIconModel> icons;
  final ValueChanged<int> onIconTapped;

  @override
  State createState() => FabWithIconsState();
}

class FabWithIconsState extends State<FabWithIcons>
    with TickerProviderStateMixin {
  AnimationController _controller;

  ValueChanged<int> onIconTapped;
  bool isFabClicked = false;
  IconData icon = Icons.add;

  @override
  void initState() {
    super.initState();
    onIconTapped = widget.onIconTapped;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.icons.length, (int index) {
        return _buildChild(index);
      }).toList()
        ..add(
          _buildFab(),
        ),
    );
  }

  Widget _buildChild(int index) {
    final fabIcon = widget.icons[index];
    return Container(
      height: 70.0,
      width: 209.0,
      alignment: FractionalOffset.topCenter,
      child: ScaleTransition(
        scale: CurvedAnimation(
          parent: _controller,
          curve: Interval(0.0, 1.0 - index / widget.icons.length / 2.0,
              curve: Curves.easeOut),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                margin: const EdgeInsets.only(right: 8),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  gradient: primaryGradient,
                ),
                child: Text(
                  fabIcon.title,
                  style: normal14White,
                )),
            GestureDetector(
              onTap: () => {_onTapped(index)},
              child: Container(
                decoration: const BoxDecoration(
                  gradient: primaryGradient,
                  shape: BoxShape.circle,
                ),
                height: 60,
                width: 60,
                child: Center(
                    widthFactor: 30,
                    heightFactor: 30,
                    child: SvgPicture.asset(fabIcon.imagePath)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFab() {
    return Container(
      height: 60,
      width: 60,
      child: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          isFabClicked = !isFabClicked;
          icon = isFabClicked ? Icons.close : Icons.add;
          setState(() {});
          if (_controller.isDismissed) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            gradient: primaryGradient,
            shape: BoxShape.circle,
          ),
          child: Icon(icon),
        ),
        elevation: 2.0,
      ),
    );
  }

  void _onTapped(int index) {
    isFabClicked = !isFabClicked;
    setState(() {});
    _controller.reverse();
    widget.onIconTapped(index);
  }
}
