import 'package:buzzin/src/View/Config/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextTab extends StatelessWidget {
  String tabName;
  int tabIndex;
  int selectedIndex;
  Function() onTapOfTab;
  TextTab({
    super.key,
    required this.tabName,
    required this.tabIndex,
    required this.selectedIndex,
    required this.onTapOfTab,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(5.r),
      elevation: 1,
      child: InkWell(
        onTap: () {
          onTapOfTab();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          height: 26.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: selectedIndex == tabIndex
                ? Colors.blue
                : Colors.white,
          ),
          alignment: Alignment.center,
          child:  Text(
            tabName,
            textAlign: TextAlign.center,
            style: fontLight.copyWith(color: selectedIndex== tabIndex?Colors.white:Colors.black),
          ),
        ),
      ),
    );
  }
}