class DashBoardState {
  final bool isLoading;
  final bool isError;
  final String? errorMessage;
  final int selectedTabIndex;



  DashBoardState({
    this.isLoading = false,
    this.isError = false,
    this.errorMessage,
    this.selectedTabIndex = 0,
  });

  DashBoardState copyWith({
    bool? isLoading,
    bool? isError,
    String? errorMessage,
    int? selectedTabIndex,
  }) {
    return DashBoardState(
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
    );
  }

}