import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Colors
const primaryColor = const Color(0xFF000222);
const secondaryColor = const Color(0xFF212342);
const primaryLightColor = const Color(0xFF2E304C);
const primaryTextColor = Colors.white;
const accentColor = const Color(0xFF66CCCC);
const hintTextColor = const Color(0xFF8E8F99);
const redColor = const Color(0xFFFF0000);

const LinearGradient primaryGradient = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    const Color(0xFF666CCC),
    const Color(0xFF66CCCC),
  ],
);

const LinearGradient primaryGradientHorizontal = const LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    const Color(0xFF666CCC),
    const Color(0xFF66CCCC),
  ],
);

LinearGradient secondaryGradient = LinearGradient(colors: [
  const Color(0xFF66E3A0),
  const Color(0xFF66CCCC),
]);

const darkToTransparentGradient = const LinearGradient(
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  colors: [
    const Color(0x7006081A),
    Colors.transparent,
  ],
);

const homeHeaderGradient = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Colors.transparent,
    const Color(0xFF000222),
  ],
);

// TextStyles
TextStyle bold20PlayfairWhite = GoogleFonts.playfairDisplay(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

TextStyle bold18PlayfairWhite = GoogleFonts.playfairDisplay(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

TextStyle bold18White = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

TextStyle bold16White = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

TextStyle bold20White = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
  color: Colors.white,
);

var bold22White = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 22,
  color: Colors.white,
);

TextStyle normal16Accent = TextStyle(
  fontSize: 16,
  color: accentColor,
);

TextStyle normal12Accent = TextStyle(
  fontSize: 12,
  color: accentColor,
);
TextStyle normal14White = TextStyle(
  fontSize: 14,
  color: Colors.white,
);

TextStyle normal16White = TextStyle(
  fontSize: 16,
  color: Colors.white,
);

TextStyle normal12White = TextStyle(
  fontSize: 12,
  color: Colors.white,
);

TextStyle normal14Hint = TextStyle(
  fontSize: 14,
  color: hintTextColor,
);
TextStyle normal12Hint = TextStyle(
  fontSize: 12,
  color: hintTextColor,
);
TextStyle normal16Hint = TextStyle(
  fontSize: 16,
  color: hintTextColor,
);

final appTheme = ThemeData(
  backgroundColor: const Color(0xFF000222),
  canvasColor: const Color(0xFF000222),
  primaryColor: const Color(0xFF000222),
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: const Color(0xFF000222),
    textTheme: TextTheme(),
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: const Color(0xFF212342),
  ),
);
