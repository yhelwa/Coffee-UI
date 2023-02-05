part of 'ui_bloc.dart';

class UIEvent {
  const UIEvent();
}

class ChangeIndex extends UIEvent {
  final int uiIndex;

  ChangeIndex({required this.uiIndex});
}
