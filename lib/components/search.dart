import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        prefixIcon: Icon(Icons.search, color: Colors.orange.shade700),
        fillColor: const Color.fromRGBO(19, 25, 34, 1),
        filled: true,
        hintText: "Find your coffee...",
        hintStyle: TextStyle(color: Colors.grey.shade800),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
