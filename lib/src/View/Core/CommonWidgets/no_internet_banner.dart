import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InternetBanner extends StatelessWidget {
  final bool isOnline;

  const InternetBanner({super.key, required this.isOnline});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isOnline ? Colors.green : Colors.black,
      ),
      alignment: Alignment.center,
      child: Text(
        isOnline ? "You're back online" : "No internet connection",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}