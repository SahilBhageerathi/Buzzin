import 'package:buzzin/src/View/Core/Utils/app_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackArrow;
  final Widget? leadingWidget;
  final Widget? title;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.showBackArrow = true,
    this.leadingWidget,
    this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: AppBar(
          automaticallyImplyLeading: false,
          leading: showBackArrow
              ? IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              : leadingWidget,
          title: title,
          actions: actions ?? [],
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
