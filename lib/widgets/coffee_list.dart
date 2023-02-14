import 'package:coffee_ui/bloc/coffee/coffee_bloc.dart';
import 'package:coffee_ui/components/special.dart';
import 'package:coffee_ui/models/coffee_model.dart';
import 'package:coffee_ui/models/menu_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/coffee/coffee_state.dart';
import '../pages/mobile/coffee_page.dart';
import 'coffee_tile.dart';
import 'constants.dart';

class CoffeeListSpecial extends StatelessWidget {
  const CoffeeListSpecial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffeeBloc, CoffeeState>(
      builder: (context, state) {
        print('Coffee Items Length is ${state.coffeeItems!.length}');
        if (state.coffeeItems!.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          List<CoffeeModel> _coffeeList = state
              .filteredCoffeeItems!.first.coffeeTypes
              .elementAt(state.indexType!)
              .products
              .expand((element) => element.coffees)
              .toList();
          // _coffeeList.forEach((element) {print(element.coffeeName)})
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              state.filteredCoffeeItems!.isEmpty
                  ? SizedBox(
                      height: 355,
                      child: Center(
                        child: Text(
                          'No results found',
                          style: CoffeeTextStyle.copyWith(
                              color: Colors.orange.shade700, fontSize: 32),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 355,
                      child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 20),
                          scrollDirection: Axis.horizontal,
                          itemCount: _coffeeList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: InkWell(
                                onTap: (() => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CoffeePage(
                                            coffeeModel: _coffeeList[index],
                                            index: index),
                                      ),
                                    )),
                                child: CoffeeTile(
                                  coffeeModel: _coffeeList[index],
                                  index: index,
                                ),
                              ),
                            );
                          }),
                    ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Special for you',
                style: CoffeeTextStyle.copyWith(fontSize: 32),
              ),
              const SizedBox(
                height: 25,
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return SpecialForYou(
                        coffee: state.coffeeItems![0].coffeeTypes[0].products
                            .first.coffees.first);
                  }),
            ],
          );
        }
      },
    );
  }
}
