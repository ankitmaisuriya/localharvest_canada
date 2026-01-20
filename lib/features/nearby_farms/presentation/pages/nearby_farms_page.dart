import 'package:flutter/material.dart';
import 'package:localharvest_canada/features/nearby_farms/presentation/widgets/farm_item_card.dart';

class NearbyFarmsPage extends StatefulWidget {
  const NearbyFarmsPage({super.key});

  @override
  State<NearbyFarmsPage> createState() => _NearbyFarmsPageState();
}

class _NearbyFarmsPageState extends State<NearbyFarmsPage> {
  String selectedCategory = 'All';
  final List<String> categories = ['All', 'Vegetables', 'Fruits', 'Dairy'];

  // Mocked farm data
  final List<Map<String, dynamic>> farms = [
    {
      'name': 'Shri Ram Farm',
      'category': 'Vegetables',
      'distance': 1.2,
      'products': ['Tomato', 'Potato']
    },
    {
      'name': 'Khodiyar Farm',
      'category': 'Fruits',
      'distance': 1.8,
      'products': ['Mango', 'Banana']
    },
    {
      'name': 'Green Valley Farm',
      'category': 'Vegetables',
      'distance': 2.5,
      'products': ['Spinach', 'Carrot']
    },
    {
      'name': 'Fresh Roots Farm',
      'category': 'Dairy',
      'distance': 3.1,
      'products': ['Milk', 'Cheese']
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filter farms by category
    List<Map<String, dynamic>> filteredFarms = selectedCategory == 'All'
        ? farms
        : farms.where((f) => f['category'] == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Farms & Products'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category filter chips
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isSelected = category == selectedCategory;
                  return ChoiceChip(
                    label: Text(category),
                    selected: isSelected,
                    selectedColor: Colors.green.shade200,
                    onSelected: (_) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Farms list
            Expanded(
              child: ListView.builder(
                itemCount: filteredFarms.length,
                itemBuilder: (context, index) {
                  final farm = filteredFarms[index];
                  return FarmItemCard(
                    name: farm['name'],
                    category: farm['category'],
                    distance: farm['distance'],
                    products: farm['products'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
