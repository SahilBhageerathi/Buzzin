import 'package:buzzin/src/ViewModel/Logic/Dashboard_bloc/dashboard_bloc.dart';
import 'package:buzzin/src/ViewModel/Logic/internet_bloc/internet_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviders {
  static MultiBlocProvider buildBlocProviders({required Widget child}) {
    return MultiBlocProvider(providers: [
      BlocProvider<InternetBloc>(create: (_) => InternetBloc.instance),
      BlocProvider<DashBoardBloc>(create: (_) => DashBoardBloc.instance),
    ], child: child);
  }
}