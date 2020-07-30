import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

const _desktopLandscapeBreakpoint = 1000;
const _desktopPortraitBreakpoint = 1000; // 700

DisplayType displayTypeOf(BuildContext context) {
  final orientation = MediaQuery.of(context).orientation;
  final width = MediaQuery.of(context).size.width;

  if ((orientation == Orientation.landscape &&
          width > _desktopLandscapeBreakpoint) ||
      (orientation == Orientation.portrait &&
          width > _desktopPortraitBreakpoint)) {
    return DisplayType.desktop;
  } else {
    return DisplayType.mobile;
  }
}

bool isDisplayDesktop(BuildContext context) {
  return displayTypeOf(context) == DisplayType.desktop;
}

bool isDisplaySmallDesktop(BuildContext context) {
  return isDisplayDesktop(context) &&
      MediaQuery.of(context).size.width < _desktopLandscapeBreakpoint;
}

bool get isDisplayWebDesktop => kIsWeb;

enum DisplayType {
  desktop,
  mobile,
}