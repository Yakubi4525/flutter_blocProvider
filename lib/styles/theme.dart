import 'package:flutter/material.dart';

ThemeData themeDark = ThemeData(
  disabledColor: Colors.white,
  brightness: Brightness.dark,
  primaryColor: kGreyPrimaryColor,
  scaffoldBackgroundColor: kBackGroundColor,
  textTheme: TextTheme(
    headline1: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 17,
      fontFamily: 'SFUText',
    ),
  ),
);
const kBackGroundColor = Color(0xFF24282F);
const kGreyPrimaryColor = Color(0xFF3C3E44);
const kBottomColorWhite = Color(0xFFFFFFFF);
const kIconGreyColor = Color(0xFF999999);
const kIconGreenColor = Color(0xFF00C48C);

const String appTittle = 'Rick and Morty';
const String originalLocationText = "Original Location";
const String genderText = "Gender";
const String locationText = "Location";



const kTittleTextStyle = TextStyle(
  fontFamily: "SFUIText",
  fontSize: 17,
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontStyle: FontStyle.normal,
);

TextStyle kMainGreyTextStyle = TextStyle(
  fontFamily: "SFUIText",
  fontSize: 15,
  color: Color(0xFF171717),
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.normal,
);

TextStyle kMainTextStyle = TextStyle(
  fontFamily: "SFUIText",
  fontSize: 15,
  color: Colors.white,
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.normal,
);

TextStyle kGreyTextStyle = TextStyle(
  fontFamily: "SFUIText",
  fontSize: 13,
  color: Colors.white.withOpacity(0.5),
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.normal,
);
