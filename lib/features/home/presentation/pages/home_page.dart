// home_page.dart
import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:localharvest_canada/features/home/presentation/widgets/nearby_farm_list.dart';
import 'package:localharvest_canada/features/nearby_farms/presentation/pages/nearby_farms_page.dart';
import 'package:localharvest_canada/core/app_state/app_location.dart';
import 'package:localharvest_canada/core/widgets/responsive_layout.dart';
import 'package:localharvest_canada/features/categories/presentation/widgets/categories_list.dart';
import 'package:localharvest_canada/features/home/presentation/widgets/bottom_nav_bar.dart';
import 'package:localharvest_canada/features/home/presentation/widgets/home_drawer.dart';
import 'package:localharvest_canada/features/home/presentation/widgets/products_list.dart';
import 'package:localharvest_canada/features/home/presentation/widgets/search_bar.dart';
import 'package:localharvest_canada/features/home/presentation/widgets/section_title.dart';
import 'package:localharvest_canada/features/home/presentation/widgets/top_banner.dart';
import 'package:localharvest_canada/features/map/presentation/pages/map_page.dart';
import 'package:localharvest_canada/features/nearby_farms/presentation/cubit/nearby_farms_cubit.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _showUserLocation();
    _fetchNearbyFarms();
  }

  /// Wait until location is available, then fetch nearby farms
  void _fetchNearbyFarms() async {
    while (AppLocation.currentPosition == null) {
      await Future.delayed(const Duration(milliseconds: 200));
    }

    final currentPosition = AppLocation.currentPosition!;
    context.read<NearbyFarmsCubit>().fetchNearbyFarms(
      latitude: currentPosition.latitude,
      longitude: currentPosition.longitude,
    );
  }

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
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(Icons.menu, color: Colors.white),
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
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          drawer: HomeDrawer(),
          body: IndexedStack(
            index: _currentIndex,
            children: [
              _homeTab(),
              const MapPage(),
              const NearbyFarmsPage(), // full page for nearby farms
            ],
          ),
          bottomNavigationBar: BottomNavBar(
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
          ),
        ),
      ),
    );
  }

  Widget _homeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: const [
          SizedBox(height: 8),
          TopBanner(),
          SizedBox(height: 8),
          SearchBar(),
          SizedBox(height: 8),
          SectionTitle(title: 'Categories'),
          SizedBox(height: 8),
          CategoriesList(),
          SizedBox(height: 8),
          SectionTitle(title: 'Nearby Farms'),
          NearbyFarmsList(), // horizontal scroll with shimmer
          SizedBox(height: 8),
          SectionTitle(title: 'Popular Products'),
          ProductsList(),
          SizedBox(height: 36),
        ],
      ),
    );
  }

  Future<void> _showUserLocation() async {
    final currentPosition = AppLocation.currentPosition;

    if (currentPosition != null) {
      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(
          currentPosition.latitude,
          currentPosition.longitude,
        );

        if (placemarks.isNotEmpty) {
          final placemark = placemarks.first;
          Fluttertoast.showToast(
            msg: 'Your Location: ${placemark.locality}, ${placemark.administrativeArea}',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.black87,
            textColor: Colors.white,
            fontSize: 16,
          );
        }
      } catch (e) {
        debugPrint("$e");
      }
    } else {
      Fluttertoast.showToast(
        msg: 'Could not fetch your location',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        fontSize: 16,
      );
    }
  }
}
