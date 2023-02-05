part of 'ui_bloc.dart';

class UIState {
  int? uiIndex;
  UIState({this.uiIndex});

  UIState copyWith(UIState uiState) {
    return UIState(uiIndex: uiState.uiIndex ?? uiIndex);
  }
}
