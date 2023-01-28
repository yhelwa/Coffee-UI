import 'package:coffee_ui/bloc/coffee/coffee_bloc.dart';
import 'package:coffee_ui/components/special.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/coffee/coffee_event.dart';
import '../bloc/coffee/coffee_state.dart';
import '../bloc/models/coffee_model.dart';
import '../pages/mobile/coffee_page.dart';
import '../providers/api.dart';
import 'coffee_tile.dart';
import 'constants.dart';

class CoffeeListSpecial extends StatefulWidget {
  const CoffeeListSpecial({Key? key}) : super(key: key);

  @override
  State<CoffeeListSpecial> createState() => _CoffeeListSpecialState();
}

class _CoffeeListSpecialState extends State<CoffeeListSpecial> {
  @override
  void initState() {
    super.initState();
    getCoffeeItems();
  }

  getCoffeeItems() async {
    CoffeeBloc _coffee = BlocProvider.of<CoffeeBloc>(context);
    _coffee.add(const FetchCoffeeItems());
    print('state coffee cart is');
    print(_coffee.state.coffeeCartList);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffeeBloc, CoffeeState>(
      builder: (context, state) {
        print('Coffee Items Length is');
        print(state.coffeeItems!.length);
        if (state.coffeeItems!.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 355,
                child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.coffeeItems!.length - 2,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: InkWell(
                          onTap: (() => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CoffeePage(
                                      coffeeModel: state.coffeeItems![index],
                                      index: index),
                                ),
                              )),
                          child: CoffeeTile(
                            coffeeModel: state.coffeeItems![index],
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
                    return SpecialForYou(coffee: state.coffeeItems![index]);
                  }),
            ],
          );
        }
      },
    );
  }
}
