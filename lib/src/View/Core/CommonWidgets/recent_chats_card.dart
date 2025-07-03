import 'package:buzzin/src/View/Core/CommonWidgets/contact_icon.dart';
import 'package:buzzin/src/View/Core/Resources/svg_images.dart';
import 'package:buzzin/src/View/Core/Utils/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Resources/app_colors.dart';

class RecentChatCard extends StatelessWidget {
  int index;
  String contactName;
  String lastMessage;
  String contactImage;

  RecentChatCard({
    super.key,
    required this.index,
    required this.contactName,
    required this.lastMessage,
    this.contactImage=SvgImages.noUserIcon,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 64.h,
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: index % 3 == 0 ? AppColors.chatCardColor.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           ContactIcon(userImage: contactImage,),
          10.ws,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$contactName $index",
                  style: textTheme.headlineLarge!.copyWith(fontSize: 16.sp),
                ),
                5.hs,
                Text(
                  lastMessage,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
