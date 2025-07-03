part of 'internet_bloc.dart';

class InternetState {
  final bool? status;

  InternetState({
    this.status,
  });

  InternetState copyWith({
    bool? status,
  }) {
    return InternetState(
      status: status ?? this.status,
    );
  }
}
