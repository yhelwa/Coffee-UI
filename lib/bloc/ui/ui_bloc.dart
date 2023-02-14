import 'package:bloc/bloc.dart';
part 'ui_event.dart';
part 'ui_state.dart';

class UIBloc extends Bloc<UIEvent, UIState> {
  UIBloc() : super(UIState(uiIndex: 0)) {
    on<ChangeIndex>((event, emit) {
      print('Changing UI index...');
      print(event.uiIndex);
      emit(state.copyWith(UIState(uiIndex: event.uiIndex)));
    });
  }
}
