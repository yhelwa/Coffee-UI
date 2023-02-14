import 'package:bloc/bloc.dart';
import 'package:coffee_ui/models/coffee_model.dart';
import 'package:coffee_ui/models/coffee_model_2.dart';
import 'package:coffee_ui/models/menu_model.dart';
import '../../providers/api.dart';
import 'coffee_state.dart';
import 'coffee_event.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  CoffeeBloc()
      : super(CoffeeState(
            coffeeCartList: [],
            coffeeList: [],
            coffeeItems: [],
            filteredCoffeeItems: [],
            indexType: 0)) {
    on<FetchCoffeeItems>((event, emit) async {
      print('Fetching coffee items');
      List<MenuModel> coffeeItems = await API.getCoffees();
      // List<CoffeeModel> coffeeItems = [
      //   CoffeeModel(
      //       coffeeImagePath: 'assets/images/coffee.png',
      //       coffeeName: 'Cappuccino',
      //       coffeePrice: 4.99,
      //       coffeeDescription: ''),
      //   CoffeeModel(
      //       coffeeImagePath: 'assets/images/lattee.jpg',
      //       coffeeName: 'Latte',
      //       coffeePrice: 5.99,
      //       coffeeDescription: ''),
      //   CoffeeModel(
      //     coffeeImagePath: 'assets/images/milk.png',
      //     coffeeName: 'Milk',
      //     coffeePrice: 2.99,
      //     coffeeDescription: '',
      //   ),
      // ];
      print(coffeeItems.first.coffeeTypes.first.name);
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
      List<MenuModel> coffeeList = state.coffeeItems!
          .where((coffee) =>
              coffee.name.toLowerCase().startsWith(event.value.toLowerCase()))
          .toList();

      emit(state.copyWith(CoffeeState(
          filteredCoffeeItems:
              event.value.isEmpty ? state.coffeeItems : coffeeList)));
    });
    on<FilterType>((event, emit) {
      // List<CoffeeModel> coffeeList = state
      //     .coffeeItems!.first.coffeeTypes[event.indexType].products
      //     .elementAt(1)
      //     .coffees;
      emit(state.copyWith(CoffeeState(indexType: event.indexType)));
    });
  }
}
