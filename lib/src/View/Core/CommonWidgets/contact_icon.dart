import 'dart:math';
import 'package:buzzin/src/View/Core/Resources/svg_images.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Resources/app_colors.dart';

class ContactIcon extends StatelessWidget {
  final String userImage;
  final int bigCircleRadius;
  final int smallCircleRadius;
  final double angleInDegrees;
  final bool isOnline;

  const ContactIcon({
    super.key,
    this.userImage = SvgImages.noUserIcon,
    this.bigCircleRadius = 25,
    this.smallCircleRadius = 5,
    this.angleInDegrees = 45.0,
    this.isOnline = true,
  });

  @override
  Widget build(BuildContext context) {
    final angle = angleInDegrees * pi / 180;

    final bigRadius = bigCircleRadius.r;
    final smallRadius = smallCircleRadius.r;

    final offsetX = bigRadius + bigRadius * cos(angle) - smallRadius;
    final offsetY = bigRadius + bigRadius * sin(angle) - smallRadius;

    return SizedBox(
      width: (bigRadius * 2),
      height: (bigRadius * 2),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: bigRadius * 2,
            width: bigRadius * 2,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              userImage,
              height: bigRadius * 2,
              width: bigRadius * 2,
              placeholderBuilder: (context) => const CircularProgressIndicator(color: Colors.blue),
            ),
          ),
          Positioned(
            left: offsetX - 3.r,
            top: offsetY - 3.r,
            child: Container(
              height: 2 * (smallRadius + 3.r),
              width: 2 * (smallRadius + 3.r),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: offsetX,
            top: offsetY,
            child: Container(
              height: 2 * smallRadius,
              width: 2 * smallRadius,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isOnline ? AppColors.userOnlineColor : AppColors.userOfflineColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
