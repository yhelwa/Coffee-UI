import 'package:bloc/bloc.dart';
import 'package:coffee_ui/pages/coffee_model.dart';
import 'package:equatable/equatable.dart';

part 'coffee_event.dart';
part 'coffee_state.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  CoffeeBloc() : super(CoffeeInitial()) {
    on<LoadCoffee>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));

      emit(const CoffeeLoaded(coffees: <CoffeeModel>[]));
    });

    on<AddCoffee>((event, emit) {
      if (state is CoffeeLoaded) {
        final state = this.state as CoffeeLoaded;
        print('Added coffee');
        emit(
            CoffeeLoaded(coffees: List.from(state.coffees)..add(event.coffee)));
      }
    });

    on<RemoveCoffee>((event, emit) {
      if (state is CoffeeLoaded) {
        final state = this.state as CoffeeLoaded;
        print('Remove coffee');
        emit(CoffeeLoaded(
            coffees: List.from(state.coffees)..remove(event.coffee)));
      }
    });

    on<Login>((event, emit) {
      print('Logging in');
      // emit(event.isLogin = true;)
    });
  }
}
