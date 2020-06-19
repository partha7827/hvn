import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Colors
const primaryColor = Color(0xFF000222);
const secondaryColor = Color(0xFF212342);
const primaryLightColor = Color(0xFF2E304C);
const primaryTextColor = Colors.white;
const accentColor = Color(0xFF66CCCC);
const hintTextColor = Color(0xFF8E8F99);
const redColor = Color(0xFFFF0000);
const mediaPlayerBackgroundColor = Color(0xFF000222);
const greenColor = Color(0xFF39C16C);

const LinearGradient primaryGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF666CCC),
    Color(0xFF66CCCC),
  ],
);

const LinearGradient primaryGradientHorizontal = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFF666CCC),
    Color(0xFF66CCCC),
  ],
);

LinearGradient secondaryGradient = const LinearGradient(colors: [
  Color(0xFF66E3A0),
  Color(0xFF66CCCC),
]);

const darkToTransparentGradient = LinearGradient(
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  colors: [
    Color(0x7006081A),
    Colors.transparent,
  ],
);

const darkToTransparentGradientTop = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF000222),
    Colors.transparent,
  ],
);

const homeHeaderGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Colors.transparent,
    Color(0xFF000222),
  ],
);

// TextStyles
TextStyle bold20PlayfairWhite = GoogleFonts.playfairDisplay(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

TextStyle bold24White = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 24,
  color: Colors.white,
);

TextStyle normal25White = const TextStyle(
  fontSize: 25,
  color: Colors.white,
);

TextStyle bold24PlayfairWhite = GoogleFonts.playfairDisplay(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

TextStyle bold30PlayfairWhite = GoogleFonts.playfairDisplay(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

TextStyle bold18PlayfairWhite = GoogleFonts.playfairDisplay(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

TextStyle bold18White = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

TextStyle bold16White = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

TextStyle bold20White = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
  color: Colors.white,
);

TextStyle bold22White = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 22,
  color: Colors.white,
);

TextStyle normal16Accent = const TextStyle(
  fontSize: 16,
  color: accentColor,
);

TextStyle normal12Accent = const TextStyle(
  fontSize: 12,
  color: accentColor,
);
TextStyle normal14White = const TextStyle(
  fontSize: 14,
  color: Colors.white,
);
TextStyle normal13White = const TextStyle(
  fontSize: 13,
  color: Colors.white,
);
TextStyle normal13Green = const TextStyle(
  fontSize: 13,
  color: greenColor,
);
TextStyle normal14Accent = const TextStyle(
  fontSize: 14,
  color: accentColor,
);

TextStyle normal16White = const TextStyle(
  fontSize: 16,
  color: Colors.white,
);

TextStyle normaBoldl16White = const TextStyle(
  fontSize: 16,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

TextStyle normal18White = const TextStyle(
  fontSize: 18,
  color: Colors.white,
);

TextStyle normal18Hint = const TextStyle(
  fontSize: 18,
  color: Color(0xFF8E8F99),
);

TextStyle normal12White = const TextStyle(
  fontSize: 12,
  color: Colors.white,
);

TextStyle normal14Hint = const TextStyle(
  fontSize: 14,
  color: hintTextColor,
);
TextStyle normal12Hint = const TextStyle(
  fontSize: 12,
  color: hintTextColor,
);

TextStyle normal10Hint = const TextStyle(
  fontSize: 10,
  color: hintTextColor,
);

TextStyle normal16Hint = const TextStyle(
  fontSize: 16,
  color: hintTextColor,
);

final ThemeData appTheme = ThemeData(
  backgroundColor: const Color(0xFF000222),
  canvasColor: const Color(0xFF000222),
  primaryColor: const Color(0xFF000222),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    color: Color(0xFF000222),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF212342),
  ),
);
