import 'dart:convert';

import 'package:coffee_ui/bloc/models/coffee_model.dart';
import 'package:http/http.dart' as http;

class API {
  static Stream<List<CoffeeModel>> getCoffees() async* {
    List<CoffeeModel> coffeeList = [];

    const String url = 'https://api.sampleapis.com/coffee/hot';
    var response = await http.Client().get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      // print(json.decode(response.body));

      List<dynamic> coffeeBody = json.decode(response.body);
      print(coffeeBody.length);

      for (var element in coffeeBody) {
        // print('element');
        // print(element);

        coffeeList.add(CoffeeModel.fromMap(element));
      }
      // CoffeeModel.fromMap(json.decode(response.body));
      print(coffeeList[2].coffeeName);
      yield coffeeList;
    } else {
      print(json.decode(response.body));
      throw 'Failed to coffee data.';
    }

    // static Stream<dynamic> getCoffees() async* {
    //   dynamic response =
    //       await Client().get(Uri.parse('https://api.sampleapis.com/coffee/hot'));

    //   print(response);
    //   yield response;
    // }
  }
}
