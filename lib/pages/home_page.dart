import 'package:flutter/material.dart';
import 'package:flutter_application_test/pages/coffee_type.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, bool> coffeeType = {
    'Cappaccino': true,
    'Espresso': false,
    'Latte': false,
    'Flat White': false
  };

  @override
  void initState() {
    // TODO: implement initState
    print('object');
    print(coffeeType.keys);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            Text(
              'Find the best coffee for you',
              style: GoogleFonts.bebasNeue(fontSize: 50, color: Colors.white),
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                prefixIcon: const Icon(Icons.search),
                hintText: "Find your coffee...",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 20,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeType.length,
                itemBuilder: (context, index) {
                  String coffeeKey = coffeeType.keys.elementAt(index);
                  return InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        coffeeType.updateAll((key, value) => value = false);
                        coffeeType[coffeeKey] = true;
                      });
                    },
                    child: CoffeeType(
                      coffeeType: coffeeKey,
                      isSelected: coffeeType.values.elementAt(index),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
