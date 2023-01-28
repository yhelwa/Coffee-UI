import 'dart:convert';
import 'package:coffee_ui/bloc/models/coffee_model.dart';
import 'package:coffee_ui/bloc/models/menu_model.dart';
import 'package:http/http.dart' as http;

class API {
  // static Stream<List<CoffeeModel>> getCoffees() async* {
  //   List<CoffeeModel> coffeeList = [];
  //   const String url = 'https://api.sampleapis.com/coffee/hot';
  //   var response = await http.Client().get(
  //     Uri.parse(url),
  //   );
  //   if (response.statusCode == 200) {
  //     List<dynamic> coffeeBody = json.decode(response.body);
  //     for (var element in coffeeBody) {
  //       coffeeList.add(CoffeeModel.fromMap(element));
  //     }
  //     // CoffeeModel.fromMap(json.decode(response.body));
  //     print(coffeeList[2].coffeeName);
  //     yield coffeeList;
  //   } else {
  //     print(json.decode(response.body));
  //     throw 'Failed to coffee data.';
  //   }
  //   // static Stream<dynamic> getCoffees() async* {
  //   //   dynamic response =
  //   //       await Client().get(Uri.parse('https://api.sampleapis.com/coffee/hot'));
  //   //   print(response);
  //   //   yield response;
  //   // }
  // }

  static Future<List<CoffeeModel>> getCoffees() async {
    List<MenuModel> menuList = [];
    List<CoffeeModel> coffeeList = [];

    const String url = 'https://www.starbucks.com/bff/ordering/menu';
    var response = await http.Client().get(
      Uri.parse(url),
    );
    dynamic menus = json.decode(response.body)['menus'];
    for (var i = 0; i < menus.length; i++) {
      menuList.add(MenuModel.fromJson(json.decode(response.body)['menus'][i]));
    }
    // MenuModel menuModel =
    //     MenuModel.fromJson(json.decode(response.body)['menus'][0]);

    menuList.forEach((element) {
      print(element.name);
    });
    // dynamic body = json.decode(response.body)['menus'][0]['children'];
    // print(body);
    if (response.statusCode == 200) {
      // List<dynamic> coffeeBody = json.decode(response.body);
      // print(coffeeBody.length);
      // for (var element in coffeeBody) {
      //   coffeeList.add(CoffeeModel.fromMap(element));
      // }
      // CoffeeModel.fromMap(json.decode(response.body));
      // print(coffeeList[2].coffeeName);
      // coffeeList.removeAt(coffeeList.length - 1);
      // coffeeList.removeAt(coffeeList.length - 1);
      // coffeeList.sort(
      //   (a, b) => a.coffeeName.compareTo(b.coffeeName),
      // );
      return coffeeList;
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
