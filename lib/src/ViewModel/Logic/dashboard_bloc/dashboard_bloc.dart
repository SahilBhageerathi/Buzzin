import 'package:buzzin/src/ViewModel/Logic/Dashboard_bloc/dashboard_event.dart';
import 'package:buzzin/src/ViewModel/Logic/Dashboard_bloc/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardBloc extends Bloc<DashboardEvent, DashBoardState> {
  static DashBoardBloc? _instance;

  static DashBoardBloc get instance {
    _instance ??= DashBoardBloc._();
    return _instance!;
  }

  DashBoardBloc._() : super(DashBoardState()) {
    on<InitializeDashboardEvent>(_onInitialization);
  }

  _onInitialization(InitializeDashboardEvent event, emit) async {
    emit(state.copyWith(isLoading: true));
  }

  changeTab(int selectedIndex){
    emit(state.copyWith(selectedTabIndex:selectedIndex));
  }
}
