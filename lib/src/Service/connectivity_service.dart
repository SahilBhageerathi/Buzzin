import 'dart:async';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../ViewModel/Logic/internet_bloc/internet_bloc.dart';

class ConnectivityService {
  final _controller = StreamController<bool>.broadcast();

  ConnectivityService() {
    InternetConnectionChecker.instance.onStatusChange.listen((status) {
      final isConnected = status == InternetConnectionStatus.connected;
      _controller.add(isConnected);
      InternetBloc.instance.add(NetworkNotify(status: isConnected));
    });
  }

  Stream<bool> get internetStatusStream => _controller.stream;

  void dispose() {
    _controller.close();
  }
}