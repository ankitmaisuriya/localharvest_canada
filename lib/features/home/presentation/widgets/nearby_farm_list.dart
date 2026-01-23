// nearby_farms_list.dart (horizontal list with shimmer)
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localharvest_canada/features/nearby_farms/presentation/widgets/farm_item_card.dart';
import 'package:shimmer/shimmer.dart';
import 'package:localharvest_canada/features/nearby_farms/presentation/cubit/nearby_farms_cubit.dart';
import 'package:localharvest_canada/features/nearby_farms/presentation/cubit/nearby_farms_state.dart';

class NearbyFarmsList extends StatelessWidget {
  const NearbyFarmsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: BlocBuilder<NearbyFarmsCubit, NearbyFarmState>(
        builder: (context, state) {
          if (state is NearbyFarmLoading) {
            return _buildShimmerList();
          }

          if (state is NearbyFarmLoaded) {
            if (state.nearbyFarms.isEmpty) {
              return const Center(child: Text("No nearby farms found."));
            }

            return ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: state.nearbyFarms.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final farm = state.nearbyFarms[index];
                return FarmItemCard(
                  imageUrl: farm.imageUrl,
                  name: farm.farmName,
                  categories: farm.categories.join(', '),
                  rating: farm.rating,
                  distance: farm.distance,
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
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 5,
      itemBuilder: (context, index) => Container(
        width: 120,
        margin: const EdgeInsets.only(right: 12),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
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
