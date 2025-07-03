import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension IntExtention on int {
  SizedBox get hs {
    final sizedBox = SizedBox(height: toDouble().h);
    return sizedBox;
  }

  SizedBox get ws {
    final sizedBox = SizedBox(width: toDouble().w);
    return sizedBox;
  }
}

extension DoubleExtention on double {
  SizedBox get hs {
    final sizedBox = SizedBox(
      height: toDouble().h,
    );
    return sizedBox;
  }

  SizedBox get ws {
    final sizedBox = SizedBox(
      width: toDouble().h,
    );
    return sizedBox;
  }
}