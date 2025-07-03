part of 'internet_bloc.dart';
abstract class InternetEvent {}
class NetworkNotify extends InternetEvent{
  final bool status;
  NetworkNotify({required this.status});
}
