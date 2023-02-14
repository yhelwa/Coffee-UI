import 'package:coffee_ui/bloc/coffee/coffee_event.dart';
import 'package:coffee_ui/widgets/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/coffee/coffee_bloc.dart';
import '../../../bloc/coffee/coffee_state.dart';

class CoffeeTypes extends StatefulWidget {
  const CoffeeTypes({Key? key}) : super(key: key);

  @override
  State<CoffeeTypes> createState() => _CoffeeTypesState();
}

class _CoffeeTypesState extends State<CoffeeTypes> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    CoffeeBloc _coffeeBloc = BlocProvider.of<CoffeeBloc>(context);

    return BlocBuilder<CoffeeBloc, CoffeeState>(
      builder: (context, state) {
        return state.coffeeItems!.isEmpty
            ? Container()
            : SizedBox(
                height: 35,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.coffeeItems!.first.coffeeTypes.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                        _coffeeBloc.add(FilterType(selectedIndex));
                      },
                      child: CoffeeType(
                        coffeeType:
                            state.coffeeItems!.first.coffeeTypes[index].name,
                        isSelected: selectedIndex == index,
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}
