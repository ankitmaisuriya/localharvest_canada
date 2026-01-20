import 'package:flutter/material.dart';
import 'package:localharvest_canada/config/routes/app_routes.dart';

class FarmItemCard extends StatelessWidget {
  final String name;
  final String category;
  final double distance;
  final List<String> products;

  const FarmItemCard({
    super.key,
    required this.name,
    required this.category,
    required this.distance,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.farmDetail);
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(6),
                child: Container(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    "assets/images/top_banner.png",
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Farm Name + Distance
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${distance.toStringAsFixed(1)} km',
                          style: const TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(category, style: const TextStyle(color: Colors.grey)),
                    const SizedBox(height: 8),
                    // Products
                    Wrap(
                      spacing: 8,
                      children: products
                          .map(
                            (p) => Chip(
                              label: Text(p),
                              backgroundColor: Colors.green.shade100,
                              labelStyle: const TextStyle(color: Colors.green),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
