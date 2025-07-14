import 'package:buzzin/src/View/Core/Utils/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Core/CommonWidgets/contact_icon.dart';
import '../Core/Resources/app_colors.dart';
import '../Core/Resources/app_strings.dart';

class PinnedChatsPage extends StatelessWidget {
  const PinnedChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        // color: Colors.red
        gradient: LinearGradient(
          colors: [
            Colors.white,
            AppColors.userOfflineColor.withOpacity(0.5),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
        padding:EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      height: 400.h,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kToolbarHeight.hs,
          Text(
            AppStrings.pinnedChats,
            style: textTheme.headlineLarge,
            textAlign: TextAlign.left,
          ),
          10.hs,
          SizedBox(
            height: 275.h,
            child: GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 1.5,
              ),
              itemBuilder: (context, i) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
                  decoration: BoxDecoration(
                      color: i==0 || i==3?AppColors.pinnedChatCardColor:AppColors.chatCardColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ContactIcon(bigCircleRadius: 18,smallCircleRadius: 2,offsetForSmallCircle: 2,),
                          4.ws,
                          Flexible(child: Text("Darlene Steward",maxLines: 2,style:textTheme.headlineMedium)),
                        ],
                      ),
                      8.hs,
                      Text("we have a meeting today in the 4th floor at 4pm,",style:textTheme.headlineSmall,overflow: TextOverflow.ellipsis,)
                    ],
                  ),
                );
              },
            ),
          ),
          10.hs,
        ],
      ),
    );
  }
}



