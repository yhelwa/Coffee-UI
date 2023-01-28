import 'package:bloc/bloc.dart';
part 'ui_event.dart';
part 'ui_state.dart';

class UiBloc extends Bloc<UIEvent, UIState> {
  UiBloc() : super(const UIState()) {
    on<UIEvent>((event, emit) {});
  }
}
