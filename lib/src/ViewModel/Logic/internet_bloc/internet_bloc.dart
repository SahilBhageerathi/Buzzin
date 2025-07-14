import 'dart:async';
import 'package:buzzin/src/View/Core/Utils/global_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../View/Core/Resources/app_strings.dart';

part 'internet_event.dart';

part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  static InternetBloc? _instance;

  static InternetBloc get instance {
    _instance ??= InternetBloc._();
    return _instance!;
  }

  InternetBloc._() : super(InternetState()) {
    on<NetworkNotify>(_updateStatus);
  }

  FutureOr<void> _updateStatus(NetworkNotify event, Emitter<InternetState> emit) {
    if (event.status == false) {
      // ScaffoldMessenger.of(GlobalConstants.navigatorKey.currentContext!).showSnackBar(SnackBar(
      //     duration: const Duration(days: 100),
      //     behavior: SnackBarBehavior.floating,
      //     content: Container(
      //       color: Colors.blue,
      //       height: 100.h,
      //       width: 750.w,
      //     ),
      //     elevation: 0,
      //     backgroundColor: Colors.transparent));

    } else {
      ScaffoldMessenger.of(GlobalConstants.navigatorKey.currentContext!).hideCurrentSnackBar();
    }
    emit(state.copyWith(status: event.status));
  }
}
