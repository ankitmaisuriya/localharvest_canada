import 'package:localharvest_canada/features/nearby_farms/domain/entities/farm.dart';

abstract class NearbyFarmsRepository {
  Future<List<Farm>> getNearbyFarms({
    required double latitude,
    required double longitude,
    required double radius,
  });
}
//This defines what the repository should do but not how it does it.