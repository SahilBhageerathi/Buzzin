import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextTheme{
  AppTextTheme._();
  
static TextTheme  lightTextTheme = TextTheme(
  headlineLarge: fontBold.copyWith(fontSize: 20.sp,color: Colors.black),
  headlineMedium: fontMedium.copyWith(fontSize: 16.sp,color: Colors.black),
  headlineSmall: fontLight.copyWith(fontSize: 12.sp,color: Colors.black),
  );


  static TextTheme  darkTextTheme = TextTheme(
  headlineLarge: fontBold.copyWith(fontSize: 20.sp,color: Colors.black),
  headlineMedium: fontMedium.copyWith(fontSize: 16.sp,color: Colors.black),
  headlineSmall: fontLight.copyWith(fontSize: 12.sp,color: Colors.black),
  );

}

TextStyle get fontLight=>const TextStyle(fontWeight: FontWeight.w200);
TextStyle get fontMedium=>const TextStyle(fontWeight: FontWeight.w500);
TextStyle get fontBold=>const TextStyle(fontWeight: FontWeight.w800);