import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../pages/coffee_model.dart';

class CoffeePrefs {
  static SharedPreferences? pref;
  static Future init() async {
    pref = await SharedPreferences.getInstance();
  }

  static const String _keyCoffeeCartItems = 'coffeeCartItems';

  static setCoffeeCartItems(List<CoffeeModel> coffeeList) =>
      pref!.setString(_keyCoffeeCartItems, jsonEncode(coffeeList));

  static List<CoffeeModel> getCoffeeCartItems() =>
      jsonDecode(pref!.getString(_keyCoffeeCartItems)!);
}
