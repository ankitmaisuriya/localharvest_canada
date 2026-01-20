import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 6),
    child: Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(6),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for farms or products',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: const Icon(Icons.filter_list),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none
          ),
          filled: true,
          fillColor: Colors.white
        ),
      ),
    ),);
  }
}
