import 'package:flutter/material.dart';

//Colors
const primaryColor = const Color(0xFF000222);
const secondaryColor = const Color(0xFF212342);
const primaryTextColor = Colors.white;
const secondaryTextColor = const Color(0xFF66CCCC);
const hintTextColor = const Color(0xFF8E8F99);

const LinearGradient primaryGradient = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    const Color(0xFF666CCC),
    const Color(0xFF66CCCC),
  ],
);

//LinearGradient gradient1 = LinearGradient(90deg, #66E3A0 -4.2%, #66CCCC 97.26%, #66CCCC 105.56%);
LinearGradient secondaryGradient = LinearGradient(colors: [
  const Color(0xFF66E3A0),
  const Color(0xFF66CCCC),
]);

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
