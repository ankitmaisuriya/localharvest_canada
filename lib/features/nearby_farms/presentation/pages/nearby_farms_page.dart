// nearby_farms_page.dart (full vertical page)
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localharvest_canada/features/nearby_farms/presentation/widgets/farm_item_card.dart';
import 'package:shimmer/shimmer.dart';
import 'package:localharvest_canada/core/app_state/app_location.dart';
import 'package:localharvest_canada/features/nearby_farms/presentation/cubit/nearby_farms_cubit.dart';
import 'package:localharvest_canada/features/nearby_farms/presentation/cubit/nearby_farms_state.dart';


class NearbyFarmsPage extends StatefulWidget {
  const NearbyFarmsPage({super.key});

  @override
  State<NearbyFarmsPage> createState() => _NearbyFarmsPageState();
}

class _NearbyFarmsPageState extends State<NearbyFarmsPage> {
  @override
  void initState() {
    super.initState();
    _fetchNearbyFarms();
  }

  void _fetchNearbyFarms() async {
    while (AppLocation.currentPosition == null) {
      await Future.delayed(const Duration(milliseconds: 200));
    }

    final pos = AppLocation.currentPosition!;
    context.read<NearbyFarmsCubit>().fetchNearbyFarms(
      latitude: pos.latitude,
      longitude: pos.longitude,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nearby Farms")),
      body: BlocBuilder<NearbyFarmsCubit, NearbyFarmState>(
        builder: (context, state) {
          if (state is NearbyFarmLoading) return _buildShimmerList();

          if (state is NearbyFarmLoaded) {
            if (state.nearbyFarms.isEmpty) {
              return const Center(child: Text("No nearby farms found."));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.nearbyFarms.length,
              itemBuilder: (context, index) {
                final farm = state.nearbyFarms[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: FarmItemCard(
                    imageUrl: farm.imageUrl,
                    name: farm.farmName,
                    categories: farm.categories.join(', '),
                    rating: farm.rating,
                    distance: farm.distance,
                  ),
                );
              },
            );
          }

          if (state is NearbyFarmError) {
            return Center(
              child: Text(state.message, style: const TextStyle(color: Colors.red)),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildShimmerList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
