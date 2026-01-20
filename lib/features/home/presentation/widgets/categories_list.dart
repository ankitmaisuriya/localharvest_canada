import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList();

  @override
  Widget build(BuildContext context) {
    final categories = [
      ('🥕', 'Vegetables'),
      ('🍎', 'Fruits'),
      ('🥛', 'Dairy'),
      ('🥩', 'Meat & Eggs'),
      ('🍞', 'Baked'),
      ('➕', 'More'),
    ];

    return SizedBox(
      height: 90,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, index) {
          final category = categories[index];
          return Container(
            width: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 6,
                  color: Colors.black12,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(category.$1, style: const TextStyle(fontSize: 24)),
                const SizedBox(height: 6),
                Text(
                  category.$2,
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
