import 'package:buzzin/src/View/Config/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme{
  AppTheme._();

  static ThemeData light = ThemeData(
    useMaterial3: true,
    fontFamily: 'PlusJakartaSans',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,//TODO: change to figma app color
    primaryColor: Colors.blue, //TODO: change to figma app color
    textTheme:AppTextTheme.lightTextTheme
  );


  static ThemeData dark = ThemeData(
    useMaterial3: true,
    fontFamily: 'PlusJakartaSans',
    brightness: Brightness.dark,
    textTheme:AppTextTheme.darkTextTheme
  );
  
}