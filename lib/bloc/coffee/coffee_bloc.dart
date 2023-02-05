import 'package:bloc/bloc.dart';
import 'package:coffee_ui/models/coffee_model.dart';
import 'coffee_state.dart';
import 'coffee_event.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  CoffeeBloc()
      : super(CoffeeState(
            coffeeCartList: [], coffeeItems: [], filteredCoffeeItems: [])) {
    on<FetchCoffeeItems>((event, emit) async {
      print('Fetching coffee items');
      // List<CoffeeModel> coffeeItems = await API.getCoffees();
      List<CoffeeModel> coffeeItems = [
        CoffeeModel(
            coffeeImagePath: 'assets/images/coffee.png',
            coffeeName: 'Cappuccino',
            coffeePrice: 4.99,
            coffeeDescription: ''),
        CoffeeModel(
            coffeeImagePath: 'assets/images/lattee.jpg',
            coffeeName: 'Latte',
            coffeePrice: 5.99,
            coffeeDescription: ''),
        CoffeeModel(
          coffeeImagePath: 'assets/images/milk.png',
          coffeeName: 'Milk',
          coffeePrice: 2.99,
          coffeeDescription: '',
        ),
      ];

      emit(
        state.copyWith(CoffeeState(
            coffeeItems: coffeeItems, filteredCoffeeItems: coffeeItems)),
      );
    });
    on<AddCoffee>((event, emit) {
      final state = this.state;
      print('Added coffee');
      emit(state.copyWith(CoffeeState(
          coffeeCartList: state.coffeeCartList!..add(event.coffee))));
    });

    on<RemoveCoffee>((event, emit) {
      final state = this.state;
      print('Removed coffee');
      emit(state.copyWith(CoffeeState(
          coffeeCartList: state.coffeeCartList!..remove(event.coffee))));
    });

    on<Login>((event, emit) {
      print('Logging in');
      // emit(event.isLogin = true;)
    });

    on<FilterSearch>((event, emit) {
      List<CoffeeModel> coffeeList = state.coffeeItems!
          .where((coffee) => coffee.coffeeName
              .toLowerCase()
              .startsWith(event.value.toLowerCase()))
          .toList();
      emit(state.copyWith(CoffeeState(
          filteredCoffeeItems:
              event.value.isEmpty ? state.coffeeItems : coffeeList)));
    });
  }
}
