import 'package:flutter/material.dart';

class FarmInfoCard extends StatelessWidget {
  const FarmInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🖼 Farm Images
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),

            ),
            child: SizedBox(
              height: 180,
              child: PageView(

                children: [
                  _farmImage("assets/images/top_banner.png"),
                  _farmImage("assets/images/top_banner.png"),
                  _farmImage("assets/images/top_banner.png"),
                ],
              ),
            ),
          ),

          /// 📄 Farm Info Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sunny Fields Farm",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightGreen,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "123 Country Rd, Farmville, Ontario",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 12),

                Wrap(
                  spacing: 8,
                  children: const [
                    Chip(label: Text("Organic 🌱")),
                    Chip(label: Text("Pickup Available")),
                    Chip(label: Text("Delivery")),
                  ],
                ),

                const SizedBox(height: 12),

                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.map, color: Colors.white),
                  label: const Text(
                    "View on Map",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                const Text(
                  "About the Farm",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Sunny Fields Farm is a family-owned organic farm committed to sustainable, natural farming. Fresh seasonal produce, free-range eggs, raw honey, and dairy products are available directly from the farm.",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Helper widget for farm images
  Widget _farmImage(String path) {
    return Image.asset(
      path,
      fit: BoxFit.fill,
      width: double.infinity,
    );
  }
}
