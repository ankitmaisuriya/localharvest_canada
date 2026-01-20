import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  const ProductsList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, index) {
          return Container(
            width: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 6),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image(
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/app_icon.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Organic Tomatoes',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '\$3.50 / lb',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
