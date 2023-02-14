class CoffeeModel2 {
  final String coffeeName;
  final String coffeeDescription;
  final String coffeeImagePath;
  final double coffeePrice;

  CoffeeModel2({
    required this.coffeeName,
    required this.coffeeDescription,
    required this.coffeeImagePath,
    required this.coffeePrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': coffeeName,
      'description': coffeeDescription,
      'image': coffeeImagePath,
    };
  }

  factory CoffeeModel2.fromMap(Map<String, dynamic> map) {
    // print('map');
    // print(map);
    return CoffeeModel2(
        coffeeName: map['title'] as String,
        coffeeDescription: map['description'] as String,
        coffeeImagePath: map['image'] as String,
        coffeePrice: 3.99);
  }
}
