import 'package:bloc/bloc.dart';
import 'package:coffee_ui/bloc/models/coffee_model.dart';
import '../../providers/api.dart';
import 'coffee_state.dart';
import 'coffee_event.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  CoffeeBloc() : super(CoffeeState(coffeeCartList: [], coffeeItems: [])) {
    on<FetchCoffeeItems>((event, emit) async {
      print('Fetching coffee items');
      List<CoffeeModel> coffeeItems = await API.getCoffees();
      emit(
        state.copyWith(CoffeeState(coffeeItems: coffeeItems)),
      );
    });
    on<AddCoffee>((event, emit) {
      final state = this.state;
      print('Added coffee');
      emit(state.copyWith(
        CoffeeState(coffeeCartList: state.coffeeCartList!..add(event.coffee)),
      ));
    });

    on<RemoveCoffee>((event, emit) {
      final state = this.state;
      print('Removed coffee');
      emit(state.copyWith(
        CoffeeState(
            coffeeCartList: state.coffeeCartList!..remove(event.coffee)),
      ));
    });

    on<Login>((event, emit) {
      print('Logging in');
      // emit(event.isLogin = true;)
    });
  }
}
