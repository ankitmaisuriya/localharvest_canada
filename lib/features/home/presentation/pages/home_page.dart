import 'package:flutter/material.dart' hide SearchBar;
import 'package:localharvest_canada/core/widgets/responsive_layout.dart';
import 'package:localharvest_canada/features/home/presentation/widgets/bottom_nav_bar.dart';
import 'package:localharvest_canada/features/home/presentation/widgets/categories_list.dart';
import 'package:localharvest_canada/features/home/presentation/widgets/home_drawer.dart';
import 'package:localharvest_canada/features/home/presentation/widgets/nearby_farm_list.dart';
import 'package:localharvest_canada/features/home/presentation/widgets/products_list.dart';
import 'package:localharvest_canada/features/home/presentation/widgets/search_bar.dart';
import 'package:localharvest_canada/features/home/presentation/widgets/section_title.dart';
import 'package:localharvest_canada/features/home/presentation/widgets/top_banner.dart';
import 'package:localharvest_canada/features/map/presentation/pages/map_page.dart';
import 'package:localharvest_canada/features/nearby_farms/presentation/pages/nearby_farms_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          backgroundColor: const Color(0xFFFAFAFA),
          appBar: AppBar(
            backgroundColor: Colors.lightGreen,
            leading: Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu, color: Colors.white),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'LocalHarvest',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Fresh from nearby farms',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
                onPressed: () {
                  // Navigate to Cart
                },
              ),
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.white),
                onPressed: () {
                  // Navigate to Notifications
                },
              ),
            ],
          ),
          drawer: const HomeDrawer(),
          body: IndexedStack(
            index: _currentIndex,
            children: [
              _homeTab(),
              const MapPage(),
              const NearbyFarmsPage(),
              // const Center(child: Text('Favorites Screen')),
            ],
          ),
          bottomNavigationBar: BottomNavBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _homeTab(){
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 24),
      child: Column(
        children: [
          SizedBox(height: 8),
          const TopBanner(),
          SizedBox(height: 8),
          const SearchBar(),
          SizedBox(height: 8),
          const SectionTitle(title: 'Categories'),
          SizedBox(height: 8),
          const CategoriesList(),
          SizedBox(height: 8),
          const SectionTitle(title: 'Nearby Farms'),
          const NearbyFarmsList(),
          SizedBox(height: 8),
          const SectionTitle(title: 'Popular Products'),
          const ProductsList(),
          SizedBox(height: 36),
        ],
      ),
    );
  }
}


