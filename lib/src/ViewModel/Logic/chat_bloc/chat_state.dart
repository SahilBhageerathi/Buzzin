part of 'chat_bloc.dart';

class ChatState {
  final bool isLoading;
  final bool isError;
  final String? errorMessage;

  ChatState({
    this.isLoading = false,
    this.isError = false,
    this.errorMessage,
  });

  ChatState copyWith({
    bool? isLoading,
    bool? isError,
    String? errorMessage,
  }) {
    return ChatState(
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
